#include "../../include/lapack_enum.h"
#include "../../include/lapack.h"
void fzhpevd_(char* jobz, char* uplo, int* n, void* ap, double* w, void* z, int* ldz, void* work, int* lwork, double* rwork, int* lrwork, int* iwork, int* liwork, int* info)
{
	enum lapack_compute_vectors_type jobzC;
	if (*jobz=='N') jobzC = lapack_no_compute_vectors;
	else if(*jobz=='V') jobzC = lapack_compute_vectors;
	else jobzC = 0;
	enum lapack_uplo_type uploC;
	if (*uplo=='U') uploC = lapack_upper;
	else if(*uplo=='L') uploC = lapack_lower;
	else uploC = 0;
	lapack_zhpevd(jobzC, uploC, *n, ap, w, z, *ldz, work, *lwork, rwork, *lrwork, iwork, *liwork, info);
}
