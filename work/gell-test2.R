library(gellipsoid)
library(rgl)


# a proper ellipsoid, and its inverse
c1 <- c(0,0,0)
C1 <- matrix(c(6, 2, 1,
               2, 3, 2,
               1, 2, 2), 3,3)


worigin <- c(750,150)
open3d(windowRect=c(worigin, worigin+500))

zell1 <- gell(center=c1, Sigma=C1)
E1 <- ell3d(zell1, col="blue", alpha=0.1)
(bb1 <- bbox(E1))
text3d(.95*bb1, texts="C1", color="blue", adj=0)
#par3d('scale')

# inverse of C1

E1I <- ell3d(dual(zell), col="blue", alpha=0.1, wire=TRUE)
ell3d(gell(diag(3)), col = 'gray',alpha = .1, shade=FALSE, wire = TRUE) # Unit sphere

# a singular ellipsoid
c2 <- c1
C2 <- matrix(c(6, 2, 0,
               2, 3, 0,
               0, 0, 0), 3,3)

E2 <- ell3d( zell2 <-gell( center = c2, Sigma = C2), col = 'red', alpha = 0.25, wire = TRUE)
(bb2 <- bbox(E2))
text3d(.95*bb2, texts="C2", color="red4", adj=0)

E2I <- ell3d( dual(gell( center = c2, Sigma = C2)), length=3, col = 'red', alpha = 0.25, wire = TRUE )
par3d('scale')

# signatures
signat(zell1)
signat(zell2)


# x,y,z basis vectors from the origin
basis <- cbind(c(0,1,0,0,0,0),c(0,0,0,1,0,0), c(0,0,0,0,0,1))
segments3d(3*basis, lwd=3)
text3d(3.1*basis, texts=c("","x", "", "y", "", "z"), cex=2)

box3d()

