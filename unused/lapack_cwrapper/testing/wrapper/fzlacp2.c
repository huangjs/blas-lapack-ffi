#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlacp2_(char* uplo, int* m, int* n, double* a, int* lda, void* b, int* ldb)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_zlacp2(uploC, *m, *n, a, *lda, b, *ldb);
}
