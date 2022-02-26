\name{par3d.save}
\alias{par3d.restore}
\alias{par3d.save}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Save and Restore the par3d Parameters for an rgl Scene
}
\description{
Use to make a manually manipulated rgl view reproducible, within sessions
or across sessions.
Within an R session, simply use \code{par3d.save}
to record the \code{par3d} parameters for the view(s) to named objects.
Across sessions, use the \code{filename} argument to save these to .rds files

}
\usage{

par3d.save(params = c("userMatrix", "scale", "zoom", "FOV"), filename, dev = rgl.cur())

par3d.restore(parms, filename)

}
%- maybe also 'usage' for other objects documented here.
\arguments{

  \item{params}{
A list of \code{par3d} parameters to save
}
  \item{parms}{
%%     ~~Describe \code{parms} here~~
}
  \item{filename}{
Name of a \code{.rds} file to save to or restore from 
}

  \item{dev}{
The rgl device.  Currently unused
}
}
\details{
None yet.
}
\value{
\code{par3d.save} returns a list with the current values of the \code{par3d}
parameters named in \code{params}.
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
%\references{
%%% ~put references to the literature/web site here ~
%}
\author{
Michael Friendly
}
%\note{
%%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link[rgl]{par3d}}, ~~~
}
\examples{
\dontrun{
	library(rgl)
	open3d()
	# ...
	parms <- par3d.save()
	# ....
	par3d.restore(parms)
	
}

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{dplot}
\keyword{dynamic}% __ONLY ONE__ keyword per line
