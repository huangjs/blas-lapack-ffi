/*
 * lapack_csysvx.c
 *
 *This program is a C interface to csysvx.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_csysvx(const enum lapack_fact_type fact, const enum lapack_uplo_type uplo, const int n, const int nrhs, const void * a, const int lda, void * af, const int ldaf, int * ipiv, const void * b, const int ldb, void * x, const int ldx, float * rcond, float * ferr, float * berr, void * work, const int lwork, float * rwork, int * info )
{
#ifdef F77_INT
	F77_INT F77_n=n, F77_nrhs=nrhs, F77_lda=lda, F77_ldaf=ldaf, F77_ldb=ldb, F77_ldx=ldx, F77_lwork=lwork;
	int i_local;
	F77_INT F77_ipiv[n*1];
	for(i_local=0;i_local<n*1;i_local++) {
		F77_ipiv[i_local]=(F77_INT) ipiv[i_local];
	}
	F77_INT F77_info[1];
#else
	#define F77_n n
	#define F77_nrhs nrhs
	#define F77_lda lda
	#define F77_ldaf ldaf
	#define F77_ipiv ipiv
	#define F77_ldb ldb
	#define F77_ldx ldx
	#define F77_lwork lwork
	#define F77_info info
#endif

#ifdef F77_CHAR
	F77_CHAR F77_fact, F77_uplo;
#else
	#define F77_fact C_fact
	#define F77_uplo C_uplo
#endif

	char C_fact=' ';
	if (fact == lapack_fact_f) {
		 C_fact = 'F';
	} else if (fact == lapack_fact_n) {
		 C_fact = 'N';
	} else if (fact == lapack_fact_e) {
		 C_fact = 'E';
	}

	char C_uplo=' ';
	if (uplo == lapack_upper) {
		 C_uplo = 'U';
	} else if (uplo == lapack_lower) {
		 C_uplo = 'L';
	}

#ifdef F77_CHAR
	F77_fact = C2F_CHAR(&C_fact)
	F77_uplo = C2F_CHAR(&C_uplo)
#endif

	f77_csysvx(&F77_fact, &F77_uplo, &F77_n, &F77_nrhs, a, &F77_lda, af, &F77_ldaf, F77_ipiv, b, &F77_ldb, x, &F77_ldx, rcond, ferr, berr, work, &F77_lwork, rwork, F77_info);

#ifdef F77_INT
	for(i_local=0;i_local<n*1;i_local++) {
		ipiv[i_local]=(int) F77_ipiv[i_local];
	}

	info[0]=(int) F77_info[0];
#endif

}
