
# gell3d examples

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
par3d('scale')

# inverse of C1

E1I <- ell3d(dual(zell), col="blue", alpha=0.1, wire=TRUE)

ell3d(gell(Sigma = diag(3)), col = 'gray',alpha = .1, shade=FALSE, wire = TRUE) # Unit sphere

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
basis <- cbind(c(0,1,0,0,0,0),
               c(0,0,0,1,0,0), 
               c(0,0,0,0,0,1))
segments3d(3*basis, lwd=3)
text3d(3.1*basis, texts=c("","x", "", "y", "", "z"), cex=2)

box3d()

########################################
# prepare for animated 3D views
########################################

# make this view reproducible
#  -- manually zoom, stretch, rotate, then capture the current rgl viewpoint
# p3d <- par3d(no.readonly=TRUE); dput(p3d)
p3d <-
  structure(list(FOV = 30, ignoreExtent = FALSE, mouseMode = structure(c("trackball", 
                                                                         "zoom", "fov"), .Names = c("left", "right", "middle")), skipRedraw = FALSE, 
                 userMatrix = structure(c(0.952872812747955, -0.10816602408886, 
                                          0.283431679010391, 0, 0.301456183195114, 0.23282191157341, 
                                          -0.924617886543274, 0, 0.0340231359004974, 0.966485500335693, 
                                          0.254456967115402, 0, 0, 0, 0, 1), .Dim = c(4L, 4L)), scale = c(1, 
                                                                                                          1, 1), zoom = 0.822702646255493, windowRect = c(750L, 150L, 
                                                                                                                                                          1250L, 650L), family = "sans", font = 1L, cex = 1, useFreeType = FALSE), .Names = c("FOV", 
                                                                                                                                                                                                                                              "ignoreExtent", "mouseMode", "skipRedraw", "userMatrix", "scale", 
                                                                                                                                                                                                                                              "zoom", "windowRect", "family", "font", "cex", "useFreeType"))

par3d(p3d)
M1 <- par3d("userMatrix")

cd("c:/sasuser/datavis/manova/ellipses/")
par3d(userMatrix = M1)
snapshot3d("fig/gell3d-1.png")

# rotate around z axis for 1 minutes
play3d(spin3d(axis=c(0,0,1), rpm=5), duration=1*60/5)

# make a movie, spinning around the Y axis
movie3d(spin3d(axis=c(0,0,1), rpm=5), duration=1*60/5, dir="movies", movie="gell-3D1", fps=6)

# make plane of C2 flat
#M2 <- par3d("userMatrix"); dput(M2)
M2 <- structure(c(0.974243760108948, -0.0046168495900929, 0.225449979305267, 
                  0, 0.225395664572716, -0.0100716399028897, -0.974215269088745, 
                  0, 0.00676846411079168, 0.999938666820526, -0.00877166073769331, 
                  0, 0, 0, 0, 1), .Dim = c(4L, 4L))
par3d(userMatrix = M2)
snapshot3d("fig/gell3d-2.png")

# spin about X axis
play3d(spin3d(axis=c(1,0,0), rpm=5), duration=1*60/5)

movie3d(spin3d(axis=c(1,0,0), rpm=5), duration=1*60/5, dir="movies", movie="gell-3D2", fps=6)

# view of (X,Y), looking down along Z
#M3 <- par3d("userMatrix"); dput(M3)
M3 <- structure(c(0.999924957752228, 0.0109519399702549, -0.00546535104513168, 
                  0, -0.0112443780526519, 0.99832820892334, -0.0566961690783501, 
                  0, 0.00483526475727558, 0.0567533634603024, 0.998376607894897, 
                  0, 0, 0, 0, 1), .Dim = c(4L, 4L))

par3d(userMatrix = M3)
snapshot3d("fig/gell3d-3.png")

# spin about Y axis
play3d(spin3d(axis=c(0,1,0), rpm=5), duration=1*60/5)
movie3d(spin3d(axis=c(0,1,0), rpm=5), duration=1*60/5, dir="movies", movie="gell-3D3", fps=6)

# view of orthogonalities of pairs C1, C1I and C2, C2I
#M4 <- par3d("userMatrix"); dput(M4)
M4 <- structure(c(-0.0773997753858566, -0.040597639977932, 0.996173143386841, 
                  0, 0.996999740600586, -0.00394562119618058, 0.0773032084107399, 
                  0, 0.000792244158219546, 0.999167799949646, 0.0407812111079693, 
                  0, 0, 0, 0, 1), .Dim = c(4L, 4L))

par3d(userMatrix = M4)
snapshot3d("fig/gell3d-4.png")
