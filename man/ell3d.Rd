% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ell3d.R
\name{ell3d}
\alias{ell3d}
\alias{ell3d.default}
\alias{ell3d.gell}
\title{Plot Generalized Ellipsoids in 3D using rgl}
\usage{
ell3d(x, ...)

\method{ell3d}{default}(x, shape, radius = 1, segments = 40, shade = TRUE, wire = FALSE, ...)

\method{ell3d}{gell}(
  x,
  length = 10,
  sides = 30,
  segments = 40,
  shade = TRUE,
  wire = FALSE,
  ...
)
}
\arguments{
\item{x}{A vector of length 3 giving the center of the ellipsoid for the
default method, or a class \code{"gell"} object for the gell method.}

\item{\dots}{Other arguments, passed to \code{\link{ellipsoid}}}

\item{shape}{A 3 x 3 symmetric matrix giving the shape of the ellipsoid.}

\item{radius}{radius of the ellipsoid}

\item{segments}{number of segments in each direction in calculating the
\code{mesh3d} object}

\item{shade}{Logical. Whether the 3D ellipsoid should be shaded}

\item{wire}{Logical. Whether the 3D ellipsoid should be rendered with its
wire frame}

\item{length}{For unbounded, (infinite) ellipsoids, the length to display
for infinite dimensions}

\item{sides}{For unbounded, cylindrical ellipsoids, the number of sides for
the elliptical cross sections}
}
\value{
Returns the result of the call to \code{\link{ellipsoid}}
}
\description{
\code{ell3d} is a convenience wrapper for \code{\link{ellipsoid}}
specialized for class \code{"gell"} objects. It plots an
ellipsoid in the current rgl window.
}
\note{
This implementation is subject to change.
}
\examples{

# a proper ellipsoid, and its inverse
c1 <- c(0,0,0)
C1 <- matrix(c(6, 2, 1,
               2, 3, 2,
               1, 2, 2), 3,3)

open3d()
zell1 <- gell(center=c1, Sigma=C1)
E1 <- ell3d(zell1, col="blue", alpha=0.1)
# inverse of C1
E1I <- ell3d(dual(zell1), col="blue", alpha=0.1, wire=TRUE)

#open3d()  ## to see this in a new window
# a singular ellipsoid and its inverse
c2 <- c1
C2 <- matrix(c(6, 2, 0,
               2, 3, 0,
               0, 0, 0), 3,3)

E2 <- ell3d( zell2 <-gell( center = c2, Sigma = C2), 
             col = 'red', alpha = 0.25, wire = TRUE)
E2I <- ell3d( dual(gell( center = c2, Sigma = C2)), 
             length=3, col = 'red', alpha = 0.25, wire = TRUE )

# signatures
signature(zell1)
signature(zell2)


}
\seealso{
\code{\link{ellipsoid}}, \code{\link{gell}}
}
\author{
Georges Monette
}
\keyword{hplot}
