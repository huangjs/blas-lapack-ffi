        SUBROUTINE cdgeqp3(m,
     $   n,
     $   a,
     $   lda,
     $   jpvt,
     $   tau,
     $   work,
     $   lwork,
     $   info)
c
c       lapack_dgeqp3.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  m
        INTEGER  n
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        INTEGER  jpvt(*)
        DOUBLE PRECISION  tau(*)
        DOUBLE PRECISION  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fdgeqp3(m,
     $   n,
     $   a,
     $   lda,
     $   jpvt,
     $   tau,
     $   work,
     $   lwork,
     $   info)
        RETURN
        END
