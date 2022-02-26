#' Linear Transformation of a Generalized Ellipsoid
#' 
#' Linear transformation of a generalized ellipsoid, including projections to
#' subspaces.
#' 
#' The matrix \code{A} can be non-singular, for a standard linear
#' transformation, or singular, for a projection to a subspace.
#' 
#' @param A A matrix describing a linear transformation, conforming to the U
#' component of \code{G} for matrix multiplication.
#' @param G A \code{gell} object
#' @param epsfac Factor of \code{.Machine$double.eps} used to distinguish zero
#' vs. positive singular values
#' @return A list with the following components: %% If it is a LIST, use
#' \item{u}{Right singular vectors} \item{d}{Singular values} %% ...
#' @note This implementation should be changed so that it provides an S3 method
#' for class \code{"gell"} objects for which it was intended.
#' @author Georges Monette
#' @seealso \code{\link{gell}}, \code{\link{dual}}, \code{\link{signature}}
#' @keywords dplot algebra
#' @examples
#' 
#' (zplane <- gell(span = diag(3)[,1:2]))  # a plane
#' 
#' dual(zplane)  # orthogonal line
#' (zplane2 <- gmult( cbind( c(1,1,1), c(1,-1,0), c(1,0,-1)), zplane))
#' (zplane3 <- gmult( cbind( c(1,0,0), c(1,0,0), c(0,0,1)), zplane)) # correctly wipes out one dimension
#' 
#' 
gmult <-
function( A , G , epsfac = 2){
  # Linear transformation of an ellipsoid
  gell( A = A %*% G$u, d = G$d, epsfac = epsfac)
}

