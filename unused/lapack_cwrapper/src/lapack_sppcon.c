/*
 * lapack_sppcon.c
 *
 *This program is a C interface to sppcon.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_sppcon(const enum lapack_uplo_type uplo, const int n, const float * ap, const float anorm, float * rcond, float * work, int * iwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n;
	#define F77_iwork iwork
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_iwork iwork
	#define F77_info info
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

	f77_sppcon(&F77_uplo, &F77_n, ap, &anorm, rcond, work, F77_iwork, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
