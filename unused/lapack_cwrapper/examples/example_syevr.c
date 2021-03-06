#include <stddef.h>
#include <sys/time.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "cblas.h"
#include "../include/lapack.h"

int main(int argc, char **argv){

	
	int n, lda;
	double *A, *Acopy, *work, *w;
	int info, lwork;
	int i,j;
	double t1,t2,elapsed;
	struct timeval tp;
	int rtn;
	double normr, normb;
	int liwork;
	int* iwork;
	int m;
	double *z;
	int* isuppz;

	n = 300; lda = 300;

	A = (double *)malloc(lda*n*sizeof(double)) ;
	if (A==NULL){ printf("error of memory allocation\n"); exit(0); }
	Acopy = (double *)malloc(lda*n*sizeof(double)) ;
	if (Acopy==NULL){ printf("error of memory allocation\n"); exit(0); }
	w=(double*)malloc(n*sizeof(double));
	
	for(i=0;i<lda*n;i++)
		A[i] = ((double) rand()) / ((double) RAND_MAX) - 0.5;
	for(i=0;i<n;i++)
	{
		for(j=0;j<n;j++)
			A[i+lda*j]=A[j+lda*i];
	}

    cblas_dcopy(lda*n,A,1,Acopy,1); 


	z = (double *)malloc(lda*n*sizeof(double)) ;
	isuppz = (int *)malloc(2*n*sizeof(int)) ;
	work=malloc(sizeof(double));
	iwork=malloc(sizeof(int));
	liwork = -1;
	lapack_dsyevr( lapack_compute_vectors, lapack_range_all, lapack_upper, n,  A, lda, 0., 0., 0, 0, 1e-14, &m, w, z, lda, isuppz, work, lwork, iwork, liwork, &info); 

	liwork=iwork[0];
	free(iwork);
	iwork=malloc(liwork*sizeof(int));
	lwork=-1;
	
	lapack_dsyevr( lapack_compute_vectors, lapack_range_all, lapack_upper, n,  A, lda, 0., 0., 0, 0, 1e-14, &m, w, z, lda, isuppz, work, lwork, iwork, liwork, &info); 
	
	lwork=work[0];
	free(work);
	work=malloc(lwork*sizeof(double));
	
	lapack_dsyevr( lapack_compute_vectors, lapack_range_all, lapack_upper, n,  A, lda, 0., 0., 0, 0, 1e-14, &m, w, z, lda, isuppz, work, lwork, iwork, liwork, &info); 
	double *tmp;
	tmp=(double*)malloc(n*lda*sizeof(double));
	for(i=0;i<lda*n;i++)
		tmp[i]=0;
	for(i=0;i<n;i++)
		tmp[i+lda*i]=1.0e0;
    cblas_dgemm ( CblasColMajor, CblasNoTrans, CblasTrans, n, n, n, 1.0e0, z, lda, z, lda, -1.0e0, tmp, lda);
	double ortho = 0.0e0;
	for(i=0;i<lda*n;i++)
		ortho+=tmp[i]*tmp[i];
	ortho = sqrt(ortho);
	printf("Orthogonality error : %e\n",ortho);


	for(i=0;i<lda*n;i++)
		tmp[i]=0;
	for(i=0;i<n;i++)
		tmp[i+lda*i]=w[i];

	double *tmp2;
	tmp2=(double*)malloc(n*lda*sizeof(double));
	
    cblas_dgemm ( CblasColMajor, CblasNoTrans, CblasNoTrans, n, n, n, 1.0e0, z, lda, tmp, lda, 0.0e0, tmp2, lda);

	for(i=0;i<lda*n;i++)
		tmp[i]=Acopy[i];

    cblas_dgemm ( CblasColMajor, CblasNoTrans, CblasTrans, n, n, n, -1.0e0, tmp2, lda, z, lda, 1.0e0, tmp, lda);

	double normA = 0.0e0;
	for(i=0;i<lda*n;i++)
		normA+=Acopy[i]*Acopy[i];
	normA = sqrt(normA);

	double repr = 0.0e0;
	for(i=0;i<lda*n;i++)
		repr+=tmp[i]*tmp[i];
	repr = sqrt(repr)/normA;

	printf("Reprentativity error : %e\n",repr);

	free(A);
	free(Acopy);
	free(work);
	free(iwork);
	free(tmp);
	free(tmp2);
	free(w);
	free(z);
	free(isuppz);
	



	
    printf("*******************************************************\n");
	double lrwork;
	double* rwork;


	n = 300; lda = 300;

	A = (double *)malloc(2*lda*n*sizeof(double)) ;

	if (A==NULL){ printf("error of memory allocation\n"); exit(0); }
	Acopy = (double *)malloc(2*lda*n*sizeof(double)) ;
	if (Acopy==NULL){ printf("error of memory allocation\n"); exit(0); }
	w=(double*)malloc(n*sizeof(double));

	for(i=0;i<lda*n;i++)
		A[i] = ((double) rand()) / ((double) RAND_MAX) - 0.5;

	for (i=0;i<n;i++)
		for (j=0;j<n;j++) 
		{
			A[2*(i+lda*j)+1] = -A[2*(j+lda*i)+1];
			A[2*(i+lda*j)]   = A[2*(j+lda*i)];
		}

	for (i=0;i<n;i++)
		A[2*(i+lda*i)+1]=0;

	cblas_zcopy(lda*n,A,1,Acopy,1);

	z = (double *)malloc(2*lda*n*sizeof(double)) ;
	isuppz = (int *)malloc(2*n*sizeof(int)) ;

	work=malloc(2*sizeof(double));
	rwork=malloc(sizeof(double));
	iwork=malloc(sizeof(int));
	lwork = -1;

	lapack_zheevr( lapack_compute_vectors, lapack_range_all, lapack_upper, n,  A, lda, 0., 0., 0, 0, 1e-14, &m, w, z, lda, isuppz, work, lwork, rwork, lrwork, iwork, liwork, &info); 

	lwork=work[0];
	liwork=iwork[0];
	lrwork=rwork[0];
	free(work);
	free(rwork);
	free(iwork);
	work=malloc(2*lwork*sizeof(double));
	iwork=malloc(liwork*sizeof(int));
	rwork=malloc(lrwork*sizeof(double));
	lapack_zheevr( lapack_compute_vectors, lapack_range_all, lapack_upper, n,  A, lda, 0., 0., 0, 0, 1e-14, &m, w, z, lda, isuppz, work, lwork, rwork, lrwork, iwork, liwork, &info); 

	tmp=(double*)malloc(2*n*lda*sizeof(double));
	double alpha[2];
	double beta[2];
	tmp2=(double*)malloc(2*n*lda*sizeof(double));
	alpha[0]=1.0e0;
	alpha[1]=0.0e0;
	beta[0]=-1.0e0;
	beta[1]=0.0e0;

	for (i=0;i<2*n*lda;i++)
		tmp[i]=0;
	for (i=0;i<n;i++)
		tmp[2*(i+lda*i)]=1;
	cblas_zgemm ( CblasColMajor, CblasNoTrans, CblasConjTrans, n, n, n, alpha, z, lda, z, lda, beta, tmp, lda);

	ortho=cblas_dnrm2(2*n*n,tmp,1);
	printf("Orthogonality error : %e\n",ortho);


	for (i=0;i<n;i++)
	{
		for (j=0;j<n;j++)
		{
			tmp[2*(i+lda*j)]=z[2*(i+lda*j)]*w[j];
			tmp[2*(i+lda*j)+1]=z[2*(i+lda*j)+1]*w[j];
		}
	}

	cblas_zcopy(lda*n,Acopy,1,tmp2,1);
	cblas_zgemm ( CblasColMajor, CblasNoTrans, CblasConjTrans, n, n, n, alpha, tmp, lda, z, lda, beta, tmp2, lda);

	repr=cblas_dnrm2(2*n*n,tmp2,1);

	printf("Reprentativity error : %e\n",repr);


	free(A);
	free(Acopy);
	free(work);
	free(iwork);
	free(tmp);
	free(tmp2);
	free(w);
	free(z);
	free(isuppz);

	exit(0);

}
