\name{UD}
\alias{UD}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
SVD, modified to  return U, and D extended with 0's
}
\description{
Calculates U and D in the (U, D) representation of a generalized ellipsoid.
This uses the SVD, modified to  return U, and D extended with 0's
for singular matrices.
}
\usage{
UD(x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
A matrix
}
}
%\details{
%%%  ~~ If necessary, more details than the description above ~~
%}
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
%\note{
%%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link[base]{svd}}, ~~~
}
\examples{
# None yet
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{dplot}
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
