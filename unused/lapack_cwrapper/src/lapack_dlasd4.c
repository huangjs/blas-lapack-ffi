/*
 * lapack_dlasd4.c
 *
 *This program is a C interface to dlasd4.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlasd4(const int n, const int i, const double * d, const double * z, double * delta, const double rho, double * sigma, double * work, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_i=i;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_i i
	#define F77_info info
#endif

	f77_dlasd4(&F77_n, &F77_i, d, z, delta, &rho, sigma, work, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
