/*
 * lapack_cgeqp3.c
 *
 *This program is a C interface to cgeqp3.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_cgeqp3(const int m, const int n, void * a, const int lda, int * jpvt, void * tau, void * work, const int lwork, float * rwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_m=m, F77_n=n, F77_lda=lda, F77_lwork=lwork;
	int i_local;
	F77_INT F77_jpvt[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_jpvt[i_local]=(F77_INT) jpvt[i_local];
	}
	F77_INT F77_info[1];
#else
	#define F77_m m
	#define F77_n n
	#define F77_lda lda
	#define F77_jpvt jpvt
	#define F77_lwork lwork
	#define F77_info info
#endif

	f77_cgeqp3(&F77_m, &F77_n, a, &F77_lda, F77_jpvt, tau, work, &F77_lwork, rwork, F77_info);

#ifdef F77_INT
	for(i_local=0;i_local<n*1;i_local++) {
		jpvt[i_local]=(int) F77_jpvt[i_local];
	}

	info[0]=(int) F77_info[0];
#endif

}
