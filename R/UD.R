#' SVD, modified to return U, and D extended with 0's
#' 
#' Calculates U and D in the (U, D) representation of a generalized ellipsoid.
#' This uses the SVD, modified to return U, and D extended with 0's for
#' singular matrices.
#' 
#' 
#' @param x A matrix
#' @return A list with the following components: 
#'    \item{u}{Right singular vectors} 
#'    \item{d}{Singular values} 
#' @author Georges Monette
#' @seealso \code{\link[base]{svd}}
#' @keywords dplot
#' @export
#' @examples
#' 
#' # None yet
#' 
UD <-
function(x) {
  # SVD modified to return U, and D extended with 0's
  x <- as.matrix(x)
  ret <- svd(x,nu=nrow(x),nv=0)[c('u','d')]
  if( length(ret$d) < nrow(x)) 
    ret$d <-
      c(ret$d, rep(0,length.out=nrow(x)-length(ret$d)))
  ret
}

