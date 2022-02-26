\name{isbounded}
\alias{isbounded}
\alias{isbounded.gell}
\alias{isfat}
\alias{isfat.gell}
\alias{isflat}
\alias{isunbounded}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Tests for Classes of Generalized Ellipsoids
}
\description{
These functions provide tests for classes of generalized ellipsoids in the (U, D) representation,
based on the numbers of positive, zero and infinite singular values in D. 

They are included here mainly as computational definitions of the terms \sQuote{bounded}
for an ellipsoid with finite extent, \sQuote{fat}, for a bounded ellipsoid with
non-empty interior, \sQuote{flat}, for degenerate (singular) ellipsoids in \eqn{R^p}
with empty interior. 
}
\usage{

isbounded(x, ...)

\method{isbounded}{gell}(x, ...)

isfat(x, ...)

\method{isfat}{gell}(x, ...)

isflat(x, ...)

isunbounded(x, ...)

}
%- maybe also 'usage' for other objects documented here.
\arguments{

  \item{x}{
A class \code{"gell"} object
}
  \item{\dots}{
Other arguments, not used.
}

}

\details{
None yet
}
\value{
TRUE or FALSE
}
\references{
Friendly, M., Monette, G. and Fox, J. (2012).
Elliptical Insights: Understanding Statistical Methods through Elliptical Geometry.
Under review.
}
\author{
Georges Monette
}
%\note{
%%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{signature}}
}
\examples{
# None yet
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
