# Notations

↪: injection ∼: equivalence


# Differential Manifolds

Def: *M* is a dimension *n* *Topological manifold* if *M* is a Hausdorff
space, second-countable, locally euclidean of dimension *n*.

Def: Hausdorff, for any *p*, *q*, we can find neighborhoods that do not
intercept.

Def: second countable, countable basis for the topological space

Def: locally euclidean of dimension *n*, for each point *p* ∈ *M*, there
exists a homeomorphism *φ* : *U* → *Û*, where *U* is the nbhd of *p*,
*Û* is an open set in ℝ<sup>*n*</sup>. coordinate chart, (*u*,*φ*)

Note: every topological manifold has only one dimension. There is no
notion of smoothness for the topological manifold.

Differentiable Geometry: try to describe the smoothness over the
manifold without referring to the ambient Euclidean space, so we define
a smooth structure such that: any two coordinate charts (*u*,*φ*) and
(*v*,*ψ*), we require *φ*<sup>−1</sup> ∘ *ψ* is a smooth homeomorphic,
i.e. diffeomorphism (bijection, smooth, smooth inverse)

Smoothness: by default *C*<sup>∞</sup>, *C*<sup>1</sup> can be extended
to *C*<sup>∞</sup> somehow.

Def: atlas of *M* to be a collection of charts whose domains cover *M*.
Each chart maps to the same dimension of Euclidean space.

Def: an atlas is called smooth if any two charts in A are smoothly
compatible

Def: A smooth structure on M is a maximal smooth atlas: differentiable
structure

Note: there can be many smooth structures on a manifold. Two smooth
atlases define the same smooth structure iff their union is a smooth
atlas.

Eg: *ψ* : ℝ → ℝ by *x* → *x*, *φ* : *x* → *x*<sup>3</sup>. is a smooth
map whose inverses are smooth in the sense of their smooth structures.

Note: the same topological space can have distinct ("nondiffeomorphic")
smooth structures. Lowest dimension this happens is 4. Easiest dimension
to see it is 7.

Note: big open problem: are there exotic smooth structure on
𝕊<sup>4</sup>?

Eg: 1. finite collection of points. 2. ℝ<sup>*n*</sup>. 3. ℝ,
*φ* : *x* → *x*<sup>3</sup>. 3. Finite dimensional vector space over ℝ
or ℂ<sup>1</sup>. 4. spheres. 5. ℝℙ<sup>*n*</sup> = all lines in
ℝ<sup>*n* + 1</sup> , ℂℙ<sup>*n*</sup> = all "lines" in
ℂ<sup>*n* + 1</sup>. 6. Grassmannian. 7. SO(n): rotation in
n-dimensional euclidean space.

## Projective Spaces

The projective space ℝℙ<sup>*n*</sup> is a quotient space of
ℝ<sup>*n* + 1</sup> ∖ {0} by the equivalence:
(*x*<sup>1</sup>,…,*x*<sup>*n* + 1</sup>) ∼ (*λ**x*<sup>1</sup>,…,*λ**x*<sup>*n* + 1</sup>), *λ* ∈ ℝ ∖ {0}.

Consider
*Ũ*<sub>*i*</sub> = {(*x*<sup>1</sup>,…,*x*<sup>*n* + 1</sup>), *x*<sup>*i*</sup> ≠ 0} ⊂ ℝ<sup>*n* + 1</sup> ∖ {0},
and a quotient map
*π*<sub>*Ũ*<sub>*i*</sub></sub> : *Ũ*<sub>*i*</sub> → *U*<sub>*i*</sub>,
*π*\|<sub>*Ũ*<sub>*i*</sub></sub>(*x*<sup>1</sup>,…,*x*<sup>*n* + 1</sup>) = (*x*<sup>1</sup>/*x*<sup>*i*</sup>,…,*x*<sup>*i* − 1</sup>/*x*<sup>*i*</sup>,1,*x*<sup>*i* + 1</sup>/*x*<sup>*i*</sup>,…,*x*<sup>*n* + 1</sup>/*x*<sup>*i*</sup>),
and we let *φ*<sub>*i*</sub> : *U*<sub>*i*</sub> → ℝ<sup>*n*</sup> be
*φ*<sub>*i*</sub>(*x*<sup>1</sup>,…,*x*<sup>*n* + 1</sup>) ≡ *φ*<sub>*i*</sub>(*x*<sup>1</sup>/*x*<sup>*i*</sup>,…,1,…,*x*<sup>*n* + 1</sup>/*x*<sup>*i*</sup>) = (*x*<sup>1</sup>/*x*<sup>*i*</sup>,…,*x*<sup>*i* − 1</sup>/*x*<sup>*i*</sup>,*x*<sup>*i* + 1</sup>/*x*<sup>*i*</sup>,…,*x*<sup>*n* + 1</sup>/*x*<sup>*i*</sup>),
$$\\varphi_i^{-1}(\\hat u^1, \\ldots, \\hat u^n) = (\\hat u^i, \\ldots, \\hat u^{i-1},1, \\hat u^{\\textcolor{red}{i}}, \\ldots, \\hat u^{n}).$$

Similar construction can be done for ℂℙ<sup>*n*</sup> by writing
elements in ℂ<sup>*n* + 1</sup> as
(*x*<sup>1</sup>,*y*<sup>1</sup>,…,*x*<sup>*n* + 1</sup>,*y*<sup>*n* + 1</sup>).
Define *Ũ*<sup>*i*</sup> ⊂ ℂ<sup>*n* + 1</sup> such that
*Z*<sup>*i*</sup> = *x*<sup>*i*</sup> + *i**y*<sup>*i*</sup> ≠ 0. Let
*φ*<sub>*i*</sub> : ℂℙ<sup>*n*</sup> → ℝ<sup>2*n*</sup> be
*φ*<sub>*i*</sub>(*Z*<sup>1</sup>,…,*Z*<sup>*n* + 1</sup>) = (*Z*<sup>1</sup>/*Z*<sup>*i*</sup>,…,*Z*<sup>*n* + 1</sup>/*Z*<sup>*i*</sup>)
$$= 
(\\frac{x^1x^i+y^1y^i}{\\\|Z_i\\\|\_2}, \\frac{x^iy^1 - x^1y^i}{\\\|Z_i\\\|\_2}, \\ldots, 1,0,\\ldots, \\frac{x^{n+1}x^i+y^{n+1}y^i}{\\\|Z_i\\\|\_2}, \\frac{x^iy^{n+1} - x^{n+1}y^i}{\\\|Z_i\\\|\_2}),$$
and the inverse *φ*<sub>*i*</sub><sup>−1</sup> is constructed by
removing the two entries corresponding to *Z*<sub>*i*</sub>.

To prove projective space is a smooth manifold, one must prove it is a
topological manifold with a smooth structure. To prove it has a smooth
structure, we only need to check if the transition map
*φ*<sub>*j*</sub> ∘ *φ*<sub>*i*</sub><sup>−1</sup> : *φ*<sub>*i*</sub>(*U*<sub>*i*</sub>∩*U*<sub>*j*</sub>) → *φ*<sub>*j*</sub>(*U*<sub>*i*</sub>∩*U*<sub>*j*</sub>)
is diffeomorphic.
$$\\varphi_j\\circ \\varphi_i^{-1}(\\hat u^1, \\ldots, \\hat u^n) = \\varphi_j(\\hat u^1, \\ldots,\\hat u^{i-1}, 1,\\hat u^{\\textcolor{red}{i}}, \\ldots, \\hat u^n)$$
$$= (\\hat u^1/\\hat u_j, \\ldots, \\hat u^{i-1}/\\hat u_j, 1/\\hat u_j, \\hat u^{\\textcolor{red}{i}}/\\hat u_j, \\ldots, \\hat u^{j-1}/\\hat u_j, \\hat u^{j+1}/\\hat u_j, \\hat u^n/\\hat u_j).$$
