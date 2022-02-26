\name{dual}
\alias{dual}
\alias{dual.gell}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Dual or 'Inverse' of an ellipsoid
}
\description{
\code{dual} produces the orthogonal complement for subspaces or for ellipsoids.
This is equivalent to inverting \eqn{\Sigma} or an inner product \code{ip} when these are non-singular.
}
\usage{

dual(x, ...)

\method{dual}{gell}(x, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{

  \item{x}{
An object, of class \code{"gell"}
}
  \item{\dots}{
Other arguments, unused for now.
}

}
\details{
At present, \code{dual} is only defined for objects of class \code{"gell"}.

In the (U,D) representation, the dual simply has the columns of U in the reverse order,
and the reciprocals of the diagonal elements of D, also in reverse order.

}
\value{
A (U, D) representation of the dual, with components
%%  If it is a LIST, use
 \item{u}{Right singular vectors}
 \item{d}{Singular values}
%% ...
}
\references{
Dempster, A. (1969). \emph{Elements of Continuous Multivariate Analysis}
Reading, MA: Addison-Wesley.
}
\author{
Georges Monette
}
%\note{
%%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{gell}}, ~~~
}
\examples{
(zplane <- gell(span = diag(3)[,1:2]))  # a plane

dual(zplane)  # line orthogonal to that plane

(zhplane <- gell(center = c(0,0,2), span = diag(3)[,1:2]))  # a hyperplane

dual(zhplane) # orthogonal line through same center (note that the 'gell'
              # object with a center contains more information than the geometric plane)

zorigin <- gell(span = cbind(c(0,0,0)))
dual( zorigin )
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
