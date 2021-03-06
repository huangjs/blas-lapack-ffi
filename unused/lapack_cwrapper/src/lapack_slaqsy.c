/*
 * lapack_slaqsy.c
 *
 *This program is a C interface to slaqsy.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_slaqsy(const enum lapack_uplo_type uplo, const int n, float * a, const int lda, const float * s, const float scond, const float amax, char * equed )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_lda=lda;
#else
	#define F77_n n
	#define F77_lda lda
#endif

#ifdef F77_CHAR
	F77_CHAR F77_uplo;
#else
	#define F77_uplo C_uplo
#endif

	char C_uplo=' ';
	if (uplo == lapack_upper) {
		 C_uplo = 'U';
	} else if (uplo == lapack_lower) {
		 C_uplo = 'L';
	}

#ifdef F77_CHAR
	F77_uplo = C2F_CHAR(&C_uplo)
#endif

#ifdef F77_CHAR
	F77_CHAR F77_equed = C2F_STR(equed, strlen(equed)) ;
#else
	#define F77_equed equed
#endif

	f77_slaqsy(&F77_uplo, &F77_n, a, &F77_lda, s, &scond, &amax, equed);

#ifdef F77_INT
#endif

}
