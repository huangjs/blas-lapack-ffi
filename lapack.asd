;;;; TODO: add copyright and license

(asdf:defsystem lapack
  :description "A LAPACK binding."
  :author "MSI"
  :version "0.2.20100315"
  :depends-on (:blas)
  :components
  ((:module src
	    :components ((:file "lapack"))
	    :serial t
	    )))

