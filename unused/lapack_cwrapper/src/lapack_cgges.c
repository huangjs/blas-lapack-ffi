/*
 * lapack_cgges.c
 *
 *This program is a C interface to cgges.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_cgges(const enum lapack_compute_vectors_type jobvsl, const enum lapack_compute_vectors_type jobvsr, const enum lapack_ordering_type sort, const long int (*selctg) (void*,void*), const int n, void * a, const int lda, void * b, const int ldb, int * sdim, void * alpha, void * beta, void * vsl, const int ldvsl, void * vsr, const int ldvsr, void * work, const int lwork, float * rwork, long int * bwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_lda=lda, F77_ldb=ldb, F77_ldvsl=ldvsl, F77_ldvsr=ldvsr, F77_lwork=lwork;
	int i_local;
	F77_INT F77_sdim[1];
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_lda lda
	#define F77_ldb ldb
	#define F77_sdim sdim
	#define F77_ldvsl ldvsl
	#define F77_ldvsr ldvsr
	#define F77_lwork lwork
	#define F77_info info
#endif

#ifdef F77_LOG
;
	#define F77_bwork bwork
#else
	#define F77_bwork bwork
#endif

#ifdef F77_CHAR
	F77_CHAR F77_jobvsl, F77_jobvsr, F77_sort;
#else
	#define F77_jobvsl C_jobvsl
	#define F77_jobvsr C_jobvsr
	#define F77_sort C_sort
#endif

	char C_jobvsl=' ';
	if (jobvsl == lapack_no_compute_vectors) {
		 C_jobvsl = 'N';
	} else if (jobvsl == lapack_compute_vectors) {
		 C_jobvsl = 'V';
	}

	char C_jobvsr=' ';
	if (jobvsr == lapack_no_compute_vectors) {
		 C_jobvsr = 'N';
	} else if (jobvsr == lapack_compute_vectors) {
		 C_jobvsr = 'V';
	}

	char C_sort=' ';
	if (sort == lapack_do_order) {
		 C_sort = 'S';
	} else if (sort == lapack_not_order) {
		 C_sort = 'N';
	}

#ifdef F77_CHAR
	F77_jobvsl = C2F_CHAR(&C_jobvsl)
	F77_jobvsr = C2F_CHAR(&C_jobvsr)
	F77_sort = C2F_CHAR(&C_sort)
#endif

	f77_cgges(&F77_jobvsl, &F77_jobvsr, &F77_sort, selctg, &F77_n, a, &F77_lda, b, &F77_ldb, F77_sdim, alpha, beta, vsl, &F77_ldvsl, vsr, &F77_ldvsr, work, &F77_lwork, rwork, F77_bwork, F77_info);

#ifdef F77_INT
	sdim[0]=(int) F77_sdim[0];
	info[0]=(int) F77_info[0];
#endif

#ifdef F77_LOG
#endif

}
