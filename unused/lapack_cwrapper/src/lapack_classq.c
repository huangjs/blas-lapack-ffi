/*
 * lapack_classq.c
 *
 *This program is a C interface to classq.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_classq(const int n, const void * x, const int incx, float * scale, float * sumsq )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_incx=incx;
#else
	#define F77_n n
	#define F77_incx incx
#endif

	f77_classq(&F77_n, x, &F77_incx, scale, sumsq);

#ifdef F77_INT
#endif

}
