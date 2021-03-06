        SUBROUTINE czppcon(uplo,
     $   n,
     $   ap,
     $   anorm,
     $   rcond,
     $   work,
     $   rwork,
     $   info)
c
c       lapack_zppcon.c
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
        COMPLEX*16  ap(*)
        DOUBLE PRECISION  anorm
        DOUBLE PRECISION  rcond
        COMPLEX*16  work(*)
        DOUBLE PRECISION  rwork(*)
        INTEGER  info

        CALL fzppcon(uplo,
     $   n,
     $   ap,
     $   anorm,
     $   rcond,
     $   work,
     $   rwork,
     $   info)
        RETURN
        END
