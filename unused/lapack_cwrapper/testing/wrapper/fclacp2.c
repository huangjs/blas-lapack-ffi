#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclacp2_(char* uplo, int* m, int* n, float* a, int* lda, void* b, int* ldb)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_clacp2(uploC, *m, *n, a, *lda, b, *ldb);
}
