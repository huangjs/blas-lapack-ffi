        SUBROUTINE cdlasq1(n,
     $   d,
     $   e,
     $   work,
     $   info)
c
c       lapack_dlasq1.c
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
        DOUBLE PRECISION  work(*)
        INTEGER  info

        CALL fdlasq1(n,
     $   d,
     $   e,
     $   work,
     $   info)
        RETURN
        END
