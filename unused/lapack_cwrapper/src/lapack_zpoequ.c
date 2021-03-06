/*
 * lapack_zpoequ.c
 *
 *This program is a C interface to zpoequ.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_zpoequ(const int n, const void * a, const int lda, double * s, double * scond, double * amax, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_lda=lda;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_lda lda
	#define F77_info info
#endif

	f77_zpoequ(&F77_n, a, &F77_lda, s, scond, amax, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
