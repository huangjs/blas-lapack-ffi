/*
 * lapack_dlarrf.c
 *
 *This program is a C interface to dlarrf.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlarrf(const int n, const double * d, const double * l, const double * ld, const double * lld, const int ifirst, const int ilast, double * w, const double sigma, double * dplus, double * lplus, double * work, int * iwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_ifirst=ifirst, F77_ilast=ilast;
	#define F77_iwork iwork
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_ifirst ifirst
	#define F77_ilast ilast
	#define F77_iwork iwork
	#define F77_info info
#endif

	f77_dlarrf(&F77_n, d, l, ld, lld, &F77_ifirst, &F77_ilast, w, &sigma, dplus, lplus, work, F77_iwork, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
