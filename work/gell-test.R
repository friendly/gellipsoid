library(gellipsoid)
library(rgl)
# a proper ellipsoid, and its inverse
c1 <- c(0,0,0)
C1 <- matrix(c(6, 2, 1,
               2, 3, 2,
               1, 2, 2), 3,3)

worigin <- c(750,150)
par3d(windowRect=c(worigin, worigin+500))
open3d()

E1 <- ell3d(center=c1, shape=C1, col="green", alpha=0.1)

# inverse of C1
C1I <- solve(C1)
ell3d(center=c1, shape=C1I, col="brown", alpha=0.1, wire=FALSE)

gC1 <- gell(Sigma = C1)
gC1

open3d()
ell3d(gC1, shape=C1, col="green", alpha=0.1)

C1I <- solve(C1)

gC1I <-dual(gC1)


ell3d()
