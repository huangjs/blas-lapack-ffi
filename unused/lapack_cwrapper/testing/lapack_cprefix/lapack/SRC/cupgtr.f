      SUBROUTINE CUPGTR( UPLO, N, AP, TAU, Q, LDQ, WORK, INFO )
*
*  -- LAPACK routine (version 3.0) --
*     Univ. of Tennessee, Univ. of California Berkeley, NAG Ltd.,
*     Courant Institute, Argonne National Lab, and Rice University
*     September 30, 1994
*
*     .. Scalar Arguments ..
      CHARACTER          UPLO
      INTEGER            INFO, LDQ, N
*     ..
*     .. Array Arguments ..
      COMPLEX            AP( * ), Q( LDQ, * ), TAU( * ), WORK( * )
*     ..
*
*  Purpose
*  =======
*
*  CCUPGTR generates a complex unitary matrix Q which is defined as the
*  product of n-1 elementary reflectors H(i) of order n, as returned by
*  CCHPTRD using packed storage:
*
*  if UPLO = 'U', Q = H(n-1) . . . H(2) H(1),
*
*  if UPLO = 'L', Q = H(1) H(2) . . . H(n-1).
*
*  Arguments
*  =========
*
*  UPLO    (input) CHARACTER*1
*          = 'U': Upper triangular packed storage used in previous
*                 call to CCHPTRD;
*          = 'L': Lower triangular packed storage used in previous
*                 call to CCHPTRD.
*
*  N       (input) INTEGER
*          The order of the matrix Q. N >= 0.
*
*  AP      (input) COMPLEX array, dimension (N*(N+1)/2)
*          The vectors which define the elementary reflectors, as
*          returned by CCHPTRD.
*
*  TAU     (input) COMPLEX array, dimension (N-1)
*          TAU(i) must contain the scalar factor of the elementary
*          reflector H(i), as returned by CCHPTRD.
*
*  Q       (output) COMPLEX array, dimension (LDQ,N)
*          The N-by-N unitary matrix Q.
*
*  LDQ     (input) INTEGER
*          The leading dimension of the array Q. LDQ >= max(1,N).
*
*  WORK    (workspace) COMPLEX array, dimension (N-1)
*
*  INFO    (output) INTEGER
*          = 0:  successful exit
*          < 0:  if INFO = -i, the i-th argument had an illegal value
*
*  =====================================================================
*
*     .. Parameters ..
      COMPLEX            CZERO, CONE
      PARAMETER          ( CZERO = ( 0.0E+0, 0.0E+0 ),
     $                   CONE = ( 1.0E+0, 0.0E+0 ) )
*     ..
*     .. Local Scalars ..
      LOGICAL            UPPER
      INTEGER            I, IINFO, IJ, J
*     ..
*     .. External Functions ..
      LOGICAL            LSAME
      EXTERNAL           LSAME
*     ..
*     .. External Subroutines ..
      EXTERNAL           CCUNG2L, CCUNG2R, XERBLA
*     ..
*     .. Intrinsic Functions ..
      INTRINSIC          MAX
*     ..
*     .. Executable Statements ..
*
*     Test the input arguments
*
      INFO = 0
      UPPER = LSAME( UPLO, 'U' )
      IF( .NOT.UPPER .AND. .NOT.LSAME( UPLO, 'L' ) ) THEN
         INFO = -1
      ELSE IF( N.LT.0 ) THEN
         INFO = -2
      ELSE IF( LDQ.LT.MAX( 1, N ) ) THEN
         INFO = -6
      END IF
      IF( INFO.NE.0 ) THEN
         CALL XERBLA( 'CCUPGTR', -INFO )
         RETURN
      END IF
*
*     Quick return if possible
*
      IF( N.EQ.0 )
     $   RETURN
*
      IF( UPPER ) THEN
*
*        Q was determined by a call to CCHPTRD with UPLO = 'U'
*
*        Unpack the vectors which define the elementary reflectors and
*        set the last row and column of Q equal to those of the unit
*        matrix
*
         IJ = 2
         DO 20 J = 1, N - 1
            DO 10 I = 1, J - 1
               Q( I, J ) = AP( IJ )
               IJ = IJ + 1
   10       CONTINUE
            IJ = IJ + 2
            Q( N, J ) = CZERO
   20    CONTINUE
         DO 30 I = 1, N - 1
            Q( I, N ) = CZERO
   30    CONTINUE
         Q( N, N ) = CONE
*
*        Generate Q(1:n-1,1:n-1)
*
         CALL CCUNG2L( N-1, N-1, N-1, Q, LDQ, TAU, WORK, IINFO )
*
      ELSE
*
*        Q was determined by a call to CCHPTRD with UPLO = 'L'.
*
*        Unpack the vectors which define the elementary reflectors and
*        set the first row and column of Q equal to those of the unit
*        matrix
*
         Q( 1, 1 ) = CONE
         DO 40 I = 2, N
            Q( I, 1 ) = CZERO
   40    CONTINUE
         IJ = 3
         DO 60 J = 2, N
            Q( 1, J ) = CZERO
            DO 50 I = J + 1, N
               Q( I, J ) = AP( IJ )
               IJ = IJ + 1
   50       CONTINUE
            IJ = IJ + 2
   60    CONTINUE
         IF( N.GT.1 ) THEN
*
*           Generate Q(2:n,2:n)
*
            CALL CCUNG2R( N-1, N-1, N-1, Q( 2, 2 ), LDQ, TAU, WORK,
     $                   IINFO )
         END IF
      END IF
      RETURN
*
*     End of CCUPGTR
*
      END
