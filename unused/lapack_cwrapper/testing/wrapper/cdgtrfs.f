        SUBROUTINE cdgtrfs(trans,
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
     $   iwork,
     $   info)
c
c       lapack_dgtrfs.c
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
        DOUBLE PRECISION  dl(*)
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  du(*)
        DOUBLE PRECISION  dlf(*)
        DOUBLE PRECISION  df(*)
        DOUBLE PRECISION  duf(*)
        DOUBLE PRECISION  du2(*)
        INTEGER  ipiv(*)
        DOUBLE PRECISION  b(*)
        INTEGER  ldb
        DOUBLE PRECISION  x(*)
        INTEGER  ldx
        DOUBLE PRECISION  ferr(*)
        DOUBLE PRECISION  berr(*)
        DOUBLE PRECISION  work(*)
        INTEGER  iwork(*)
        INTEGER  info

        CALL fdgtrfs(trans,
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
     $   iwork,
     $   info)
        RETURN
        END
