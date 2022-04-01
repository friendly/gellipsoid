##
# Functions to save and restore the par3d parameters for an rgl scene
#
# Use to make a manually manipulated rgl view reproducible
# Within an R session, simply par3d.save the view(s) to named objects
# Across sessions, use the filename arguement to save these to .rds files



#' Save and Restore the par3d Parameters for an rgl Scene
#' 
#' Use this function to make a manually manipulated rgl view reproducible, within sessions or
#' across sessions. Within an R session, simply use \code{par3d.save} to record
#' the \code{par3d} parameters for the view(s) to named objects. Across
#' sessions, use the \code{filename} argument to save these to .rds files
#' 
#' 
#' @aliases par3d.restore par3d.save
#' @param params   A list of \code{par3d} parameters to save
#' @param filename Name of a \code{.rds} file to save to or restore from
#' @param dev      The rgl device.  Currently unused
#' @return \code{par3d.save} returns a list with the current values of the
#' \code{par3d} parameters named in \code{params}. 
#' @author Michael Friendly
#' @seealso \code{\link[rgl]{par3d}}
#' @keywords dplot dynamic
#' @export
#' @examples
#' 
#' \dontrun{
#' 	library(rgl)
#' 	open3d()
#' 	# ...
#' 	parms <- par3d.save()
#' 	# ....
#' 	par3d.restore(parms)
#' 	
#' }
#' 
#' 
par3d.save <-
function (params = c("userMatrix", "scale", "zoom", "FOV"), filename, dev = rgl.cur()) 
{
    parms <- par3d(params)
    if (length(params) == 1) {
        parms <- list(parms)
        names(parms) <- params
    }
    if(!missing(filename)) saveRDS(parms, file=filename)
    invisible(parms)
}

#' @param parms    A list of \code{par3d} parameters to restore
#' @rdname par3d.save
#' @export
par3d.restore <-
function (parms, filename) {
    if(!missing(filename)) parms <- readRDS(file=filename)
    par3d(parms)
}
 
