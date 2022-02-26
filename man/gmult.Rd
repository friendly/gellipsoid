\name{gmult}
\alias{gmult}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Linear Transformation of a Generalized Ellipsoid
}
\description{
Linear transformation of a generalized ellipsoid, including projections to subspaces.
}
\usage{
gmult(A, G, epsfac = 2)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{A}{
A matrix describing a linear transformation, conforming to the U component of \code{G}
for matrix multiplication.
}
  \item{G}{
A \code{gell} object
}
  \item{epsfac}{
Factor of \code{.Machine$double.eps} used to distinguish zero vs. positive singular values
}
}
\details{
The matrix \code{A} can be non-singular, for a standard linear transformation, or singular,
for a projection to a subspace. 
}
\value{
A list with the following components:
%%  If it is a LIST, use
 \item{u}{Right singular vectors}
 \item{d}{Singular values}
%% ...
}
%\references{
%%% ~put references to the literature/web site here ~
%}
\author{
Georges Monette
}
\note{
This implementation should be changed so that it provides an S3 method for class \code{"gell"} objects
for which it was intended.
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{gell}}, \code{\link{dual}}, \code{\link{signature}}
}
\examples{
(zplane <- gell(span = diag(3)[,1:2]))  # a plane

dual(zplane)  # orthogonal line
(zplane2 <- gmult( cbind( c(1,1,1), c(1,-1,0), c(1,0,-1)), zplane))
(zplane3 <- gmult( cbind( c(1,0,0), c(1,0,0), c(0,0,1)), zplane)) # correctly wipes out one dimension

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{dplot}
\keyword{algebra}% __ONLY ONE__ keyword per line
