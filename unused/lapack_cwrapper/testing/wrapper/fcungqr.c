#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcungqr_(int* m, int* n, int* k, void* a, int* lda, void* tau, void* work, int* lwork, int* info)
{
	lapack_cungqr(*m, *n, *k, a, *lda, tau, work, *lwork, info);
}
