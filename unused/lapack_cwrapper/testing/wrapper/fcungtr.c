#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcungtr_(char* uplo, int* n, void* a, int* lda, void* tau, void* work, int* lwork, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_cungtr(uploC, *n, a, *lda, tau, work, *lwork, info);
}
