        SUBROUTINE czhetrs(uplo,
     $   n,
     $   nrhs,
     $   a,
     $   lda,
     $   ipiv,
     $   b,
     $   ldb,
     $   info)
c
c       lapack_zhetrs.c
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
        COMPLEX*16  a(*)
        INTEGER  lda
        INTEGER  ipiv(*)
        COMPLEX*16  b(*)
        INTEGER  ldb
        INTEGER  info

        CALL fzhetrs(uplo,
     $   n,
     $   nrhs,
     $   a,
     $   lda,
     $   ipiv,
     $   b,
     $   ldb,
     $   info)
        RETURN
        END
