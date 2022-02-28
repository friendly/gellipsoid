# Properties of ellipsoids



#' Tests for Classes of Generalized Ellipsoids
#' 
#' These functions provide tests for classes of generalized ellipsoids in the
#' (U, D) representation, based on the numbers of positive, zero and infinite
#' singular values in D.
#' 
#' They are included here mainly as computational definitions of the terms
#' \sQuote{bounded} for an ellipsoid with finite extent, 
#' \sQuote{fat}, for a bounded ellipsoid with non-empty interior, 
#' \sQuote{flat}, for degenerate (singular) ellipsoids 
#' in \eqn{R^p} with empty interior.
#' 
#' 
#' @aliases isBounded isBounded.gell isFat isFat.gell isFlat isFlat.gell isUnbounded isUnboundede.gell
#' @param x A class \code{"gell"} object
#' @param   \dots Other arguments, not used.
#' @return  TRUE or FALSE
#' @author Georges Monette
#' @seealso \code{\link{signature}}
#' @references Friendly, M., Monette, G. and Fox, J. (2013). Elliptical
#' Insights: Understanding Statistical Methods through Elliptical Geometry.
#' \emph{Statistical Science}, \bold{28}(1), 1-39.
#' @keywords logic 
#' @export
#' @examples
#' 
#' # None yet
#' 
isBounded <-
function(x,...) UseMethod('isBounded')

#' @rdname isBounded
#' @export
isBounded.gell <- function(x,...) all( is.finite(x$d))

#  @method isFat gell
#  @method isFlat gell
#  @method isUnbounded gell

#' @rdname isBounded
#' @export
isFat <- function(x,...) UseMethod('isFat')
isFat.gell <- function(x,...) all( x$d > 0)

#' @rdname isBounded
#' @export
isFlat <- function(x,...) UseMethod('isFlat')
isFlat.gell <- function(x,...) !isFat(x,...)

#' @rdname isBounded
#' @export
isUnbounded <- function(x,...) UseMethod('isUnbounded')
isUnbounded.gell <- function(x,...) !isBounded(x,...)

