/*
 * lapack_dlasdq.c
 *
 *This program is a C interface to dlasdq.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_dlasdq(const enum lapack_uplo_type uplo, const int sqre, const int n, const int ncvt, const int nru, const int ncc, double * d, double * e, double * vt, const int ldvt, double * u, const int ldu, double * c, const int ldc, double * work, int * info )
{
#ifdef F77_INT
	F77_INT F77_sqre=sqre, F77_n=n, F77_ncvt=ncvt, F77_nru=nru, F77_ncc=ncc, F77_ldvt=ldvt, F77_ldu=ldu, F77_ldc=ldc;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_sqre sqre
	#define F77_n n
	#define F77_ncvt ncvt
	#define F77_nru nru
	#define F77_ncc ncc
	#define F77_ldvt ldvt
	#define F77_ldu ldu
	#define F77_ldc ldc
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

	f77_dlasdq(&F77_uplo, &F77_sqre, &F77_n, &F77_ncvt, &F77_nru, &F77_ncc, d, e, vt, &F77_ldvt, u, &F77_ldu, c, &F77_ldc, work, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
