/*
 * lapack_cgesvd.c
 *
 *This program is a C interface to cgesvd.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_cgesvd(const enum lapack_compute_svd_type jobu, const enum lapack_compute_svd_type jobvt, const int m, const int n, void * a, const int lda, float * s, void * u, const int ldu, void * vt, const int ldvt, void * work, const int lwork, float * rwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_m=m, F77_n=n, F77_lda=lda, F77_ldu=ldu, F77_ldvt=ldvt, F77_lwork=lwork;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_m m
	#define F77_n n
	#define F77_lda lda
	#define F77_ldu ldu
	#define F77_ldvt ldvt
	#define F77_lwork lwork
	#define F77_info info
#endif

#ifdef F77_CHAR
	F77_CHAR F77_jobu, F77_jobvt;
#else
	#define F77_jobu C_jobu
	#define F77_jobvt C_jobvt
#endif

	char C_jobu=' ';
	if (jobu == lapack_all_matrix) {
		 C_jobu = 'A';
	} else if (jobu == lapack_overwritte_u) {
		 C_jobu = 'S';
	} else if (jobu == lapack_overwritte_a) {
		 C_jobu = 'O';
	} else if (jobu == lapack_no_singular_vectors) {
		 C_jobu = 'N';
	}

	char C_jobvt=' ';
	if (jobvt == lapack_all_matrix) {
		 C_jobvt = 'A';
	} else if (jobvt == lapack_overwritte_u) {
		 C_jobvt = 'S';
	} else if (jobvt == lapack_overwritte_a) {
		 C_jobvt = 'O';
	} else if (jobvt == lapack_no_singular_vectors) {
		 C_jobvt = 'N';
	}

#ifdef F77_CHAR
	F77_jobu = C2F_CHAR(&C_jobu)
	F77_jobvt = C2F_CHAR(&C_jobvt)
#endif

	f77_cgesvd(&F77_jobu, &F77_jobvt, &F77_m, &F77_n, a, &F77_lda, s, u, &F77_ldu, vt, &F77_ldvt, work, &F77_lwork, rwork, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
