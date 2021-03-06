#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fsormr3_(char* side, char* trans, int* m, int* n, int* k, int* l, float* a, int* lda, float* tau, float* c, int* ldc, float* work, int* info)
{
	enum lapack_side_type sideC;
	if (*side=='L') sideC = lapack_left_side;
	else if(*side=='R') sideC = lapack_right_side;
	else sideC = 0;
	enum lapack_trans_type transC;
	if (*trans=='N') transC = lapack_no_trans;
	else if(*trans=='T') transC = lapack_trans;
	else if(*trans=='C') transC = lapack_conj_trans;
	else transC = 0;
	lapack_sormr3(sideC, transC, *m, *n, *k, *l, a, *lda, tau, c, *ldc, work, info);
}
