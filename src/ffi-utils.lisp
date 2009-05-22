(in-package :msi.ffi-utils)

(defun make-static-array (dimensions &key element-type initial-element initial-contents)
  #+allegro
  (apply #'make-array
	 `(,dimensions
	   :element-type ,element-type
	   ,@(when initial-element `(:initial-element ,initial-element))
	   ,@(when initial-contents `(:initial-contents ,initial-contents))
	   :allocation :static-reclaimable))
  #+sbcl
  (progn
    (warn "SBCL does not support static array currently. Use them with macro with-arrays-as-foreign-arrays and turn of GC during foreign funcalls (e.g. sb-sys:without-gcing).")
    (apply #'make-array
	   `(,dimensions
	     :element-type ,element-type
	     ,@(when initial-element `(:initial-element ,initial-element))
	     ,@(when initial-contents `(:initial-contents ,initial-contents)))))
  #+lispworks
  (apply #'make-array
	 `(,dimensions
	   :element-type ,element-type
	   ,@(when initial-element `(:initial-element ,initial-element))
	   ,@(when initial-contents `(:initial-contents ,initial-contents))
	   :allocation :static))
  )


(defmacro with-safe-foreign-function-call-settings (&body body)
  #+allegro
  `(excl:without-interrupts ,@body)
  #+sbcl
  ;; sb-sys:without-gcing also works, but interrupting intel mkl calls
  ;; might crash SBCL.
  `(sb-sys:without-interrupts ,@body)
  #+lispworks
  `(lispworks:without-interrupts ,@body)
  )


(defmacro with-arrays-as-foreign-arrays ((&rest array-bindings) &body body)
  (declare (ignorable array-bindings))
  #+allegro
  `(locally ,@body)			;FIXME:
  #+sbcl
  (cond (array-bindings
	 `(sb-sys:with-pinned-objects ,(mapcar #'second array-bindings)
	    (let ,(mapcar (lambda (array-binding)
			    `(,(first array-binding)
			       (sb-sys:vector-sap (SB-KERNEL:%WITH-ARRAY-DATA ,(second array-binding) 0 0))))
		   array-bindings)
	      ,@body)))
	(t `(locally ,@body)))
  #+lispworks
  (labels ((build-exp (array-bindings &rest body)
	     (cond (array-bindings
		    `(fli:with-dynamic-lisp-array-pointer ,(first array-bindings)
		       ,(apply #'build-exp (rest array-bindings) body)))
		   (t`(locally ,@body)))))
    (apply #'build-exp array-bindings body)))

;;; defcfun for C functions and defffun for Fortran functions
(defmacro defcfun (name-and-options return-type &rest args)
  (multiple-value-bind (lisp-name foreign-name options)
      (cffi::parse-name-and-options name-and-options)
    (declare (ignorable lisp-name foreign-name options))
    (let* ((internal-lisp-name (intern (concatenate 'string "%" (symbol-name lisp-name))))
	   (docstring (when (stringp (car args)) (pop args))))
      (labels ((extract-array-bindings (args)
		 (loop for (var-name var-type) in args
		       if (let ((parsed-type (type-of (cffi::parse-type var-type))))
			    (or (and (listp var-type)
				     (eq (first var-type) :array))
				(and (or (eq parsed-type 'cffi::foreign-typedef)
					 (eq parsed-type 'cffi::enhanced-typedef))
				     (eq (type-of (cffi::actual-type parsed-type)) 'cffi::foreign-array-type))))
			 collect (list var-name var-type) into array-args
		       else
			 collect (list var-name var-type) into other-args
		       finally (return (values array-args other-args))))
	       (build-new-array-bindings-for-foreign-funcalls (array-args &rest body)
		 `(with-arrays-as-foreign-arrays ,(mapcar (lambda (array-arg)
							    (list (first array-arg) (first array-arg)))
							  array-args)
		    ,@body)))
	(let* ((array-args (extract-array-bindings args))
	       (body `(with-safe-foreign-function-call-settings
			(,internal-lisp-name ,@(mapcar #'car args))))
	       (args (loop for (var-name var-type) in args
			   if (let ((parsed-type (type-of (cffi::parse-type var-type))))
				(or (and (listp var-type)
					 (eq (first var-type) :array))
				    (and (or (eq parsed-type 'cffi::foreign-typedef)
					     (eq parsed-type 'cffi::enhanced-typedef))
					 (eq (type-of (cffi::actual-type parsed-type)) 'cffi::foreign-array-type))))
			     collect (list var-name :pointer)
			   else
			     collect (list var-name var-type))))
	  (when array-args
	    (setf body (build-new-array-bindings-for-foreign-funcalls array-args body)))
	  `(progn
	     (declaim (inline ,internal-lisp-name))
	     (cffi:defcfun (,internal-lisp-name ,foreign-name) ,return-type ,@args)
	     (defun ,lisp-name ,(mapcar #'car args)
	       ,@(ensure-list docstring)
	       ,body)))))))


;;; defcfun for fortran calling convention
;;; TODO: test passing structs
(defmacro defffun (name-and-options return-type &rest args)
  (labels ((extract-pass-by-reference-args (args)
	     (loop for (var-name var-type) in args
		   if (let ((parsed-type (type-of (cffi::parse-type var-type))))
			(or (eq parsed-type 'cffi::foreign-pointer-type)
			    (eq parsed-type 'cffi::foreign-array-type)
			    (eq parsed-type 'cffi::foreign-struct-type)
			    (and (or (eq parsed-type 'cffi::foreign-typedef)
				     (eq parsed-type 'cffi::enhanced-typedef))
				 (eq (type-of (cffi::actual-type parsed-type)) 'cffi::foreign-pointer-type))))
		     collect (list var-name var-type) into pass-by-reference-args
		   else
		     collect (list var-name var-type) into other-args
		   finally (return (values pass-by-reference-args other-args))))
	   (extract-string-args (args)
	     (loop for (var-name var-type) in args
		   if (let ((parsed-type (type-of (cffi::parse-type var-type))))
			(or (member var-type '(:char :string))
			    (and (or (eq parsed-type 'cffi::foreign-typedef)
				     (eq parsed-type 'cffi::enhanced-typedef))
				 (eq (type-of (cffi::actual-type parsed-type)) 'cffi::foreign-string-type))))
		     collect (list var-name var-type) into string-args
		   else
		     collect (list var-name var-type) into other-args
		   finally (return (values string-args other-args))))
	   (process-args (args)
	     (multiple-value-bind (pass-by-reference-args other-args)
		 (extract-pass-by-reference-args args)
	       (multiple-value-bind (string-args other-args)
		   (extract-string-args other-args)
		 (values other-args pass-by-reference-args string-args)))))
    (multiple-value-bind (lisp-name foreign-name options)
	(cffi::parse-name-and-options name-and-options)
      (declare (ignorable lisp-name foreign-name options))
      (let* ((internal-lisp-name (intern (concatenate 'string "%" (symbol-name lisp-name))))
	     (foreign-name (concatenate 'string foreign-name "_"))
	     (docstring (when (stringp (car args)) (pop args))))
	(multiple-value-bind (immediate-args pointer-args string-args)
	    (process-args args)
	  (assert (and (null (intersection immediate-args pointer-args :key #'first))
		       (null (intersection immediate-args string-args :key #'first))
		       (null (intersection pointer-args string-args :key #'first))))
	  (let* ((temp-arg-names (mapcar (lambda (binding)
					   (cons (first binding) (gensym (symbol-name (first binding)))))
					 immediate-args))
		 (temp-bindings (mapcar (lambda (name binding)
					  (list (cdr name) (second binding)))
					temp-arg-names immediate-args))
		 (temp-string-arg-names (mapcar (lambda (binding)
						  (cons (first binding) (gensym (symbol-name (first binding)))))
						string-args))
		 (temp-string-bindings (mapcar (lambda (name binding)
						 (list (cdr name) (first binding)))
					       temp-string-arg-names string-args)))
	    (labels ((build-body-with-foreign-objects-decls (&rest body)
		       `(cffi:with-foreign-objects ,temp-bindings
			  (setf
			   ,@(loop for binding in immediate-args
				   for temp-var in temp-arg-names
				   collect `(cffi:mem-ref ,(cdr temp-var) ,(second binding))
				   collect `,(first binding)))
			  (locally ,@body)))
		     (build-body-with-foreign-strings-decls (&rest body)
		       `(cffi:with-foreign-strings ,temp-string-bindings
			  ,@body))
		     (substitute-args-with-temp-names (args)
		       (loop for arg in args
			     for temp-var-name = (or (cdr (assoc (first arg) temp-arg-names))
						     (cdr (assoc (first arg) temp-string-arg-names)))
			     if temp-var-name
			       collect temp-var-name
			     else
			       collect (first arg)))
		     (extract-array-bindings (args)
		       (loop for (var-name var-type) in args
			     if (let ((parsed-type (type-of (cffi::parse-type var-type))))
				  (or (and (listp var-type)
					   (eq (first var-type) :array))
				      (and (or (eq parsed-type 'cffi::foreign-typedef)
					       (eq parsed-type 'cffi::enhanced-typedef))
					   (eq (type-of (cffi::actual-type parsed-type)) 'cffi::foreign-array-type))))
			       collect (list var-name var-type) into array-args
			     else
			       collect (list var-name var-type) into other-args
			     finally (return (values array-args other-args))))
		     (build-new-array-bindings-for-foreign-funcalls (array-args &rest body)
		       `(with-arrays-as-foreign-arrays ,(mapcar (lambda (array-arg)
								  (list (first array-arg) (first array-arg)))
								array-args)
			  ,@body)))
	      (let* ((array-args (extract-array-bindings args))
		     (body `(with-safe-foreign-function-call-settings
			      (,internal-lisp-name ,@(substitute-args-with-temp-names args)))))
		(when array-args
		  (setf body (build-new-array-bindings-for-foreign-funcalls array-args body)))
		(when string-args
		  (setf body (build-body-with-foreign-strings-decls body)))
		(when immediate-args
		  (setf body (build-body-with-foreign-objects-decls body))) 
		`(progn
		   (declaim (inline ,internal-lisp-name))
		   (cffi:defcfun (,internal-lisp-name ,foreign-name) ,return-type
		     ,@(mapcar (lambda (a) (list (first a) :pointer)) args))
		   (defun ,lisp-name ,(mapcar #'car args)
		     ,@(ensure-list docstring)
		     ,body))))))))))