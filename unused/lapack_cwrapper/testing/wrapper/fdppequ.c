#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdppequ_(char* uplo, int* n, double* ap, double* s, double* scond, double* amax, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_dppequ(uploC, *n, ap, s, scond, amax, info);
}
