      SUBROUTINE DLARRF( N, D, L, LD, LLD, IFIRST, ILAST, W, DPLUS,
     $                   LPLUS, WORK, IWORK, INFO )
*
*  -- LAPACK auxiliary routine (version 3.0) --
*     Univ. of Tennessee, Univ. of California Berkeley, NAG Ltd.,
*     Courant Institute, Argonne National Lab, and Rice University
*     June 30, 1999
*
*     .. Scalar Arguments ..
      INTEGER            IFIRST, ILAST, INFO, N
*     ..
*     .. Array Arguments ..
      INTEGER            IWORK( * )
      DOUBLE PRECISION   D( * ), DPLUS( * ), L( * ), LD( * ), LLD( * ),
     $                   LPLUS( * ), W( * ), WORK( * )
*     ..
*
*  Purpose
*  =======
*
*  Given the initial representation L D L^T and its cluster of close
*  eigenvalues (in a relative measure), W( IFIRST ), W( IFIRST+1 ), ...
*  W( ILAST ), CDLARRF finds a new relatively robust representation
*  L D L^T - SIGMA I = L(+) D(+) L(+)^T such that at least one of the
*  eigenvalues of L(+) D(+) L(+)^T is relatively isolated.
*
*  Arguments
*  =========
*
*  N       (input) INTEGER
*          The order of the matrix.
*
*  D       (input) DOUBLE PRECISION array, dimension (N)
*          The n diagonal elements of the diagonal matrix D.
*
*  L       (input) DOUBLE PRECISION array, dimension (N-1)
*          The (n-1) subdiagonal elements of the unit bidiagonal
*          matrix L.
*
*  LD      (input) DOUBLE PRECISION array, dimension (N-1)
*          The n-1 elements L(i)*D(i).
*
*  LLD     (input) DOUBLE PRECISION array, dimension (N-1)
*          The n-1 elements L(i)*L(i)*D(i).
*
*  IFIRST  (input) INTEGER
*          The index of the first eigenvalue in the cluster.
*
*  ILAST   (input) INTEGER
*          The index of the last eigenvalue in the cluster.
*
*  W       (input/output) DOUBLE PRECISION array, dimension (N)
*          On input, the eigenvalues of L D L^T in ascending order.
*          W( IFIRST ) through W( ILAST ) form the cluster of relatively
*          close eigenalues.
*          On output, W( IFIRST ) thru' W( ILAST ) are estimates of the
*          corresponding eigenvalues of L(+) D(+) L(+)^T.
*
*  SIGMA   (input) DOUBLE PRECISION
*          The shift used to form L(+) D(+) L(+)^T.
*
*  DPLUS   (output) DOUBLE PRECISION array, dimension (N)
*          The n diagonal elements of the diagonal matrix D(+).
*
*  LPLUS   (output) DOUBLE PRECISION array, dimension (N)
*          The first (n-1) elements of LPLUS contain the subdiagonal
*          elements of the unit bidiagonal matrix L(+). LPLUS( N ) is
*          set to SIGMA.
*
*  WORK    (workspace) DOUBLE PRECISION array, dimension (1)
*          Workspace.
*
*  IWORK   (workspace) INTEGER array, dimension (1)
*          Workspace.
*
*  INFO    (output) INTEGER
*          = 0:  successful exit
*          = 1:  either IFIRST .NE. 1 or ILAST .NE. N
*
*  Further Details
*  ===============
*
*  Based on contributions by
*     Inderjit Dhillon, IBM Almaden, USA
*     Osni Marques, LBNL/NERSC, USA
*
*  =====================================================================
*
*     .. Parameters ..
      DOUBLE PRECISION   ZERO, TWO
      PARAMETER          ( ZERO = 0.0D0, TWO = 2.0D0 )
*     ..
*     .. Local Scalars ..
      INTEGER            I
      DOUBLE PRECISION   DELTA, EPS, S, SIGMA
*     ..
*     .. External Functions ..
      DOUBLE PRECISION   DLAMCH
      EXTERNAL           DLAMCH
*     ..
*     .. Intrinsic Functions ..
      INTRINSIC          ABS
*     ..
*     .. Executable Statements ..
*
      INFO = 0
      EPS = DLAMCH( 'Precision' )
      IF( IFIRST.EQ.1 ) THEN
         SIGMA = W( IFIRST )
      ELSE IF( ILAST.EQ.N ) THEN
         SIGMA = W( ILAST )
      ELSE
         INFO = 1
         RETURN
      END IF
*
*     Compute the new relatively robust representation (RRR)
*
      DELTA = TWO*EPS
   10 CONTINUE
      IF( IFIRST.EQ.1 ) THEN
         SIGMA = SIGMA - ABS( SIGMA )*DELTA
      ELSE
         SIGMA = SIGMA + ABS( SIGMA )*DELTA
      END IF
      S = -SIGMA
      DO 20 I = 1, N - 1
         DPLUS( I ) = D( I ) + S
         LPLUS( I ) = LD( I ) / DPLUS( I )
         S = S*LPLUS( I )*L( I ) - SIGMA
   20 CONTINUE
      DPLUS( N ) = D( N ) + S
      IF( IFIRST.EQ.1 ) THEN
         DO 30 I = 1, N
            IF( DPLUS( I ).LT.ZERO ) THEN
               DELTA = TWO*DELTA
               GO TO 10
            END IF
   30    CONTINUE
      ELSE
         DO 40 I = 1, N
            IF( DPLUS( I ).GT.ZERO ) THEN
               DELTA = TWO*DELTA
               GO TO 10
            END IF
   40    CONTINUE
      END IF
      DO 50 I = IFIRST, ILAST
         W( I ) = W( I ) - SIGMA
   50 CONTINUE
      LPLUS( N ) = SIGMA
*
      RETURN
*
*     End of CDLARRF
*
      END
