/*
 * lapack_claesy.c
 *
 *This program is a C interface to claesy.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_claesy(const void * a, const void * b, const void * c, void * rt1, void * rt2, void * evscal, void * cs1, void * sn1 )
{
#ifdef F77_INT
#else
#endif

	f77_claesy(a, b, c, rt1, rt2, evscal, cs1, sn1);

#ifdef F77_INT
#endif

}
