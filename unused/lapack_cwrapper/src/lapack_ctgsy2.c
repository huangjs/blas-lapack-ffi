/*
 * lapack_ctgsy2.c
 *
 *This program is a C interface to ctgsy2.
 *
 * Written by Remi Delmas.
 *
 */

#include "../include/lapack_f77.h"
#include "../include/lapack_enum.h"
#include "../include/lapack_aux.h"

void lapack_ctgsy2(const enum lapack_trans_type trans, const int ijob, const int m, const int n, const void * a, const int lda, const void * b, const int ldb, void * c, const int ldc, const void * d, const int ldd, const void * e, const int lde, void * f, const int ldf, float * scale, float * rdsum, float * rdscal, int * info )
{
#ifdef F77_INT
	F77_INT F77_ijob=ijob, F77_m=m, F77_n=n, F77_lda=lda, F77_ldb=ldb, F77_ldc=ldc, F77_ldd=ldd, F77_lde=lde, F77_ldf=ldf;
	int i_local;
	F77_INT F77_info[1];
#else
	#define F77_ijob ijob
	#define F77_m m
	#define F77_n n
	#define F77_lda lda
	#define F77_ldb ldb
	#define F77_ldc ldc
	#define F77_ldd ldd
	#define F77_lde lde
	#define F77_ldf ldf
	#define F77_info info
#endif

#ifdef F77_CHAR
	F77_CHAR F77_trans;
#else
	#define F77_trans C_trans
#endif

	char C_trans=' ';
	if (trans == lapack_no_trans) {
		 C_trans = 'N';
	} else if (trans == lapack_trans) {
		 C_trans = 'T';
	} else if (trans == lapack_conj_trans) {
		 C_trans = 'C';
	}

#ifdef F77_CHAR
	F77_trans = C2F_CHAR(&C_trans)
#endif

	f77_ctgsy2(&F77_trans, &F77_ijob, &F77_m, &F77_n, a, &F77_lda, b, &F77_ldb, c, &F77_ldc, d, &F77_ldd, e, &F77_lde, f, &F77_ldf, scale, rdsum, rdscal, F77_info);

#ifdef F77_INT
	info[0]=(int) F77_info[0];
#endif

}
