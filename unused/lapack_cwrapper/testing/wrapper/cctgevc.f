        SUBROUTINE cctgevc(side,
     $   howmny,
     $   select,
     $   n,
     $   s,
     $   lds,
     $   p,
     $   ldp,
     $   vl,
     $   ldvl,
     $   vr,
     $   ldvr,
     $   mm,
     $   m,
     $   work,
     $   rwork,
     $   info)
c
c       lapack_ctgevc.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  side
        CHARACTER  howmny
        LOGICAL  select(*)
        INTEGER  n
        COMPLEX  s(*)
        INTEGER  lds
        COMPLEX  p(*)
        INTEGER  ldp
        COMPLEX  vl(*)
        INTEGER  ldvl
        COMPLEX  vr(*)
        INTEGER  ldvr
        INTEGER  mm
        INTEGER  m
        COMPLEX  work(*)
        REAL  rwork(*)
        INTEGER  info

        CALL fctgevc(side,
     $   howmny,
     $   select,
     $   n,
     $   s,
     $   lds,
     $   p,
     $   ldp,
     $   vl,
     $   ldvl,
     $   vr,
     $   ldvr,
     $   mm,
     $   m,
     $   work,
     $   rwork,
     $   info)
        RETURN
        END
