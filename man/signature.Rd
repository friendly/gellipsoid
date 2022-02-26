\name{signature}
\alias{signature}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Signature of a Generalized Ellipsoid
}
\description{
Calculates the signature of a generalized ellipsoid, a vector of length 3
giving the number of positive, zero and infinite singular values in the 
(U, D) representation 
}
\usage{
signature(G)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{G}{
A class \code{"gell"} objects
}
}
%\details{
%%%  ~~ If necessary, more details than the description above ~~
%}
\value{
A vector of length 3, with named components \code{pos}, \code{zero} and \code{inf}
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
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
\code{\link{isbounded}}, ~~~
}
\examples{
(zsph <- gell(diag(3)))  # unit sphere in R^3

(zplane <- gell(span = diag(3)[,1:2]))  # a plane

dual(zplane)  # line orthogonal to that plane

(zhplane <- gell(center = c(0,0,2), span = diag(3)[,1:2]))  # a hyperplane

dual(zhplane) # orthogonal line through same center (note that the 'gell'
              # object with a center contains more information than the geometric plane)

zorigin <- gell(span = cbind(c(0,0,0)))
dual( zorigin )

# signatures of these ellipsoids
signature(zsph)
signature(zhplane)
signature(dual(zhplane))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{dplot}
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
