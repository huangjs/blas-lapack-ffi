#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fclar1v_(int* n, int* b1, int* bn, float* sigma, float* l, float* d, float* ld, float* lld, float* gersch, void* z, float* ztz, float* mingma, int* r, int* isuppz, float* work)
{
	lapack_clar1v(*n, *b1, *bn, *sigma, l, d, ld, lld, gersch, z, ztz, mingma, r, isuppz, work);
}
