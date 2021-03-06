        SUBROUTINE cdlaic1(job,
     $   j,
     $   x,
     $   sest,
     $   w,
     $   gamma,
     $   sestpr,
     $   s,
     $   c)
c
c       lapack_dlaic1.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  job
        INTEGER  j
        DOUBLE PRECISION  x(*)
        DOUBLE PRECISION  sest
        DOUBLE PRECISION  w(*)
        DOUBLE PRECISION  gamma
        DOUBLE PRECISION  sestpr
        DOUBLE PRECISION  s
        DOUBLE PRECISION  c

        CALL fdlaic1(job,
     $   j,
     $   x,
     $   sest,
     $   w,
     $   gamma,
     $   sestpr,
     $   s,
     $   c)
        RETURN
        END
