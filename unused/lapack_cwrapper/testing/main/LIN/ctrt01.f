      SUBROUTINE CTRT01( UPLO, DIAG, N, A, LDA, AINV, LDAINV, RCOND,
     $                   RWORK, RESID )
*
*  -- LAPACK test routine (version 3.0) --
*     Univ. of Tennessee, Univ. of California Berkeley, NAG Ltd.,
*     Courant Institute, Argonne National Lab, and Rice University
*     February 29, 1992
*
*     .. Scalar Arguments ..
      CHARACTER          DIAG, UPLO
      INTEGER            LDA, LDAINV, N
      REAL               RCOND, RESID
*     ..
*     .. Array Arguments ..
      REAL               RWORK( * )
      COMPLEX            A( LDA, * ), AINV( LDAINV, * )
*     ..
*
*  Purpose
*  =======
*
*  CTRT01 computes the residual for a triangular matrix A times its
*  inverse:
*     RESID = norm( A*AINV - I ) / ( N * norm(A) * norm(AINV) * EPS ),
*  where EPS is the machine epsilon.
*
*  Arguments
*  ==========
*
*  UPLO    (input) CHARACTER*1
*          Specifies whether the matrix A is upper or lower triangular.
*          = 'U':  Upper triangular
*          = 'L':  Lower triangular
*
*  DIAG    (input) CHARACTER*1
*          Specifies whether or not the matrix A is unit triangular.
*          = 'N':  Non-unit triangular
*          = 'U':  Unit triangular
*
*  N       (input) INTEGER
*          The order of the matrix A.  N >= 0.
*
*  A       (input) COMPLEX array, dimension (LDA,N)
*          The triangular matrix A.  If UPLO = 'U', the leading n by n
*          upper triangular part of the array A contains the upper
*          triangular matrix, and the strictly lower triangular part of
*          A is not referenced.  If UPLO = 'L', the leading n by n lower
*          triangular part of the array A contains the lower triangular
*          matrix, and the strictly upper triangular part of A is not
*          referenced.  If DIAG = 'U', the diagonal elements of A are
*          also not referenced and are assumed to be 1.
*
*  LDA     (input) INTEGER
*          The leading dimension of the array A.  LDA >= max(1,N).
*
*  AINV    (input) COMPLEX array, dimension (LDAINV,N)
*          On entry, the (triangular) inverse of the matrix A, in the
*          same storage format as A.
*          On exit, the contents of AINV are destroyed.
*
*  LDAINV  (input) INTEGER
*          The leading dimension of the array AINV.  LDAINV >= max(1,N).
*
*  RCOND   (output) REAL
*          The reciprocal condition number of A, computed as
*          1/(norm(A) * norm(AINV)).
*
*  RWORK   (workspace) REAL array, dimension (N)
*
*  RESID   (output) REAL
*          norm(A*AINV - I) / ( N * norm(A) * norm(AINV) * EPS )
*
*  =====================================================================
*
*     .. Parameters ..
      REAL               ZERO, ONE
      PARAMETER          ( ZERO = 0.0E+0, ONE = 1.0E+0 )
*     ..
*     .. Local Scalars ..
      INTEGER            J
      REAL               AINVNM, ANORM, EPS
*     ..
*     .. External Functions ..
      LOGICAL            LSAME
      REAL               CLANTR, SLAMCH
      EXTERNAL           LSAME, CLANTR, SLAMCH
*     ..
*     .. External Subroutines ..
      EXTERNAL           CTRMV
*     ..
*     .. Intrinsic Functions ..
      INTRINSIC          REAL
*     ..
*     .. Executable Statements ..
*
*     Quick exit if N = 0
*
      IF( N.LE.0 ) THEN
         RCOND = ONE
         RESID = ZERO
         RETURN
      END IF
*
*     Exit with RESID = 1/EPS if ANORM = 0 or AINVNM = 0.
*
      EPS = SLAMCH( 'Epsilon' )
      ANORM = CLANTR( '1', UPLO, DIAG, N, N, A, LDA, RWORK )
      AINVNM = CLANTR( '1', UPLO, DIAG, N, N, AINV, LDAINV, RWORK )
      IF( ANORM.LE.ZERO .OR. AINVNM.LE.ZERO ) THEN
         RCOND = ZERO
         RESID = ONE / EPS
         RETURN
      END IF
      RCOND = ( ONE / ANORM ) / AINVNM
*
*     Set the diagonal of AINV to 1 if AINV has unit diagonal.
*
      IF( LSAME( DIAG, 'U' ) ) THEN
         DO 10 J = 1, N
            AINV( J, J ) = ONE
   10    CONTINUE
      END IF
*
*     Compute A * AINV, overwriting AINV.
*
      IF( LSAME( UPLO, 'U' ) ) THEN
         DO 20 J = 1, N
            CALL CTRMV( 'Upper', 'No transpose', DIAG, J, A, LDA,
     $                  AINV( 1, J ), 1 )
   20    CONTINUE
      ELSE
         DO 30 J = 1, N
            CALL CTRMV( 'Lower', 'No transpose', DIAG, N-J+1, A( J, J ),
     $                  LDA, AINV( J, J ), 1 )
   30    CONTINUE
      END IF
*
*     Subtract 1 from each diagonal element to form A*AINV - I.
*
      DO 40 J = 1, N
         AINV( J, J ) = AINV( J, J ) - ONE
   40 CONTINUE
*
*     Compute norm(A*AINV - I) / (N * norm(A) * norm(AINV) * EPS)
*
      RESID = CLANTR( '1', UPLO, 'Non-unit', N, N, AINV, LDAINV, RWORK )
*
      RESID = ( ( RESID*RCOND ) / REAL( N ) ) / EPS
*
      RETURN
*
*     End of CTRT01
*
      END
