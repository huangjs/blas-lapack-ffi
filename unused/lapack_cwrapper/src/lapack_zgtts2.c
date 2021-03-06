/*
 * lapack_zgtts2.c
 *
 *This program is a C interface to zgtts2.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_zgtts2(const int itrans, const int n, const int nrhs, const void * dl, const void * d, const void * du, const void * du2, const int * ipiv, void * b, const int ldb )
{
#ifdef F77_INT
	F77_INT F77_itrans=itrans, F77_n=n, F77_nrhs=nrhs, F77_ldb=ldb;
	int i_local;
	F77_INT F77_ipiv[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_ipiv[i_local]=(F77_INT) ipiv[i_local];
	}
#else
	#define F77_itrans itrans
	#define F77_n n
	#define F77_nrhs nrhs
	#define F77_ipiv ipiv
	#define F77_ldb ldb
#endif

	f77_zgtts2(&F77_itrans, &F77_n, &F77_nrhs, dl, d, du, du2, F77_ipiv, b, &F77_ldb);

#ifdef F77_INT
#endif

}
