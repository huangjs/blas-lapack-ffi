#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fcggbak_(char* job, char* side, int* n, int* ilo, int* ihi, float* lscale, float* rscale, int* m, void* v, int* ldv, int* info)
{
	enum lapack_balance_type jobC;
	if (*job=='N') jobC = lapack_nothing;
	else if(*job=='P') jobC = lapack_permute;
	else if(*job=='S') jobC = lapack_scale;
	else if(*job=='B') jobC = lapack_permute_scale;
	else jobC = 0;
	enum lapack_side_type sideC;
	if (*side=='L') sideC = lapack_left_side;
	else if(*side=='R') sideC = lapack_right_side;
	else sideC = 0;
	lapack_cggbak(jobC, sideC, *n, *ilo, *ihi, lscale, rscale, *m, v, *ldv, info);
}
