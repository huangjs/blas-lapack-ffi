        SUBROUTINE ccsysvx(fact,
     $   uplo,
     $   n,
     $   nrhs,
     $   a,
     $   lda,
     $   af,
     $   ldaf,
     $   ipiv,
     $   b,
     $   ldb,
     $   x,
     $   ldx,
     $   rcond,
     $   ferr,
     $   berr,
     $   work,
     $   lwork,
     $   rwork,
     $   info)
c
c       lapack_csysvx.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  fact
        CHARACTER  uplo
        INTEGER  n
        INTEGER  nrhs
        COMPLEX  a(*)
        INTEGER  lda
        COMPLEX  af(*)
        INTEGER  ldaf
        INTEGER  ipiv(*)
        COMPLEX  b(*)
        INTEGER  ldb
        COMPLEX  x(*)
        INTEGER  ldx
        REAL  rcond
        REAL  ferr(*)
        REAL  berr(*)
        COMPLEX  work(*)
        INTEGER  lwork
        REAL  rwork(*)
        INTEGER  info

        CALL fcsysvx(fact,
     $   uplo,
     $   n,
     $   nrhs,
     $   a,
     $   lda,
     $   af,
     $   ldaf,
     $   ipiv,
     $   b,
     $   ldb,
     $   x,
     $   ldx,
     $   rcond,
     $   ferr,
     $   berr,
     $   work,
     $   lwork,
     $   rwork,
     $   info)
        RETURN
        END
