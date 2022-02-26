# Properties of ellipsoids



#' Tests for Classes of Generalized Ellipsoids
#' 
#' These functions provide tests for classes of generalized ellipsoids in the
#' (U, D) representation, based on the numbers of positive, zero and infinite
#' singular values in D.
#' 
#' They are included here mainly as computational definitions of the terms
#' \sQuote{bounded} for an ellipsoid with finite extent, \sQuote{fat}, for a
#' bounded ellipsoid with non-empty interior, \sQuote{flat}, for degenerate
#' (singular) ellipsoids in \eqn{R^p} with empty interior.
#' 
#' None yet
#' 
#' @aliases isbounded isbounded.gell isfat isfat.gell isflat isunbounded
#' @param x A class \code{"gell"} object
#' @param \dots Other arguments, not used.
#' @return TRUE or FALSE
#' @author Georges Monette
#' @seealso \code{\link{signature}}
#' @references Friendly, M., Monette, G. and Fox, J. (2012). Elliptical
#' Insights: Understanding Statistical Methods through Elliptical Geometry.
#' Under review.
#' @keywords ~kwd1 ~kwd2
#' @examples
#' 
#' # None yet
#' 
isbounded <-
function(x,...) UseMethod('isbounded')

isbounded.gell <- function(x,...) all( is.finite(x$d))

isfat <- function(x,...) UseMethod('isfat')
isfat.gell <- function(x,...) all( x$d > 0)

isflat <- function(x,...) !isfat(x,...)
isunbounded <- function(x,...) !isbounded(x,...)

