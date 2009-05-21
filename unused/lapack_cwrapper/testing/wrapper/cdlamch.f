        DOUBLE PRECISION FUNCTION cdlamch(cmach)
c
c       lapack_dlamch.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  cmach

        EXTERNAL fdlamch
        CALL fdlamch(cdlamch, cmach)
        RETURN
        END
