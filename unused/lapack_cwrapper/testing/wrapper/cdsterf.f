        SUBROUTINE cdsterf(n,
     $   d,
     $   e,
     $   info)
c
c       lapack_dsterf.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  n
        DOUBLE PRECISION  d(*)
        DOUBLE PRECISION  e(*)
        INTEGER  info

        CALL fdsterf(n,
     $   d,
     $   e,
     $   info)
        RETURN
        END
