#' (U, D) Representation of an Ellipsoid in R^p.
#' 
#' \code{gell} provides a set of ways to specify a generalized ellipsoid in
#' \eqn{R^p}, using the (U, D) representation to include all special cases,
#' where U is a square orthogonal matrix, and D is diagonal with extended
#' non-negative real numbers, i.e. 0, Inf or a positive real.
#' 
#' The resulting class of ellipsoids includes degenerate ellipsoids that are
#' flat and/or unbounded. Thus ellipsoids are naturally defined to include
#' lines, hyperplanes, points, cylinders, etc.
#' 
#' \code{} can currently generate the (U, D) representation from 5 ways of
#' specifying an ellipsoid:
#' 
#' \enumerate{ 
#' \item From the non-negative definite dispersion (variance)
#' matrix, Sigma: U D^2 U' = Sigma, where some elements of the diagonal matrix
#' D can be 0. This can only generate bounded ellipsoids, possibly flat.
#' 
#' \item From the non-negative definite inner product matrix 'ip': U W^2 U = C
#' where some elements of the diagonal matrix W can be 0. Then set D = W^-1
#' where 0^-1 = Inf. This can only generate fat (non-empty interior)
#' ellipsoids, possibly unbounded.
#' 
#' \item From a subspace spanned by 'span' Let U_1 be an orthonormal basis of
#' Span('span'), let U_2 be an orthonormal basis of the orthogonal complement,
#' the U = [ U_1 U_2 ] and D = diag( c(Inf,...,Inf, 0,..,0)) where the number
#' of Inf's is equal to the number of columns of U_1.
#' 
#' \item From a transformation of the unit sphere given by A(Unit sphere) where
#' A = UDV', i.e. the SVD.
#' 
#' \item (Generalization of 4): A, d where A is any matrix and d is a vector of
#' factors corresponding to columns of A. These factors can be 0, positive or
#' Inf. In this case U and D are such that U D(Unit sphere) = A diag(d)(Unit
#' sphere). This is the only representation that can be used for all forms of
#' ellipsoids and in which any ellipsoid can be represented. }
#' 
#' @aliases gell gell.default gell.gell
#' @param x      An object
#' @param center A vector specifying the center of the ellipsoid
#' @param Sigma  A square, symmetric, non-negative definite dispersion
#'               (variance) matrix
#' @param ip     A square, symmetric, non-negative definite inner product matrix.
#' See Details.
#' @param span   A subspace with a given span.  See Details.
#' @param A      A matrix giving a linear transformation of the unit sphere.
#' @param u      A U matrix
#' @param d      Diagonal elements of a D matrix
#' @param epsfac Factor of \code{.Machine$double.eps} used to distinguish zero
#'               vs. positive singular values
#' @param \dots Other arguments
#' @return A     (U, D) representation of the ellipsoid, with components 
#'               \item{center}{center} 
#'               \item{u}{Right singular vectors}
#' \item{d}{Singular values} %% ...
#' @author Georges Monette
#' @seealso \code{\link{dual}}, \code{\link{gmult}}, \code{\link{signature}},
#' @references Friendly, M., Monette, G. and Fox, J. (2013). Elliptical
#' Insights: Understanding Statistical Methods through Elliptical Geometry.
#' \emph{Statistical Science}, \bold{28}(1), 1-39.
#' @keywords dplot multivariate
#' @export
#' @examples
#' 
#' # None yet
#' 
gell <- function(x,...) UseMethod("gell")

gell.default <- function(center = 0, Sigma, ip, span , A, u, d=1, epsfac = 2){
  # 
  # U-D representation of an ellipsoid in R^d.
  # 
  # (U is square orthogonal and D diagonal with extended non-negative real 
  # numbers, i.e. 0, Inf or a positive real.
  # 
  # The resulting class of ellipsoids includes ellipsoids that are flat and/or 
  # unbounded. Thus ellipsoids are naturally defined to include lines, 
  # hyperplanes, points, cylinders, etc.
  # 
  # The class is closed under linear and affine transformations (including those
  # between spaces of different dimensions) and under duality ('inverse') 
  # transformations.
  # 
  # Unbounded ellipsoids, e.g. cylinders with elliptical cross-sections, 
  # correspond to singular inner products, i.e. inner products defined by a 
  # singular inner product matrix.
  # 
  # Flat ellipsoids correspond to singular variances. The corresponding inner 
  # product is defined only on the supporting subspace.
  # 
  # Ellipsoids that are both flat and unbounded correspond to lines, points, 
  # subspaces, hyperplanes, etc.
  # 
  # 'gell' can currently generate the U-D representation from 5 ways of
  # specifying an ellipsoid:
  # 
  # 1) From the non-negative definite dispersion (variance) matrix, Sigma: U D^2
  # U' = Sigma, where some elements of the diagonal matrix D can be 0. This can
  # only generate bounded ellipsoids, possibly flat.
  # 
  # 2) From the non-negative definite inner product matrix 'ip': U W^2 U = C
  # where some elements of the diagonal matrix W can be 0. Then set D = W^{-1}
  # where 0^{-1} = Inf. This can only generate fat (non-empty interior)
  # ellipsoids, possibly unbounded.
  # 
  # 3) From a subspace spanned by 'span' Let U_1 be an orthonormal basis of 
  # Span('span'), let U_2 be an orthonormal basis of the orthogonal complement, 
  # the U = [ U_1  U_2 ] and D = diag( c(Inf,...,Inf, 0,..,0)) where the number 
  # of Inf's is equal to the number of columns of U_1.
  # 
  # 4) From a transformation of the unit sphere given by A(Unit sphere) where 
  # A = UDV', i.e. the SVD.
  # 
  # 5) (Generalization of 4): A, d where A is any matrix and d is a vector of 
  # factors corresponding to columns of A. These factors can be 0, positive or
  # Inf. In this case U and D are such that U D(Unit sphere) = A diag(d)(Unit
  # sphere). This is the only representation that can be used for all forms of
  # ellipsoids and in which any ellipsoid can be represented.
  # 
  # 
  if( nargs() == 0) {
    Sigma <- diag(2)
    center <- c(0,0)
  }
  if (missing(Sigma) && missing(ip) && missing(u) && missing(A) && is.matrix(center)) {
      Sigma <- center
      center <- 0
  }
  if( !missing(Sigma)){
    if( !all.equal(Sigma, t(Sigma))) stop ( "Sigma must be symmetric")
    s <- eigen(Sigma)
    if ( any ( s$values < 0)) stop( "Sigma must be non-negative definite")
    ret <- list(center=rep(center, length.out=nrow(Sigma)),
                u = s$vectors, 
                d = sqrt(s$values))
    class(ret) <- 'gell'
    return(ret)
  }
  else if(!missing(ip)){
    if( !all.equal(ip, t(Sigma))) stop ( "ip must be symmetric")
    s <- eigen(ip)
    if ( any ( s$values < 0)) stop( "ip must be non-negative definite")
    n <- length(d$values)
    ret <- list(center=rep(center, length.out=nrow(Sigma)),
                u = s$vectors[,n:1], 
                d = rev(1/sqrt(s$values)))
    class(ret) <- 'gell'
    return(ret)
  }
  else if(!missing(span)){
    span <- cbind(span)
    s <- UD(span)  
    d <- c(s$d,rep(0,nrow(span)))
    d <- d[1:nrow(span)]
    d[d>0] <- Inf
    ret <- list ( center =rep(center, length.out=nrow(span) ),
                  u = s$u,
                  d = d)
    class(ret) <- 'gell'
    return(ret)
  }
  else if (!missing(u)) {
    ret <- list( center = rep( center, length.out= nrow(u)),
          u = u,
          d = rep(d, length.out=nrow(u)))
    class(ret) <- 'gell'
    return(ret)    
  }
  # following needs to be modified for off center ellipses:
  else if(!missing(A)) { #if(!missing(A)) return( gmult( A, gell(u=diag(ncol(A)),d=d)))
    if(missing(d)) d <- rep(d,ncol(A))
    else if (length(d) != ncol(A)) stop( "length(d) must equal ncol(A)")
    if ( all(is.finite(d))) {
      s <- UD(A%*%diag(d,nrow=ncol(A)))
      ret <- list(center = rep( center, length.out= nrow(A)),
        u = s$u,
        d = s$d)
      class(ret) <- "gell"
      return(ret)
    } else {  # some d are Inf
      if(all(!is.finite(d))) return( gell( center = center, span = A))
      Ai <- A[, !is.finite(d), drop=FALSE]
      Af <- A[, is.finite(d), drop=FALSE]
      UDi <- UD(Ai)
      Ui <- UDi$u[,UDi$d > epsfac*.Machine$double.eps, drop=FALSE]
      Afr <- qr.resid(qr(Ui), Af)
      dfin <- d[is.finite(d)]
      maxd <- max(dfin)
      At <- cbind( Ui*(maxd+1), Afr %*% diag(dfin,nrow=ncol(Afr)))
      ud <- UD(At)
      d <- ud$d
      d[d>maxd] <- Inf
      ret <- list( center = rep( center, length.out= nrow(A)),
                   u = ud$u,
                   d = d)
      class(ret) <- "gell"
      return( ret)
    }
  }
  stop( "combination of arguments not implemented")
}

gell.gell <- function(x,...){
  if( ! all(x$d == rev(sort(x$d)))) {
    warning( 'd was not sorted')
    ord <- order(x$d)
    x$u <- x$u [ , rev(ord)]
    x$d <- x$d [ rev(ord)]
  }  
  if( ! isTRUE( all.equal( crossprod(x$u), diag(length(x$d))))) {
    warning( "u is not orthonormal")
  }
  x  
}
  
