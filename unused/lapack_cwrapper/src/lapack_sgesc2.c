/*
 * lapack_sgesc2.c
 *
 *This program is a C interface to sgesc2.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_sgesc2(const int n, const float * a, const int lda, float * rhs, const int * ipiv, const int * jpiv, float * scale )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_lda=lda;
	int i_local;
	F77_INT F77_ipiv[n*.];
	for(i_local=0;i_local<n*.;i_local++) {
		F77_ipiv[i_local]=(F77_INT) ipiv[i_local];
	}
	F77_INT F77_jpiv[n*.];
	for(i_local=0;i_local<n*.;i_local++) {
		F77_jpiv[i_local]=(F77_INT) jpiv[i_local];
	}
#else
	#define F77_n n
	#define F77_lda lda
	#define F77_ipiv ipiv
	#define F77_jpiv jpiv
#endif

	f77_sgesc2(&F77_n, a, &F77_lda, rhs, F77_ipiv, F77_jpiv, scale);

#ifdef F77_INT
#endif

}
