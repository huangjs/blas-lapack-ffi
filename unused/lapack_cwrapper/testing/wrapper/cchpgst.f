        SUBROUTINE cchpgst(itype,
     $   uplo,
     $   n,
     $   ap,
     $   bp,
     $   info)
c
c       lapack_chpgst.c
c
c       This program is a fortran Wrapper to
c       the C Wrapper for fortran Lapack.
c       It is used to test the C Wrapper using
c       the testing functions provided with the
c       LAPACK package.
c
c       Written by Remi Delmas.
c
        INTEGER  itype
        CHARACTER  uplo
        INTEGER  n
        COMPLEX  ap(*)
        COMPLEX  bp(*)
        INTEGER  info

        CALL fchpgst(itype,
     $   uplo,
     $   n,
     $   ap,
     $   bp,
     $   info)
        RETURN
        END
