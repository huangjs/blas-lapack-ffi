/*
 * lapack_drscl.c
 *
 *This program is a C interface to drscl.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_drscl(const int n, const double sa, double * sx, const int incx )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_incx=incx;
#else
	#define F77_n n
	#define F77_incx incx
#endif

	f77_drscl(&F77_n, &sa, sx, &F77_incx);

#ifdef F77_INT
#endif

}
