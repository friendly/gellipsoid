# from heplots; modified to work with p3d


#' Calculate an ellipsoid in 3D
#' 
#' Calculates a \code{\link[rgl]{qmesh3d}} object representing 3D ellipsoid
#' with given \code{center} and \code{shape} matrix.  The function allows for
#' degenerate ellipsoids where the \code{smape} matrix has rank < 3 and plots
#' as an ellipse or a line.
#' 
#' The ellipsoid is calculated by transforming a unit sphere by the Cholesky
#' square root of the \code{shape} matrix, and translating to the
#' \code{center}.
#' 
#' The ellipsoid can be plotted with \code{plot3d}
#' 
#' @param center A vector of length 3 giving the center of the 3D ellipsoid,
#' typically the mean vector of a data matrix.
#' @param shape A 3 x 3 matrix giving the shape of the 3D ellipsoid, typical a
#' covariance matrix of a data matrix.
#' @param radius radius of the ellipsoid, with default \code{radius=1}, giving
#' a standard ellipsoid. For a multivariate sample with \code{dfe} degrees of
#' freedom associated with \code{shape}, an ellipsoid of \code{level} coverage
#' can be calculated using \code{radius=sqrt(3 * qf(level, 3, dfe))}.
#' @param segments number of line segments to use in each direction in the
#' wire-frame representation of the ellipsoid
#' @param warn.rank warn if the \code{shape} matrix is of rank < 3?
#' @return A qmesh3d object %% If it is a LIST, use %% \item{comp1
#' }{Description of 'comp1'} %% \item{comp2 }{Description of 'comp2'} %% ...
#' @author Michael Friendly and John Fox, extending Duncan Murdoch
#' @keywords dplot
#' @examples
#' 
#' 
ellipsoid <- function(center, shape, radius=1, segments=60, warn.rank=FALSE){
	# adapted from the shapes3d demo in the rgl package and from the Rcmdr package
	degvec <- seq(0, 2*pi, length=segments)
	ecoord2 <- function(p) c(cos(p[1])*sin(p[2]), sin(p[1])*sin(p[2]), cos(p[2]))
	v <- t(apply(expand.grid(degvec,degvec), 1, ecoord2))
	if (!warn.rank){
		warn <- options(warn=-1)
		on.exit(options(warn))
	}
	Q <- chol(shape, pivot=TRUE)
	order <- order(attr(Q, "pivot"))
	v <- center + radius * t(v %*% Q[, order])
	v <- rbind(v, rep(1,ncol(v))) 
	e <- expand.grid(1:(segments-1), 1:segments)
	i1 <- apply(e, 1, function(z) z[1] + segments*(z[2] - 1))
	i2 <- i1 + 1
	i3 <- (i1 + segments - 1) %% segments^2 + 1
	i4 <- (i2 + segments - 1) %% segments^2 + 1
	i <- rbind(i1, i2, i4, i3)
	x <- asEuclidean(t(v))
	ellips <- qmesh3d(v, i)
	return(ellips)
}
