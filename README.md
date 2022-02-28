
<!-- README.md is generated from README.Rmd. Please edit that file -->

# gellipsoid

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

The gellipsoid package extends the class of ellipsoids to “generalized
ellipsoids”, which are degenerate ellipsoids that are flat and/or
unbounded. Thus, ellipsoids can be naturally defined to include lines,
hyperplanes, points, cylinders, etc. The methods can be used to
represent generalized ellipsoids in a *d*-dimensional space
ℛ<sup>*d*</sup>, with plots in up to 3D.

<!-- The motivation for this more general representation is to allow a notation for a class of generalized ellipsoids -->
<!-- that is algebraically closed under -->

The goal is to be able to think about, visualize, and compute a linear
transformation of an ellipsoid with central matrix **C** or its inverse
**C**<sup>−1</sup> which apply equally to unbounded and/or degenerate
ellipsoids.

The implementation uses a (**U**,**D**) representation, based on the
singular value decomposition (SVD) of an ellipsoid-generating matrix,
**A** = **U****D****V**<sup>*T*</sup>, where **U** is square orthogonal
and **D** is diagonal. For the usual, “proper” ellipsoids, **A** is
positive-definite so all elements of **D** are positive. In generalized
ellipsoids, **D** is extended to non-negative real numbers, i.e.  its
elements can be 0, Inf or a positive real.

#### Definitions

A *proper* ellipsoid in ℛ<sup>*d*</sup> can be defined by
ℰ := {𝓍 : 𝓍<sup>𝒯</sup>**C**𝓍 ≤ 1} where **C** is a non-negative
definite central matrix, In applications, **C** is typically a
variance-covariance matrix A proper ellipsoid is *bounded*, with a
non-empty interior. We call these **fat** ellipsoids.

A degenerate *flat* ellipsoid corresponds to one where the central
matrix **C** is singular or when there are one or more zero singular
values in **D**. In 3D, a generalized ellipsoid that is flat in one
dimension (**D** = diag{*X*, *X*, 0}) collapses to an ellipse; one that
is flat in two dimensions (**D** = diag{*X*, 0, 0}) collapses to a line,
and one that is flat in three dimensions collapses to a point.

An *unbounded* ellipsoid is one that has infinite extent in one or more
directions, and is characterized by infinite singular values in **D**.
For example, in 3D, an unbounded ellipsoid with one infinite singular
value is an infinite cylinder of elliptical cross-section.

## Principal functions

-   `gell()` Constructs a generalized ellipsoid using the (**U**,**D**)
    representation. The inputs can be specified in a variety of ways:

    -   a non-negative definite variance matrix;
    -   an inner-product matrix
    -   a subspace with a given span
    -   a matrix giving a linear transformation of the unit sphere

-   `dual()` calculates the dual or inverse of a generalized ellipsoid

-   `gmult()` calculates a linear transformation of a generalized
    ellipsoid

-   `signature()` calculates the signature of a generalized ellipsoid, a
    vector of length 3 giving the number of positive, zero and infinite
    singular values in the (U, D) representation.

-   `ell3d()` Plots generalized ellipsoids in 3D using the `rgl` package

## Installation

You can install the development version of gellipsoid from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("friendly/gellipsoid")
```

## Example

``` r
library(gellipsoid)
#> Warning: package 'rgl' was built under R version 4.0.5
```

<!-- You'll still need to render `README.Rmd` regularly, to keep `README.md` up-to-date. `devtools::build_readme()` is handy for this. You could also use GitHub Actions to re-render `README.Rmd` every time you push. An example workflow can be found here: <https://github.com/r-lib/actions/tree/v1/examples>. -->

The following figure shows views of two generalized ellipsoids.
*C*<sub>1</sub> (blue) determines a proper, fat ellipsoid; it’s inverse
*C*<sub>1</sub><sup>−1</sup> also generates a proper ellipsoid.
*C*<sub>2</sub> (red) determines an improper, fat ellipsoid, whose
inverse *C*<sub>2</sub><sup>−1</sup> is an unbounded cylinder of
elliptical cross-section. *C*<sub>2</sub> is the projection of
*C*<sub>1</sub> onto the plane where *z* = 0. The scale of these
ellipsoids is defined by the gray unit sphere.

``` r
knitr::include_graphics("man/figures/gell3d-1.png")
```

<img src="man/figures/gell3d-1.png" width="60%" />

This figure illustrates the orthogonality of each *C* and its dual,
$C^{-1}.

``` r
knitr::include_graphics("man/figures/gell3d-4.png")
```

<img src="man/figures/gell3d-4.png" width="60%" />

## References

Friendly, M., Monette, G. and Fox, J. (2013). Elliptical Insights:
Understanding Statistical Methods through Elliptical Geometry.
*Statistical Science*, **28**(1), 1-39.

Friendly, M. (2013). Supplementary materials for “Elliptical Insights
…”, <https://www.datavis.ca/papers/ellipses/>
