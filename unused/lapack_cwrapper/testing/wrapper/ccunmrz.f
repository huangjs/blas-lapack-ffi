        SUBROUTINE ccunmrz(side,
     $   trans,
     $   m,
     $   n,
     $   k,
     $   l,
     $   a,
     $   lda,
     $   tau,
     $   c,
     $   ldc,
     $   work,
     $   lwork,
     $   info)
c
c       lapack_cunmrz.c
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
        CHARACTER  trans
        INTEGER  m
        INTEGER  n
        INTEGER  k
        INTEGER  l
        COMPLEX  a(*)
        INTEGER  lda
        COMPLEX  tau(*)
        COMPLEX  c(*)
        INTEGER  ldc
        COMPLEX  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fcunmrz(side,
     $   trans,
     $   m,
     $   n,
     $   k,
     $   l,
     $   a,
     $   lda,
     $   tau,
     $   c,
     $   ldc,
     $   work,
     $   lwork,
     $   info)
        RETURN
        END
