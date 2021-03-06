/*
 * lapack_dlaqps.c
 *
 *This program is a C interface to dlaqps.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlaqps(const int m, const int n, const int offset, const int nb, int * kb, double * a, const int lda, int * jpvt, double * tau, double * vn1, double * vn2, double * auxv, double * f, const int ldf )
{
#ifdef F77_INT
	F77_INT F77_m=m, F77_n=n, F77_offset=offset, F77_nb=nb, F77_lda=lda, F77_ldf=ldf;
	int i_local;
	F77_INT F77_kb[1];
	F77_INT F77_jpvt[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_jpvt[i_local]=(F77_INT) jpvt[i_local];
	}
#else
	#define F77_m m
	#define F77_n n
	#define F77_offset offset
	#define F77_nb nb
	#define F77_kb kb
	#define F77_lda lda
	#define F77_jpvt jpvt
	#define F77_ldf ldf
#endif

	f77_dlaqps(&F77_m, &F77_n, &F77_offset, &F77_nb, F77_kb, a, &F77_lda, F77_jpvt, tau, vn1, vn2, auxv, f, &F77_ldf);

#ifdef F77_INT
	kb[0]=(int) F77_kb[0];
	for(i_local=0;i_local<n*1;i_local++) {
		jpvt[i_local]=(int) F77_jpvt[i_local];
	}

#endif

}
