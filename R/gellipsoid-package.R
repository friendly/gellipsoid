

#' Generalized ellipsoids
#' 
#' Represents generalized ellipsoids with the "(U,D)" representation, allowing
#' both degenerate and unbounded ellipsoids, together with methods for linear
<<<<<<< HEAD
#' and duality transformations, and for plotting.
#' This permits exploration of a variety to statistical issues that cen be visualized using ellipsoids
#' as discussed by Friendly, Fox & Monette (2013), "Elliptical Insights: Understanding Statistical Methods 
#  Through Elliptical Geometry" <doi:10.1214/12-STS402>.

#' 
=======
#' and duality transformations, and for plotting. 
#' The ideas are described in Friendly, Monette & Fox (2013) \doi{10.1214/12-STS402}.
#' 
#' \tabular{ll}{ 
#' Package:  \tab gellipsoid\cr Type: \tab Package\cr 
#' Version:  \tab 0.7.2\cr 
#' Date:     \tab 2022-04-19\cr 
#' License:  \tab GPL (>=2)\cr 
#' LazyLoad: \tab yes\cr 
#' }
>>>>>>> 431bc9fbb60a42b1fe5576209ae78ced6239249f
#' 
#' It uses the (U, D) representation of generalized ellipsoids in \eqn{R^d},
#' where
#' \eqn{U} is square orthogonal and \eqn{D} is diagonal with extended non-negative real
#' numbers, i.e. 0, Inf or a positive real). These are roughly analogous to the
#' corresponding terms in the singular-value decomposition of a matrix,
#' \eqn{X = U D V'}.
#' 
#' The resulting class of ellipsoids includes degenerate ellipsoids that are
#' flat and/or unbounded. Thus ellipsoids are naturally extended to include
#' lines, hyperplanes, points, cylinders, etc.
#' 
#' The class is closed under linear and affine transformations (including those
#' between spaces of different dimensions) and under duality ('inverse')
#' transformations.
#' 
#' \bold{Unbounded} ellipsoids, e.g. cylinders with elliptical cross-sections,
#' correspond to singular inner products, i.e. inner products defined by a
#' singular inner product matrix.
#' 
#' \bold{Flat} ellipsoids correspond to singular variances. The corresponding inner
#' product is defined only on the supporting subspace.
#' 
#' Ellipsoids that are both flat and unbounded correspond to lines, points,
#' subspaces, hyperplanes, etc.
#' 
#' \code{\link{gell}} can currently generate the U-D representation from 5 ways
#' of specifying an ellipsoid:
#' 
#' \enumerate{ 
#' \item From the non-negative definite dispersion (variance)
#' matrix, Sigma: \eqn{U D^2 U' = \Sigma}, 
#' where some elements of the diagonal matrix
#' D can be 0. This can only generate bounded ellipsoids, possibly flat.
#' 
#' \item From the non-negative definite inner product matrix 'ip': \eqn{U W^2 U = C}
#' where some elements of the diagonal matrix W can be 0. Then set D = W^-1
#' where 0^-1 = Inf. This can only generate fat (non-empty interior)
#' ellipsoids, possibly unbounded.
#' 
#' \item From a subspace spanned by 'span' Let U_1 be an orthonormal basis of
#' Span('span'), let U_2 be an orthonormal basis of the orthogonal complement,
#' the U = [ U_1 U_2 ] and D = diag( c(Inf,...,Inf, 0,..,0)) where the number
#' of Inf's is equal to the number of columns of U_1.
#' 
#' \item From a transformation of the unit sphere given by A(Unit sphere) where
#' \eqn{A = U D V'}, i.e. the SVD.
#' 
#' \item (Generalization of 4): (A, d) where A is any matrix and d is a vector of
#' factors corresponding to columns of A. These factors can be 0, positive or
#' Inf. In this case U and D are such that U D(Unit sphere) = A diag(d)(Unit
#' sphere). This is the only representation that can be used for all forms of
#' ellipsoids and in which any ellipsoid can be represented. 
#' }
#' 
#' @name gellipsoid-package
#' @aliases gellipsoid-package gellipsoid
#' @docType package
#' @author Georges Monette and Michael Friendly
#' 
#' Maintainer: Michael Friendly <friendly@@yorku.ca>
#' @seealso \code{\link{dual}}, \code{\link{ellipsoid}}, \code{\link{gell}},  \code{\link{UD}}
#' 
#' @import rgl
#' @references 
#' Friendly, M., Monette, G. and Fox, J. (2013). Elliptical
#' Insights: Understanding Statistical Methods through Elliptical Geometry.
#' \emph{Statistical Science}, \bold{28}(1), 1-39. 
#' Online: \url{https://www.datavis.ca/papers/ellipses-STS402.pdf},
#' DOI: \doi{10.1214/12-STS402}
#' @keywords package
#' @examples
#' 
#' (zsph <- gell(Sigma = diag(3)))  # unit sphere in R^3
#' 
#' (zplane <- gell(span = diag(3)[, 1:2]))  # a plane
#' 
#' dual(zplane)  # line orthogonal to that plane
#' 
#' (zhplane <- gell(center = c(0, 0, 2), span = diag(3)[, 1:2]))  # a hyperplane
#' 
#' dual(zhplane)  # orthogonal line through same center (note that the 'gell'
#' # object with a center contains more information than the geometric plane)
#' 
#' zorigin <- gell(span = cbind(c(0, 0, 0)))
#' dual(zorigin)
#' 
#' # signatures of these ellipsoids
#' signature(zsph)
#' signature(zhplane)
#' signature(dual(zhplane))
#' 
NULL



