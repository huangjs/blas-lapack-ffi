        SUBROUTINE czspsv(uplo,
     $   n,
     $   nrhs,
     $   ap,
     $   ipiv,
     $   b,
     $   ldb,
     $   info)
c
c       lapack_zspsv.c
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
        INTEGER  n
        INTEGER  nrhs
        COMPLEX*16  ap(*)
        INTEGER  ipiv(*)
        COMPLEX*16  b(*)
        INTEGER  ldb
        INTEGER  info

        CALL fzspsv(uplo,
     $   n,
     $   nrhs,
     $   ap,
     $   ipiv,
     $   b,
     $   ldb,
     $   info)
        RETURN
        END
