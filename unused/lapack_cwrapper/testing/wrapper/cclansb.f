        REAL FUNCTION cclansb(norm,
     $   uplo,
     $   n,
     $   k,
     $   ab,
     $   ldab,
     $   work)
c
c       lapack_clansb.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        CHARACTER  norm
        CHARACTER  uplo
        INTEGER  n
        INTEGER  k
        COMPLEX  ab(*)
        INTEGER  ldab
        REAL  work(*)

        EXTERNAL fclansb
        CALL fclansb(cclansb, norm,
     $   uplo,
     $   n,
     $   k,
     $   ab,
     $   ldab,
     $   work)
        RETURN
        END
