/*
 * lapack_slalsd.c
 *
 *This program is a C interface to slalsd.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_slalsd(const enum lapack_uplo_type uplo, const int smlsiz, const int n, const int nrhs, float * d, float * e, float * b, const int ldb, const float rcond, int * rank, float * work, int * iwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_smlsiz=smlsiz, F77_n=n, F77_nrhs=nrhs, F77_ldb=ldb;
	int i_local;
	F77_INT F77_rank[1];
	#define F77_iwork iwork
	F77_INT F77_info[1];
#else
	#define F77_smlsiz smlsiz
	#define F77_n n
	#define F77_nrhs nrhs
	#define F77_ldb ldb
	#define F77_rank rank
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

	f77_slalsd(&F77_uplo, &F77_smlsiz, &F77_n, &F77_nrhs, d, e, b, &F77_ldb, &rcond, F77_rank, work, F77_iwork, F77_info);

#ifdef F77_INT
	rank[0]=(int) F77_rank[0];
	info[0]=(int) F77_info[0];
#endif

}
