/*
 * lapack_stbtrs.c
 *
 *This program is a C interface to stbtrs.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_stbtrs(const enum lapack_uplo_type uplo, const enum lapack_trans_type trans, const enum lapack_diag_type diag, const int n, const int kd, const int nrhs, const float * ab, const int ldab, float * b, const int ldb, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_kd=kd, F77_nrhs=nrhs, F77_ldab=ldab, F77_ldb=ldb;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_kd kd
	#define F77_nrhs nrhs
	#define F77_ldab ldab
	#define F77_ldb ldb
	#define F77_info info
#endif

#ifdef F77_CHAR
	F77_CHAR F77_uplo, F77_trans, F77_diag;
#else
	#define F77_uplo C_uplo
	#define F77_trans C_trans
	#define F77_diag C_diag
#endif

	char C_uplo=' ';
	if (uplo == lapack_upper) {
		 C_uplo = 'U';
	} else if (uplo == lapack_lower) {
		 C_uplo = 'L';
	}

	char C_trans=' ';
	if (trans == lapack_no_trans) {
		 C_trans = 'N';
	} else if (trans == lapack_trans) {
		 C_trans = 'T';
	} else if (trans == lapack_conj_trans) {
		 C_trans = 'C';
	}

	char C_diag=' ';
	if (diag == lapack_non_unit_diag) {
		 C_diag = 'N';
	} else if (diag == lapack_unit_diag) {
		 C_diag = 'U';
	}

#ifdef F77_CHAR
	F77_uplo = C2F_CHAR(&C_uplo)
	F77_trans = C2F_CHAR(&C_trans)
	F77_diag = C2F_CHAR(&C_diag)
#endif

	f77_stbtrs(&F77_uplo, &F77_trans, &F77_diag, &F77_n, &F77_kd, &F77_nrhs, ab, &F77_ldab, b, &F77_ldb, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
