        SUBROUTINE czsytf2(uplo,
     $   n,
     $   a,
     $   lda,
     $   ipiv,
     $   info)
c
c       lapack_zsytf2.c
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
        COMPLEX*16  a(*)
        INTEGER  lda
        INTEGER  ipiv(*)
        INTEGER  info

        CALL fzsytf2(uplo,
     $   n,
     $   a,
     $   lda,
     $   ipiv,
     $   info)
        RETURN
        END
