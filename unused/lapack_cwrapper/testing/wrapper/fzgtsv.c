#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzgtsv_(int* n, int* nrhs, void* dl, void* d, void* du, void* b, int* ldb, int* info)
{
	lapack_zgtsv(*n, *nrhs, dl, d, du, b, *ldb, info);
}
