/*
 * lapack_dptcon.c
 *
 *This program is a C interface to dptcon.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dptcon(const int n, const double * d, const double * e, const double anorm, double * rcond, double * work, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_info info
#endif

	f77_dptcon(&F77_n, d, e, &anorm, rcond, work, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
