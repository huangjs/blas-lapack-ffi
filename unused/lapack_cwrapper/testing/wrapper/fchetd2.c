#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fchetd2_(char* uplo, int* n, void* a, int* lda, float* d, float* e, void* tau, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_chetd2(uploC, *n, a, *lda, d, e, tau, info);
}
