        SUBROUTINE cclacon(n,
     $   v,
     $   x,
     $   est,
     $   kase)
c
c       lapack_clacon.c
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
        COMPLEX  v(*)
        COMPLEX  x(*)
        REAL  est
        INTEGER  kase

        CALL fclacon(n,
     $   v,
     $   x,
     $   est,
     $   kase)
        RETURN
        END
