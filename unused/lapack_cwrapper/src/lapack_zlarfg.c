/*
 * lapack_zlarfg.c
 *
 *This program is a C interface to zlarfg.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_zlarfg(const int n, void * alpha, void * x, const int incx, void * tau )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_incx=incx;
#else
	#define F77_n n
	#define F77_incx incx
#endif

	f77_zlarfg(&F77_n, alpha, x, &F77_incx, tau);

#ifdef F77_INT
#endif

}
