        SUBROUTINE ccgtrfs(trans,
     $   n,
     $   nrhs,
     $   dl,
     $   d,
     $   du,
     $   dlf,
     $   df,
     $   duf,
     $   du2,
     $   ipiv,
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
c       lapack_cgtrfs.c
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
        COMPLEX  dl(*)
        COMPLEX  d(*)
        COMPLEX  du(*)
        COMPLEX  dlf(*)
        COMPLEX  df(*)
        COMPLEX  duf(*)
        COMPLEX  du2(*)
        INTEGER  ipiv(*)
        COMPLEX  b(*)
        INTEGER  ldb
        COMPLEX  x(*)
        INTEGER  ldx
        REAL  ferr(*)
        REAL  berr(*)
        COMPLEX  work(*)
        REAL  rwork(*)
        INTEGER  info

        CALL fcgtrfs(trans,
     $   n,
     $   nrhs,
     $   dl,
     $   d,
     $   du,
     $   dlf,
     $   df,
     $   duf,
     $   du2,
     $   ipiv,
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
