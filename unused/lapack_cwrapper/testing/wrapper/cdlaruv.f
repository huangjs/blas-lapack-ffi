        SUBROUTINE cdlaruv(iseed,
     $   n,
     $   x)
c
c       lapack_dlaruv.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  iseed(*)
        INTEGER  n
        DOUBLE PRECISION  x(*)

        CALL fdlaruv(iseed,
     $   n,
     $   x)
        RETURN
        END
