        SUBROUTINE cctbrfs(uplo,
     $   trans,
     $   diag,
     $   n,
     $   kd,
     $   nrhs,
     $   ab,
     $   ldab,
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
c       lapack_ctbrfs.c
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
        INTEGER  kd
        INTEGER  nrhs
        COMPLEX  ab(*)
        INTEGER  ldab
        COMPLEX  b(*)
        INTEGER  ldb
        COMPLEX  x(*)
        INTEGER  ldx
        REAL  ferr(*)
        REAL  berr(*)
        COMPLEX  work(*)
        REAL  rwork(*)
        INTEGER  info

        CALL fctbrfs(uplo,
     $   trans,
     $   diag,
     $   n,
     $   kd,
     $   nrhs,
     $   ab,
     $   ldab,
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
