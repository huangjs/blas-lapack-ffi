        SUBROUTINE cdlapmt(forwrd,
     $   m,
     $   n,
     $   x,
     $   ldx,
     $   k)
c
c       lapack_dlapmt.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        LOGICAL  forwrd
        INTEGER  m
        INTEGER  n
        DOUBLE PRECISION  x(*)
        INTEGER  ldx
        INTEGER  k(*)

        CALL fdlapmt(forwrd,
     $   m,
     $   n,
     $   x,
     $   ldx,
     $   k)
        RETURN
        END
