        SUBROUTINE cztrrfs(uplo,
     $   trans,
     $   diag,
     $   n,
     $   nrhs,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   x,
     $   ldx,
     $   ferr,
     $   berr,
     $   work,
     $   rwork,
     $   info)
c
c       lapack_ztrrfs.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  uplo
        CHARACTER  trans
        CHARACTER  diag
        INTEGER  n
        INTEGER  nrhs
        COMPLEX*16  a(*)
        INTEGER  lda
        COMPLEX*16  b(*)
        INTEGER  ldb
        COMPLEX*16  x(*)
        INTEGER  ldx
        DOUBLE PRECISION  ferr(*)
        DOUBLE PRECISION  berr(*)
        COMPLEX*16  work(*)
        DOUBLE PRECISION  rwork(*)
        INTEGER  info

        CALL fztrrfs(uplo,
     $   trans,
     $   diag,
     $   n,
     $   nrhs,
     $   a,
     $   lda,
     $   b,
     $   ldb,
     $   x,
     $   ldx,
     $   ferr,
     $   berr,
     $   work,
     $   rwork,
     $   info)
        RETURN
        END
