        SUBROUTINE ccheevd(jobz,
     $   uplo,
     $   n,
     $   a,
     $   lda,
     $   w,
     $   work,
     $   lwork,
     $   rwork,
     $   lrwork,
     $   iwork,
     $   liwork,
     $   info)
c
c       lapack_cheevd.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  jobz
        CHARACTER  uplo
        INTEGER  n
        COMPLEX  a(*)
        INTEGER  lda
        REAL  w(*)
        COMPLEX  work(*)
        INTEGER  lwork
        REAL  rwork(*)
        INTEGER  lrwork
        INTEGER  iwork(*)
        INTEGER  liwork
        INTEGER  info

        CALL fcheevd(jobz,
     $   uplo,
     $   n,
     $   a,
     $   lda,
     $   w,
     $   work,
     $   lwork,
     $   rwork,
     $   lrwork,
     $   iwork,
     $   liwork,
     $   info)
        RETURN
        END
