#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzspcon_(char* uplo, int* n, void* ap, int* ipiv, double* anorm, double* rcond, void* work, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_zspcon(uploC, *n, ap, ipiv, *anorm, rcond, work, info);
}
