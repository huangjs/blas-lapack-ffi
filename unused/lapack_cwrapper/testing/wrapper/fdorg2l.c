#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fdorg2l_(int* m, int* n, int* k, double* a, int* lda, double* tau, double* work, int* info)
{
	lapack_dorg2l(*m, *n, *k, a, *lda, tau, work, info);
}
