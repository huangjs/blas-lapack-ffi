        SUBROUTINE cdgeev(jobvl,
     $   jobvr,
     $   n,
     $   a,
     $   lda,
     $   wr,
     $   wi,
     $   vl,
     $   ldvl,
     $   vr,
     $   ldvr,
     $   work,
     $   lwork,
     $   info)
c
c       lapack_dgeev.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  jobvl
        CHARACTER  jobvr
        INTEGER  n
        DOUBLE PRECISION  a(*)
        INTEGER  lda
        DOUBLE PRECISION  wr(*)
        DOUBLE PRECISION  wi(*)
        DOUBLE PRECISION  vl(*)
        INTEGER  ldvl
        DOUBLE PRECISION  vr(*)
        INTEGER  ldvr
        DOUBLE PRECISION  work(*)
        INTEGER  lwork
        INTEGER  info

        CALL fdgeev(jobvl,
     $   jobvr,
     $   n,
     $   a,
     $   lda,
     $   wr,
     $   wi,
     $   vl,
     $   ldvl,
     $   vr,
     $   ldvr,
     $   work,
     $   lwork,
     $   info)
        RETURN
        END
