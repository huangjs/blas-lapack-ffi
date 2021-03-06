        SUBROUTINE cslasdt(n,
     $   lvl,
     $   nd,
     $   inode,
     $   ndiml,
     $   ndimr,
     $   msub)
c
c       lapack_slasdt.c
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
        INTEGER  lvl
        INTEGER  nd
        INTEGER  inode(*)
        INTEGER  ndiml(*)
        INTEGER  ndimr(*)
        INTEGER  msub

        CALL fslasdt(n,
     $   lvl,
     $   nd,
     $   inode,
     $   ndiml,
     $   ndimr,
     $   msub)
        RETURN
        END
