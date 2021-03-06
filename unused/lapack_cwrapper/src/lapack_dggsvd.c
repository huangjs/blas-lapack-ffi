/*
 * lapack_dggsvd.c
 *
 *This program is a C interface to dggsvd.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dggsvd(const enum lapack_compute_ortho_type jobu, const enum lapack_compute_ortho_type jobv, const enum lapack_compute_ortho_type jobq, const int m, const int n, const int p, int * k, int * l, double * a, const int lda, double * b, const int ldb, double * alpha, double * beta, double * u, const int ldu, double * v, const int ldv, double * q, const int ldq, double * work, int * iwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_m=m, F77_n=n, F77_p=p, F77_lda=lda, F77_ldb=ldb, F77_ldu=ldu, F77_ldv=ldv, F77_ldq=ldq;
	int i_local;
	F77_INT F77_k[1];
	F77_INT F77_l[1];
	#define F77_iwork iwork
	F77_INT F77_info[1];
#else
	#define F77_m m
	#define F77_n n
	#define F77_p p
	#define F77_k k
	#define F77_l l
	#define F77_lda lda
	#define F77_ldb ldb
	#define F77_ldu ldu
	#define F77_ldv ldv
	#define F77_ldq ldq
	#define F77_iwork iwork
	#define F77_info info
#endif

#ifdef F77_CHAR
	F77_CHAR F77_jobu, F77_jobv, F77_jobq;
#else
	#define F77_jobu C_jobu
	#define F77_jobv C_jobv
	#define F77_jobq C_jobq
#endif

	char C_jobu=' ';
	if (jobu == lapack_compute_ortho_u) {
		 C_jobu = 'U';
	} else if (jobu == lapack_compute_ortho_v) {
		 C_jobu = 'V';
	} else if (jobu == lapack_compute_ortho_q) {
		 C_jobu = 'Q';
	} else if (jobu == lapack_do_not_compute_ortho) {
		 C_jobu = 'N';
	}

	char C_jobv=' ';
	if (jobv == lapack_compute_ortho_u) {
		 C_jobv = 'U';
	} else if (jobv == lapack_compute_ortho_v) {
		 C_jobv = 'V';
	} else if (jobv == lapack_compute_ortho_q) {
		 C_jobv = 'Q';
	} else if (jobv == lapack_do_not_compute_ortho) {
		 C_jobv = 'N';
	}

	char C_jobq=' ';
	if (jobq == lapack_compute_ortho_u) {
		 C_jobq = 'U';
	} else if (jobq == lapack_compute_ortho_v) {
		 C_jobq = 'V';
	} else if (jobq == lapack_compute_ortho_q) {
		 C_jobq = 'Q';
	} else if (jobq == lapack_do_not_compute_ortho) {
		 C_jobq = 'N';
	}

#ifdef F77_CHAR
	F77_jobu = C2F_CHAR(&C_jobu)
	F77_jobv = C2F_CHAR(&C_jobv)
	F77_jobq = C2F_CHAR(&C_jobq)
#endif

	f77_dggsvd(&F77_jobu, &F77_jobv, &F77_jobq, &F77_m, &F77_n, &F77_p, F77_k, F77_l, a, &F77_lda, b, &F77_ldb, alpha, beta, u, &F77_ldu, v, &F77_ldv, q, &F77_ldq, work, F77_iwork, F77_info);

#ifdef F77_INT
	k[0]=(int) F77_k[0];
	l[0]=(int) F77_l[0];
	info[0]=(int) F77_info[0];
#endif

}
