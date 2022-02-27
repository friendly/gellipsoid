#' Signature of a Generalized Ellipsoid
#' 
#' Calculates the signature of a generalized ellipsoid, a vector of length 3
#' giving the number of positive, zero and infinite singular values in the (U,
#' D) representation
#' 
#' 
#' @param G   A class \code{"gell"} objects
#' @return    A vector of length 3, with named components \code{pos}, \code{zero}
#'            and \code{inf} 
#' @author Georges Monette
#' @seealso \code{\link{isBounded}}
#' @references Friendly, M., Monette, G. and Fox, J. (2013). Elliptical
#' Insights: Understanding Statistical Methods through Elliptical Geometry.
#' \emph{Statistical Science}, \bold{28}(1), 1-39.
#' @keywords dplot
#' @export
#' @examples
#' 
#' (zsph <- gell(diag(3)))  # unit sphere in R^3
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
#' # signatures of these ellipsoids
#' signature(zsph)
#' signature(zhplane)
#' signature(dual(zhplane))
#' 
signature <-
function(G) {
  # the signature of an ellipsoid: 
  # number of positive singular values, zero singular values and Inf singular values
  d <- G$d
  c(pos = sum( is.finite(d) & d > 0), zero = sum( d==0), inf = sum(!is.finite(d))) 
}

