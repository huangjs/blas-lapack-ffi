#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzpbtrf_(char* uplo, int* n, int* kd, void* ab, int* ldab, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_zpbtrf(uploC, *n, *kd, ab, *ldab, info);
}
