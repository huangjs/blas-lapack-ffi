#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzlanht_(double* output, char* norm, int* n, double* d, void* e)
{
	enum lapack_norm_type normC;
	if (*norm=='1' || *norm=='O') normC = lapack_one_norm;
	else if(*norm=='I') normC = lapack_inf_norm;
	else if(*norm=='M') normC = lapack_max_norm;
	else if(*norm=='F') normC = lapack_frobenius_norm;
	else normC = 0;
	*output = lapack_zlanht( normC, *n, d, e);
}
