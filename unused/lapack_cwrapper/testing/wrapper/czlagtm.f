        SUBROUTINE czlagtm(trans,
     $   n,
     $   nrhs,
     $   alpha,
     $   dl,
     $   d,
     $   du,
     $   x,
     $   ldx,
     $   beta,
     $   b,
     $   ldb)
c
c       lapack_zlagtm.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  trans
        INTEGER  n
        INTEGER  nrhs
        DOUBLE PRECISION  alpha
        COMPLEX*16  dl(*)
        COMPLEX*16  d(*)
        COMPLEX*16  du(*)
        COMPLEX*16  x(*)
        INTEGER  ldx
        DOUBLE PRECISION  beta
        COMPLEX*16  b(*)
        INTEGER  ldb

        CALL fzlagtm(trans,
     $   n,
     $   nrhs,
     $   alpha,
     $   dl,
     $   d,
     $   du,
     $   x,
     $   ldx,
     $   beta,
     $   b,
     $   ldb)
        RETURN
        END
