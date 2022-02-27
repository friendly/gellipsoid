#' Plot Generalized Ellipsoids in 3D using rgl
#' 
#' \code{ell3d} is a convenience wrapper for \code{\link{ellipsoid}}
#' specialized for class \code{"gell"} objects. It plots an
#' ellipsoid in the current rgl window.
#' 
#' 
#' @aliases ell3d ell3d.default ell3d.gell
#' @param   x A vector of length 3 giving the center of the ellipsoid for the
#'          default method, or a class \code{"gell"} object for the gell method.
#' @param   \dots Other arguments, passed to \code{\link{ellipsoid}}
#' @param   shape A 3 x 3 symmetric matrix giving the shape of the ellipsoid.
#' @param   radius radius of the ellipsoid
#' @param   segments number of segments in each direction in calculating the
#'          \code{mesh3d} object
#' @param   shade Logical. Whether the 3D ellipsoid should be shaded
#' @param   wire Logical. Whether the 3D ellipsoid should be rendered with its
#'          wire frame
#' @param   length For unbounded, (infinite) ellipsoids, the length to display
#'          for infinite dimensions
#' @param   sides For unbounded, cylindrical ellipsoids, the number of sides for
#'          the elliptical cross sections
#' @return Returns the result of the call to \code{\link{ellipsoid}} 
#' @note This implementation is subject to change.
#' @author Georges Monette
#' @seealso \code{\link{ellipsoid}}, \code{\link{gell}}
#' @keywords hplot
#' @export
#' @examples
#' 
#' # a proper ellipsoid, and its inverse
#' c1 <- c(0,0,0)
#' C1 <- matrix(c(6, 2, 1,
#'                2, 3, 2,
#'                1, 2, 2), 3,3)
#' 
#' open3d()
#' zell1 <- gell(center=c1, Sigma=C1)
#' E1 <- ell3d(zell1, col="blue", alpha=0.1)
#' # inverse of C1
#' E1I <- ell3d(dual(zell1), col="blue", alpha=0.1, wire=TRUE)
#' 
#' #open3d()  ## to see this in a new window
#' # a singular ellipsoid and its inverse
#' c2 <- c1
#' C2 <- matrix(c(6, 2, 0,
#'                2, 3, 0,
#'                0, 0, 0), 3,3)
#' 
#' E2 <- ell3d( zell2 <-gell( center = c2, Sigma = C2), 
#'              col = 'red', alpha = 0.25, wire = TRUE)
#' E2I <- ell3d( dual(gell( center = c2, Sigma = C2)), 
#'              length=3, col = 'red', alpha = 0.25, wire = TRUE )
#' 
#' # signatures
#' signature(zell1)
#' signature(zell2)
#' 
#' 
ell3d <- function(x, ...) UseMethod("ell3d")

#' Default ell3d method
#'
#' @export
#' @rdname ell3d
#'  
ell3d.default <- function(x, 
                          shape, 
                          radius=1, 
                          segments = 40, 
                          shade=TRUE, 
                          wire=FALSE, ...) {
  E <- ellipsoid(x, shape, radius=radius, segments = segments)
  if (shade) E <- shade3d(E, ...)
  if (wire)  E <- wire3d(E, ...)
  invisible(E)
}

#' ell3d method for generalized ellipsoid gell objects
#' 
#' @export
#' @rdname ell3d
#'  
ell3d.gell <- function( x, 
                        length = 10, 
                        sides = 30, 
                        segments = 40, 
                        shade=TRUE, wire=FALSE, ...){
  
  if ( isbounded(x) ) { # proper (fat bounded) ellipsoid or bounded flat
        E <- ellipsoid( 
          center = x$center, 
          shape = tcrossprod( x$u %*% diag(x$d)), radius = 1, segments = segments)

  }
  else if (all(signature(x) == c(2,0,1))) { # cylinder
    e1 <- e2 <- center <- matrix(0, nrow=2*length + 1, ncol =3)
    center[,1] <- -length:length
    e1[,1] <- 1
    e2[,2] <- 1
    # unit cylinder
    ucyl <- cylinder3d(center = center, e1 = e1, e2 = e2, radius = 1, sides = sides)
    d <- x$d
    d[is.infinite(d)] <- 1
    mat <- x$u %*% diag(d)
    E <- rotate3d(ucyl, matrix = t(mat) )
    E <- translate3d(E, x$center[1],x$center[2],x$center[3])
  } else stop(paste("Signature", signature(x), "not yet implemented"))
  if (shade) shade3d(E, ...)
  if (wire)  wire3d(E, ...)
  invisible(E)                                          
}

