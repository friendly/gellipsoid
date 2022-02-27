#' Dual or 'Inverse' of an ellipsoid
#' 
#' \code{dual} produces the orthogonal complement for subspaces or for
#' ellipsoids. This is equivalent to inverting \eqn{\Sigma} or an inner product
#' \code{ip} when these are non-singular.
#' 
#' At present, \code{dual} is only defined for objects of class \code{"gell"}.
#' 
#' In the (U,D) representation, the dual simply has the columns of U in the
#' reverse order, and the reciprocals of the diagonal elements of D, also in
#' reverse order.
#' 
#' @aliases dual dual.gell
#' @param x An object, of class \code{"gell"}
#' @param \dots Other arguments, unused for now.
#' @return A (U, D) representation of the dual, with components %% If it is a
#' LIST, use \item{u}{Right singular vectors} \item{d}{Singular values} %% ...
#' @author Georges Monette
#' @seealso \code{\link{gell}}, ~~~
#' @references Dempster, A. (1969). \emph{Elements of Continuous Multivariate
#' Analysis} Reading, MA: Addison-Wesley.
#' @keywords aplot
#' @export
#' @examples
#' 
#' (zplane <- gell(span = diag(3)[,1:2]))  # a plane
#' 
#' dual(zplane)  # line orthogonal to that plane
#' 
#' (zhplane <- gell(center = c(0,0,2), span = diag(3)[,1:2]))  # a hyperplane
#' 
#' dual(zhplane) # orthogonal line through same center (note that the 'gell'
#'               # object with a center contains more information than the geometric plane)
#' 
#' zorigin <- gell(span = cbind(c(0,0,0)))
#' dual( zorigin )
#' 
dual <-
function(x,...) UseMethod("dual")

dual.gell <-
function(x,...) {
  n <- length(x$d)
  x$d <- rev(1/x$d)
  x$u <- x$u[,n:1]
  x  
}
