% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/basis3d.R
\name{basis3d}
\alias{basis3d}
\title{Draw Basis Vectors in an rgl Scene}
\usage{
basis3d(
  matrix = diag(3),
  origin = c(0, 0, 0),
  scale = 1,
  draw = TRUE,
  label = draw,
  texts = colnames(basis),
  lwd = 3,
  cex = 2,
  ...
)
}
\arguments{
\item{matrix}{A 3 x 3 matrix, whose \emph{columns} are the basis vectors,
typically of unit length.}

\item{origin}{Origin in the rgl scene of the basis vectors}

\item{scale}{Scaling factor for the basis vectors}

\item{draw}{If \code{TRUE}, the vectors are plotted}

\item{label}{If \code{TRUE}, the vectors are labeled at their tips}

\item{texts}{A character vector of length 3 used for labels. Defaults to
\code{c("x", "y", "z")}.}

\item{lwd}{Line width for vectors}

\item{cex}{Character size for labels}

\item{\dots}{Other arguments, passed to \code{\link[rgl]{segments3d}} and
\code{\link[rgl]{text3d}}}
}
\value{
Returns invisibly a 6 x 3 matrix, whose columns are the coordinate
axes, \code{c("x", "y", "z")}.  Odd numbered rows give the coordinates of
the \code{origin}, while even numbered rows give the locations of the tips
of the vectors.
}
\description{
The function calculates and optionally draws basis vectors to be used as
coordinate axes in an rgl 3D display.  For geometric diagrams and some data
displays, this can be more useful than using \code{\link[rgl]{axis3d}} or
\code{\link[rgl]{box3d}} to provide guides or axes.  The \code{origin}
argument permits multiple diagrams or graphs in the same display, each with
their own coordinate axes.
}
\examples{

# show two different sets of basis vectors
open3d()
basis3d()
A <- matrix(c(1,2,0.1,
              2,1,0.1,
              0.1,0.1,0.5), 3,3)
basis3d(t(A), col="red")

# scene with two different displays
open3d()
basis3d()
basis3d(origin=c(2,0,0))


}
\seealso{
\code{\link[rgl]{axis3d}}, \code{\link[rgl]{box3d}}
}
\author{
Michael Friendly
}
