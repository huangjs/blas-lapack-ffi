#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdpbrfs_(char* uplo, int* n, int* kd, int* nrhs, double* ab, int* ldab, double* afb, int* ldafb, double* b, int* ldb, double* x, int* ldx, double* ferr, double* berr, double* work, int* iwork, int* info)
{
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_dpbrfs(uploC, *n, *kd, *nrhs, ab, *ldab, afb, *ldafb, b, *ldb, x, *ldx, ferr, berr, work, iwork, info);
}
