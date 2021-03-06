        SUBROUTINE ccunmbr(vect,
     $   side,
     $   trans,
     $   m,
     $   n,
     $   k,
     $   a,
     $   lda,
     $   tau,
     $   c,
     $   ldc,
     $   work,
     $   lwork,
     $   info)
c
c       lapack_cunmbr.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  vect
        CHARACTER  side
        CHARACTER  trans
        INTEGER  m
        INTEGER  n
        INTEGER  k
        COMPLEX  a(*)
        INTEGER  lda
        COMPLEX  tau(*)
        COMPLEX  c(*)
        INTEGER  ldc
        COMPLEX  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fcunmbr(vect,
     $   side,
     $   trans,
     $   m,
     $   n,
     $   k,
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
