
#' Draw Basis Vectors in an rgl Scene
#' 
#' The function calculates and optionally draws basis vectors to be used as
#' coordinate axes in an rgl 3D display.  For geometric diagrams and some data
#' displays, this can be more useful than using \code{\link[rgl]{axis3d}} or
#' \code{\link[rgl]{box3d}} to provide guides or axes.  The \code{origin}
#' argument permits multiple diagrams or graphs in the same display, each with
#' their own coordinate axes.
#' 
#' 
#' @param matrix A 3 x 3 matrix, whose \emph{columns} are the basis vectors,
#' typically of unit length.
#' @param origin Origin in the rgl scene of the basis vectors
#' @param scale Scaling factor for the basis vectors
#' @param draw If \code{TRUE}, the vectors are plotted
#' @param label If \code{TRUE}, the vectors are labeled at their tips
#' @param texts A character vector of length 3 used for labels. Defaults to
#' \code{c("x", "y", "z")}.
#' @param lwd Line width for vectors
#' @param cex Character size for labels
#' @param \dots Other arguments, passed to \code{\link[rgl]{segments3d}} and
#' \code{\link[rgl]{text3d}}
#' @return Returns invisibly a 6 x 3 matrix, whose columns are the coordinate
#' axes, \code{c("x", "y", "z")}.  Odd numbered rows give the coordinates of
#' the \code{origin}, while even numbered rows give the locations of the tips
#' of the vectors.
#' @author Michael Friendly
#' @seealso \code{\link[rgl]{axis3d}}, \code{\link[rgl]{box3d}}
#' @export
#' @examples
#' 
#' # show two different sets of basis vectors
#' open3d()
#' basis3d()
#' A <- matrix(c(1,2,0.1,
#'               2,1,0.1,
#'               0.1,0.1,0.5), 3,3)
#' basis3d(t(A), col="red")
#' 
#' # scene with two different displays
#' open3d()
#' basis3d()
#' basis3d(origin=c(2,0,0))
#' 
#' 
basis3d <- function(
  matrix=diag(3), 
  origin=c(0,0,0), 
  scale=1, 
	draw=TRUE, label=draw, 
  texts=colnames(basis), lwd=3, cex=2, ...) {

	basis <- translate3d(scale*matrix, origin[1], origin[2], origin[3])
	basis <- rbind(origin, basis[1,], origin, basis[2,], origin, basis[3,])
	colnames(basis) <- unlist(strsplit("xyz", ""))
	if(draw) segments3d(basis, lwd=lwd, ...)
	if(label) text3d(scale*.1 + basis[c(2,4,6),], texts=texts, cex=cex, ...)
	invisible(basis)
}
