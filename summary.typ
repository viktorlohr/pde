#import "template.typ": *
#import "@preview/cetz:0.3.4"

#let Laplace = $Delta$
#let Gradient = $nabla$
#let int = $integral_(RR^n)$
#let intinside = $integral_Omega$
#let intbound = $integral_(partial Omega)$
#let int0 = $integral_(B_epsilon)$
#let int1 = $integral_(RR^n \\ B_epsilon)$
#let int2 = $integral_(partial B_epsilon)$
#let iff = $<=>$


#show: conf.with(title: "Second-Order \nElliptic PDEs", subtitle: "A Conceptual Overview")

= What is an _elliptic_ PDE?

= Basic Tools for solving PDEs
== Integration By Parts
#callout[*Integration By Parts* plays a fundamental role in modern PDE theory. It allows us to *find* otherwise *"hidden" (weaker) solutions*. It allows us to "*move the Laplacian over*" to another function, *enabling countless proofs*. Therefore, we revise the reason why it works in the first place -- the Divergence Theorem --right at the beginning of this summary.]
=== Divergence Theorem
The Divergence Therom states, that for a differentiable vector field $F = (F_1, ..., F_n)$ and bounded $Omega subset RR^n$ we have
$ intinside Gradient dot F = intbound F dot nu, $

where $nu$ is the outer normal field of Omega and $ Gradient dot F = (partial_1 F_1, ..., partial_n F_n) $ is the Divergence of F.

=== Green's Identities
Setting $F = u Laplace v$ and using the product rule, one unpacks the definitions to *Green's First Identity*:
$
  intinside u Laplace v
  = intbound u Gradient v dot nu
  - intinside Gradient u dot Gradient v
$

In one dimension, this is *Integration By Parts*:
$
  integral_[a,b] u v''
  = underbrace(
    integral_(partial[a,b]) u v' dot nu, = (u v')(a) dot (-1)\
    + (u v') (b) dot (+1)
  )
  - integral_[a,b] u'v'.
$

The border $partial[a,b]$ is discrete. It consits of the points $a$ and $b$. So the Integral is actually a sum.

In this case, the outward normal field points to the right at the border point $b$ and to the left at the border point $a$, giving us the expected
"upper bound minus lower bound" term.


*Green's Second Identity* just subtracts two Green's First Identity Equation. One for $u Laplace v$ and one for the other way around where $v Laplace u$. Since the scalar product is symmetric, the rightmost integrals cancel out and we are left with

$
  intinside u Laplace v - v Laplace u
  = intbound u partial_nu v - v partial_nu u.
$



Note that $Gradient u dot nu$ is actually the *directional derivative*
$
  partial_nu u
$
of $u$ in the direction of $nu$.

#callout2[
  As stated at the beginning, this allows -- minding the boundary terms -- to "*move the Laplacian over*."
]

== Distributions -- Part I
=== The Fundamental Lemma of the Calculus of Variations
#callout[
  Let's say $f$ and $g$ are some integrable functions.
  #align(center)[*How can we tell if they are equal?*]

  This is a fundamental problem in this course. Think of $g = Laplace u$. How can we tell if $Laplace u = f$ for some $u$?

  _Distribution Theory_ tells us that *if*
  *$ integral f phi = integral g phi $*
  *for all* test functions *$phi$*, *then*
  *$ f = g. $*

  This is called #align(center)[*The Fundamental Lemma Of The Calculus Of Variations*]

  What exactly a "Variation" and how its proven will be *postponed* to the later chapters.
]

A _test function_ is a "very nice" function. It is smooth and compactly supported, formally $phi in C^infty_c.$

A _Distribution_ is a bounded linear functional acting on a test function. (i.e. an element of the dual space of $C_c^infty$)
For example, for a locally integrable function $f$, the mapping
$ T_f colon quad phi |-> integral f phi $
is the _Associated Distribution_ to $f$. However, _not_ every Distribution needs to stem from a locally integrable function!

#callout[
  We will *often* argue in the following way. Let's say we want to show that $f =g$. Then we *make* a *detour* *through* the world of *Distributions:* That means, often we can find a distribution $S$, such that
  $ T_f = S = T_g. $
  Now we are done, because this implies $f=g$ by the Fundamental Lemma stated above.
]

=== Operator applied to Distribution
#callout[
  Let's say $u$ is differentiable twice. Then Green's Second Identity and the fact that test functions vanish far out imply
  $ T_(Laplace u) phi = int (Laplace u) phi = int u (Laplace phi) = T_u Laplace phi. $

  This *motivates* the *definition*
  *$ (Laplace T) phi := T (Laplace phi). $*

  More generally,
  $ (L T)phi := T (L^* phi), $
  where $L$ is a Linear Operator, $L^*$ is its _adjoint_ and $T$ is a Distribution. Keep in mind that the Laplacian is self-adjoint.
]






= _Explicit_ Solutions to $-Laplace u = f$  -- but only on _nice_ domains!

The *Poisson Equation* is
$
  - Laplace u = f.
$

The *Laplace Equation* is the homogeneous Poisson Equation, i.e
$
  Laplace u = 0.
$

== Solving the Laplace Equation for radially symmetric functions

#callout1[
  *Motivation:* The Laplace/Poisson Equation is the
  simplest form of a second order elliptic PDE. Thus it is natural to try to
  solve it -- if possible explicitly -- first.
  Before we do that, we need just a bit of technical theory.
]

We are looking for solutions to the *Laplace Equation
$ Delta u = 0. $* If $u$ is *radial-symmetric*, i.e. there is a function $v$ such that

*$ u(x) = Phi(r) $*

for some function $Phi$ and $r := ||x||$, then we can *turn* the *Laplace Equation* *into* an *ordinary* differential *equation* depending only on the radius.
Using the chain rule, one computes that for all $r != 0,$ we have

$ Delta Phi(r) = Phi''(r) + (n-1) (Phi'(r))/r =^! 0. $

This is equivalent to

$ (Phi''(r)) / (Phi'(r)) = (1-n) /r . $

Integrating both sides yields

$ ln|Phi'(r)| = (1-n)ln r + c. $

Applying the exponential function gives

$ Phi'(r) = A r^(1-n). $

Integrating again yields

$ Phi(r) = cases(A ln r + B &"if" n = 2, A/(2-n) r^(2-n) + B quad &"if" n >= 3), $

where $A,B$ are constants depending on $n.$

#callout[
  What we just derived is the basis for the *Fundamental Solution,* which we are going to find now.
]

== Solving $- Laplace u = f$ for a point source -- The Fundamental Solution

The Laplace Equation
$ Delta Phi = 0 $
literally means that $Phi$ is in a *harmonic*, "peaceful" state.

#callout[
  The question now is: *what happens to $Phi$* if a *single, concentrated source disturbs* this
  peace? Formally, we *want to solve*
  $ -Delta Phi = delta, $
  where $delta$ is a "point source".
]

The "point source" itself will be the *Dirac Distribution* $delta$: it
*evaluates* a test function *at $0$*:
$ delta(psi) := psi(0). $
#callout[
  The *idea* behind this is the following: Our "point source" is the *limit* of test functions $psi_k$ that get *taller and narrower* towards the origin, *but* their *integral remains constant*. Let's see how how these act on a test function $phi$. For large $k$, the support of $psi_k$ shrinks by construction. Hence, there are $epsilon_k -> 0$ such that
  #let intk = $integral_(||x|| < epsilon_k )$
  $
    T_(phi_k) & = integral psi_k phi \
              & = intk psi_k (x)
                underbrace(phi (x), approx phi(0)) d x \
              & approx phi (0) integral psi_k \
              & approx phi (0) dot 1
  $

  To actually show equality, one considers the difference between the two sides and shows its bounded by a multiple of $epsilon_k$. The *bottom line* is:

  *$ T_(phi_k) --> delta(phi). $*

  So *intuitively*, one can *associate* the *Dirac Distribution* with a function that is *very narrow and high*.
]







Per Definition, $-Delta Phi = delta$ holds in the sense of Distributions if
$ -integral_(RR^n) Phi Delta psi dif x = delta(psi) $
for every test function $psi$.


#callout[Since $delta$ is radially symmetric, we expect the response $Phi$ to be too. We therefore *assume $Phi$ is radially symmetric* and *try to find constants* that fit our result above.]

Since there is a *singularity at the origin*, we cannot integrate

$ integral_(RR^n) Phi Delta psi $

directly. Therefore, we *punch a hole* of radius $epsilon$ around the origin and take the limit $epsilon -> 0$. We then *apply Green's Second* Identity. Because *test functions vanish far out* and *$Phi$ is harmonic _away_ from* the *origin*, this yields





$
  int1 Phi Delta psi
  = int2 (Phi (partial psi)/(partial nu) - psi (partial Phi)/(partial nu)).
$

We first look at $ Phi (partial psi)/(partial nu). $

As $epsilon$ approaches zero, $Phi$ *blows up as fast as* $r^(2-n)$. But the *surface area shrinks as fast as* $r^(n-1)$, which *beats the singularity* -- so the hole term *goes to zero*.



Now the second term. Since the *normal unit vector points inward*, we have $nu = -r$ and thus

$ psi (partial Phi) / (partial nu) = psi (partial Phi) / (partial (-r)). $

#callout[As the radius approaches zero, *$Phi'$ blows up as fast as $r^(1-n)$* -- *exactly* the rate the *surface area shrinks* in. The section below formalizes this observation.]



As $epsilon -> 0$, the *test function $psi$ approaches* $psi(0)$, and since it's *continuous* we can *pull $psi(0)$ out of the integral*.

Likewise, *$Phi'(r)$ depends only on the radius* -- it's *independent of $x$* -- so we can *pull it out as well*. We are left with

$
  int1 Phi Delta psi & = psi(0)dot Phi'(epsilon) int2 1 d S \
                     & = psi(0) dot A epsilon^(1-n) dot |S_(n-1)| epsilon^(n-1) \
                     & = psi(0) dot A dot |S_(n-1)|
$
where $|S_(n-1)|$ is the surface area of the sphere. #callout[Remember, we *want to show* that
  *$ - integral_(RR^n) Phi Delta psi = psi(0). $*]
Therefore *$A$ must equal* $ -1/(|S_(n-1)|). $


#callout[
  Looking back at the previous subsection, this gives us the *Fundamental Solution*
  $ Phi(r) := cases(-1/(|S_1|)ln r &"if" n = 2, 1/(|S_(n-1)|(n-2)) r^(2-n) quad &"if" n>=3) $

  to the Laplace Equation.

]


#callout[
  Technincally, we only found a _radial_ fundamental solution, but it turns out that its actually the _only_ one.
]


== Deriving a Solution for \ arbitrary $f$ on $RR^n$


Remember that our "point source" $delta$ -- the Dirac Distribution acted on a test function $phi$ by evaluating it at the origin: $ delta(phi) = f(0). $

Let $x$ now be an arbitrary point and *consider* the function *$ phi_x := y |-> phi(x-y). $*
Then the Dirac Distribution would give us

$ delta(phi_x) = phi(x). $

#callout[
  *Where is this going?* The goal of this subsection is to *solve $ - Laplace u = f $* for smooth $f$ *on $RR^n.$*
  In the distributional sense, this equation means
  $ - integral u Laplace phi = integral f phi $
  for every test function $phi.$ The idea is to apply our result above and *represent $phi$ via* the *Delta Distribution.* This naturally leads to the *Fundamental Solution* which can be used to solve the equation -- but only on $RR^n$ of course.
]

#callout2[
  Note that we are using the "*Detour Through Distributions* Strategy" described before.
]

Let's reverse engineer this further. As pointed out, we need
$u$ to act on $phi$ the same way as $f$. So let's look at what happens when we *plug in $phi(x) = delta (phi_x)$* in the action of $f$ on $phi:$
$
                                & int f(x) phi(x) d x \
                              = & int f(x) delta(phi_x) d x \
                              = & - int f(x) int Phi(y) Laplace phi(x-y) d y d x \
                              = & - int int Phi (y) f(x) phi(x-y) d y d x \
  =^"Convolution\nis symmetric" & - int int Phi (y) f(x-y) d y space Laplace phi(x) d x \
                              = & - int (Phi * f) (x) Laplace phi (x) d x. \
$

#callout[
  Now we're *done.* *Why?*
  The Equation above matches the distributional definition perfectly. It implies
  $ - Laplace (Phi * f) = f(x). $
  Therefore, *$ Phi * f $ solves the Poisson Equation* on $RR^n.$
]


== An Alternative Method: \ The Fourier Transform

#callout1[
  The Fourier Transform yields an alternative way to derive the constants for
  the fundamental solutions.
]


== Correcting the $RR^n$ solution to fit boundary conditions (Green's Functions)

=== Green's Representation Formula

#callout2[
  We will see that these solutions are unique in just a bit using the _Maximum
  Principle_ for harmonic functions.
]


#callout1[
  *Motivation for the other chapters:* Even though we just got an explicit
  formula to solve one of the most important PDEs, it only works on "nice"
  domains where something like the mirror-trick works. It's *hard to find
  solutions in general*.

  *Therefore*, the following sections mainly focus on *uniqueness and existence* in
  more arbitrary settings *without* constructing *explicit* *solutions*.
]

= Harmonic Functions -- Inspecting $Laplace u = 0$ further

#callout1[
  This section is about laying the *foundation for Perron's Method*, which allows us to find more general, but non-constructive solutions to
  Laplace's Equation by investigating properties of *harmonic functions*. These are *exactly* the functions that satisfy *$Laplace u = 0$*
]

== Mean Value Property

#callout[
  A function *$u$ satisfies* the Mean Value Property (*MVP*) *if* *locally*, it *equals* the *avarage* of its integral *over* a *ball* *as well as* the avarage of its integral over the *surface* of a ball.
]

Let *$u in C^2(Omega)$*, where $Omega subset R^n$ is *open*. Then for $x in Omega$ and any Ball $B subset.eq Omega$, it holds that
$
  u(x) = 1/(|B|) integral_B u(y) d y.
$

and also

$
  u(x) = 1/(|partial B|) integral_(partial B) u(y) d y.
$


#callout[We *define* a function to be *harmonic* *if and only if* it satisfies the *Laplace Equation*.]

#callout[*Characterization:* A function $u$ is *harmonic* *if and only if* it satisfies the *MVP*.

  *Harmonic $=>$ MVP:* Start with the avarage integral of $u$ over a sphere around $x$. *Differentiate* with respect to the vector pointing outward. Then *apply* the *Divergence Theorem*. The *integrand* will be *$Laplace u$*, which is zero by assumption. *Hence*, the derviative of the avarage is zero, so the *avarage* is *constant*. *Sending $r -> 0$* *yields* that the consant is exactly *$u(x).$*

  *MVP $=>$ Harmonic*: Argues almost the same. The sphere avarage integral will be constant by assumption. From there, everythings the same. The conclusion sends $r->0$ and this implies that the integrand -- which is $Laplace u$ -- must be zero.

  *For balls*, one argues by *integrating over all spheres* *inside* the ball.
]

=== Harmonic Functions are Smooth
#callout[
  *Harmonic* functions are actually *smooth*. One can prove this by *convolving* with a *mollifier* function (see later chapters) and show via the MVP that the (smooth) convolution is *actually* *equal* to the harmonic function itself.
]
== Maximum Principles
=== The Weak Maximum Principle

Let $Omega subset RR^n$ *bounded* and $u in C^2 (Omega) inter C^0 (overline(Omega))$ *harmonic*. Then
$
  max_Omega u <= max_(partial Omega) u.
$

#callout[
  We will sketch the prove for strong maximum principle in a minute, which will imply this one.
]
=== The Strong Maximum Principle

Let $Omega subset R^n$ be *connected* and *$u in C^2 (Omega)$* *harmonic*. If $u$ achieves its *maximum* value on an *interior* point, *then* it must already be *consant*.

#callout[
  To *prove* this, let $x$ be an interior point where $u$ attains its maximum $M$ and let $B$ be a ball around $x$. The *MVP* now *squeezes* the avarage between $M$
  $
    0 <= integral.slash_B underbrace(M-u, >= 0) & = integral.slash_B M - integral.slash_B u \
                                                & = M - u(x) = 0.
  $
  Since $M - u$ is non-negative, we have  *$u equiv M$ on $B.$* By *connectedness*, this *extends* to the whole domain.
]

This now *implies* the *weak* maximum principle. One can easily argue *by contradiction*. Let's say an interior point is strictly larger than a boundary point. By the strong maximum principle, $u$ must be identical to that larger value _everywhere_, including the point that is strictly smaller. Contradiction.

=== Uniqueness of Solutions

#callout[
  Let $u$ and $v$ be Solutions to the Laplace Equation, both having the same boundary values. *Apply* the *Maximum Principle* *to *both* $u-v$ and $v-u$*.
  It will tell us that each of the differences is smaller or equal to zero (which is the value of the differences at the boundary)
  Therefore
  $
    u equiv v.
  $
]

=== Liouville's Theorem

The *MVP* yields a proof for Liouville's Therom: A harmonic function defined on all of $R^n$ that is bounded is already constant.

#callout[
  Take any two points $x$ and $y$ and show that $u(x) - u(y) = 0$. The MVP translates this into integrals over balls. The idea is now to *subtract these integrals*. The subtraction* will yield a factor $1/r$*. Then send $r -> infty.$
]



== Harnack Inequality
#callout[
  Harnack's Inequality says that a non-negative *harmonic function* *can't vary too wildly* on a compact subset of the domain. It is used to prove a theorem that *upgrades*
  pointwise *convergence* of harmonic functions to uniform convergence. We will need this to show existence of solutions using Perron's Method later.
]
Formally: Let $u$ be *harmonic* and *_non-negative_*. For every *compact* and *connected $Omega'$* $subset.eq Omega$, where *$Omega$* is an *open*  domain, there exists a constant $c = c(Omega', Omega)$, such that
$
  sup_(Omega') u <= c dot inf_(Omega') u.
$

#callout[
  Note that $c$ not only depends on $Omega'$, but also on $Omega$. In general, *$c$ will blow up as $Omega'$ approaches $partial Omega.$*
]

#callout[
  *Proof idea:* Locally, we can take any two points and balls around them such that *the smaller ball* is *contained* in the other. Since *$0<= u$*, the *integral over* the *larger ball* will be larger than the integral over the smaller ball. The *MVP does the rest*.
  Then *extend using compactness* and *connectedness*. (Cover $Omega'$ with balls)
]

We consider the situation locally first and then expand. Let $x in Omega$, $Omega' = B_r (x)$ where $r$ is small enough such that still $B_(4r)(x) subset.eq Omega.$

Now let $y$ and $tilde(y)$ be arbitrary values in $Omega'.$ The triangle inequality gives us $B_r (y) subset B_(3r)(tilde(y)).$
Hence the MVP yields
$
  u(y) & = 1/(r^n omega_n) integral_(B_r (y)) u(xi) d xi \
       & <=^(0<=u) 1/(r^n omega_n) integral_(B_(3r) (tilde(y))) u(xi) d xi = bold(3^n) u(tilde(y)).
$

#callout[
  This can now be *extended* using compactness and connectedness. We cover $Omega'$ with balls and apply the above *inequality transitively* for *every point* -- *including* the ones where $u$ is *extreme*, hence the theorem.

  *Note* that there is *always an $4r < "dist"(Omega', partial Omega)$*, since $Omega$ is open and $Omega'$ is compactly contained.
  Also, the smaller $r$ becomes, the more balls one needs to cover the domain. *For every ball*, we *have to add another *factor* $3^n$* to the constant. This is the reason, that *$c$ blows up* as $Omega'$ approaches $partial Omega.$
]

=== Harnack's Convergence Theorem
Let $u_1 <= u_2 <= ...$ be a *monotonically increasing* sequence of *harmonic* functions on $Omega subset.eq RR^n.$ Furthermore, let  $y in Omega$ be a *point*  such that the sequence of real numbers $ u_1 (y) <= u_2 (y) <= ... <= M $ is bounded. *Then* $(u_n)$ *converges* already *_locally_ uniformly!* and the *limit is harmonic.*

#callout[
  Whats remarkable is that -- a priori -- there needs to be only a *_single_* *point* where the sequence is bounded.
]

#callout[
  *Proof Idea:* Monotone Convergence implies that the sequence of numbers is Cauchy. Harnack tells us that the neighborhood around $y$ is controlled by one point. More concretely, one *applies* *Harnack* is *to $ u_k - u_l >= 0, $* which is harmonic since the Laplacian is linear. Note that Harnack's constant depends on $Omega'.$ Therefore, it is important to *remember* that the *uniform convergence* is *only local!*

  The uniform convergence proven in the first step will allow us to *swap* the *limit* *and* the *MVP integral*, *proving harmonicity* of the limit.
]

= Perron's Method -- Existence _without_ explicit formulas

#callout2[
  Perron's method answers the question raised earlier about *existence on bounded domains*
  *_without_* an *explicit* Green's function.
]

#callout[
  Remember, we *want* to find a *harmonic* *function* for a Dirichlet Problem. *Why?*  *Because* harmonic functions *solve* the *Laplace* Equation!

  Perron's Method achieves this by taking the *supremum* *over* *functions that stay below harmonic functions* if they alredy do so on the boundary. These are called _subharmonic_ functions.
]

A function $u in C^0(Omega)$ is *_subharmonic_* if for every ball $B subset.double Omega$ and *every harmonic $h$* $in C^0 (overline(B))$ holds
$
  u <= h "on" partial B => u <= h "in" B
$

#callout[
  Note that the definition is *stated locally* for balls.   *Otherwise* we would need to assume there already is a harmonic function defined on the whole domain in the first place, i.e. we *would have* found a *solution* to the Laplace Equation *already*.
]

#callout2[
  Remember that we already know that *harmonic functions exist on* every *ball*. (Green's Function via mirror image!)
]

We define the set of *_subsolutions_*
$
  S_g := {v in C(overline(Omega)) | v "subharmonic", v_(|partial Omega) <= g_(|partial Omega) }.
$

This set is *not empty*, because the constant function that is identical to the minimum of $g$ is a subsolution.

We now try to show that the set is *bounded from above.*

#callout[
  Note that the maximum principle gives us the implication
  *$ "Harmonic" => "Subharmonic". $*
  Therefore it makes sense to suspect that the *supremum of subsolutions* is indeed *harmonic*. It is as "high" as it can get with the constrained boundary holding it in place.

  Furthermore, this tells us that _if_ a *solution* exists, it *must itself be* a *subsolution*. Since the supremum is harmonic and the Laplacian is linear, their *difference is* also *harmonic*. It vanishes on the boundary since the boundary conditions get subtracted as well. So it * attains* its *maximum* / *minimum* -- *zero* -- at the boundary. The *Maximum / Minimum Principle* *implies* that it vanishes everywhere. So they are *equal.*

  Keep in mind that we use here that the supremum is harmonic -- that is the hard theorem, proven below.
]



=== Supremum of Subsolutions is harmonic
// TODO


== Barriers

== Regular Points

== Lebesgue-Spine



= The Maximum Principle for General Second-Order Elliptic Operators
#callout[
  Now we move from the Laplace-Operator to more general Second-Order Elliptic
  Operators.

  We will see that under the right assumptions, the *Maximum Principle still
  holds* in the general setting. *But* we can *no* longer rely on the *MVP*. We *need _Hopf's Lemma_* to replace it in the argument.
]
== The General Operator

#callout[
  *Throughout this chapter, $Omega subset RR^n$* is assumed to be *bounded* and all functions *$u$* are in *$C^2 (Omega).$*
]

A general Second-Order linear Differential Operator -- written in Einstein's Sum Notation -- looks like this:
*$ L u = a^(i j) partial_(i j)u + b^i partial_i u + c u. $*

Let $A:= (a^(i j)).$ We impose *three conditions* on the coefficients to make it elliptic:

- *Symmetry* of A
#callout[
  Most operators of interest will be symmetric.
]
- *Uniform Ellipticty* of A: There must a exist a $lambda > 0$ such that
  $
    lambda ||xi||^2 <= xi^T A xi.
  $
  for all $x in Omega$ and $xi in R^d.$

#callout[Note that this *_stronger_* than *postive definiteness*.]
- *Boundedness* of the coefficients. There must exist a constant $K > 0$ such that it bounds all coefficient functions simultaneously.

#callout[Remember that our domain is bounded]

== Generalized Weak Maximum Principle
Assume that $L u >= 0$ and that the coefficient function $c equiv 0.$ Then $u$ is bounded by its maximum on the boundary.
$
  max_(Omega) u = max_(partial Omega) u
$

#callout[
  The proof for *$L u > 0$* follows from multivariable calculus. Remember that at an *interior maximum*, the first order derivatives must be zero and the Hessian Matrix must be _negative_ semi-definite. (In one dimension: *$u'(x_0) = 0, u''(x_0) <= 0$*)
  This *contradicts* $L u > 0.$

  The case $L u >= 0$ is reduced to the above case by modifying $u$.
]



== Hopf's Lemma
A boundary point $x_0 in Omega$ satisfies the _Interior Sphere Condition_ if there exists a Ball $B subset Omega$ such that
$
  x_0 in partial B.
$

Hopf's Lemma now states:
Assume $L u >= 0$ with $c = 0$  in $Omega$. Further, Let $x_0 in partial Omega$ be a boundary point such that
- $u$ is *continuous at $x_0$*
- $u(x_0) > u(x)$ for all $x in Omega$. So *$u(x_0)$ *is a* _strict_ maximum*
- $x_0$ satisfies the *interior sphere condition*.

Then the outer *normal derivative* of $u$ at $x_0$, if it exists, is *strictly positive*:
$
  (partial u) / (partial nu) (x_0) > 0.
$


#callout[
  Proof idea: The *Weak Maximum Principle* gives us *$(partial u)/(partial nu) (x_0) >= 0$* almost for free. But we need a *_barrier function_* to *push* it _strictly_ *above 0*.

  We define that barrier function as
  $
    v(x) = e^(-alpha r^2) - e^(-alpha R^2),
  $
  where $B_y (R)$ is the ball obtained from the interior sphere condition and $r = ||x - y||.$

  Notice that the *barrier's outward derivative *is* strictly smaller *than* zero*: $ (d v) / (d nu) = (d v) / (d r) < 0. $

  *Ellipticity* and *Boundedness *of $L$'s Coefficients *guarantee* that $alpha$ can be chosen so large that *$L v >= 0$* *on* an *_Annulus_* near $x_0$. It curves upwards and points downwards to $x_0:$

  #import "@preview/cetz:0.3.4"

  #figure(
    cetz.canvas({
      import cetz.draw: *

      // shaded excised core [0, rho]  (drawn first, as background)
      rect((-0.4, -2.1), (2, 3.4), fill: luma(238), stroke: none)

      // baseline: value = 0
      line((-0.4, 0), (7.1, 0), stroke: (dash: "dashed", paint: gray))
      content((7.4, 0), text(fill: gray)[$0$])

      // the wall / boundary at r = R
      line((6, -2.1), (6, 3.4), stroke: (dash: "dashed"))
      content((6, 3.75), [$partial Omega$ (wall)])

      // outward normal at x_0
      line((6, 0), (6.7, 0), mark: (end: ">"))
      content((6.95, 0.22), [$nu$])

      // rho divider + region labels
      line((2, -2.1), (2, 3.2), stroke: (dash: "dotted", paint: gray))
      content((0.8, 3.0), text(size: 8pt, fill: gray)[core: $L v < 0$\ (excised)])
      content((4.0, 3.0), text(size: 8pt, fill: gray)[annulus: $L v >= 0$])

      // barrier v (blue): dome, v>0 inside, v(R)=0, steep in the middle,
      // flattening (concave up) toward the rim
      bezier((0, 2.8), (6, 0), (1.2, 2.7), (4.6, 0.15), stroke: (paint: blue, thickness: 1.4pt))
      content((0.75, 2.3), text(fill: blue)[$v$ (barrier)])

      // tangent of v at x_0: small but strictly negative slope
      line((5.2, 0.12), (6.7, -0.12), stroke: (paint: blue, dash: "dashed"))
      content((6.55, -0.4), text(size: 8pt, fill: blue)[$v'(R) < 0$])

      // u - u(x_0) (red): <= 0 everywhere, rises to 0 at x_0
      bezier((1.3, -1.3), (6, 0), (3.2, -1.45), (5.0, -0.7), stroke: (paint: red, thickness: 1.4pt))
      content((2.3, -1.15), text(fill: red)[$u - u(x_0)$])

      // tangent of u at x_0: strictly positive slope  (the conclusion)
      line((5.3, -0.5), (6.7, 0.48), stroke: (paint: red, dash: "dashed"))
      content((6.45, 0.68), text(size: 8pt, fill: red)[$partial_nu u > 0$])

      // axis points
      circle((0, 0), radius: 0.05, fill: black)
      content((0, -0.38), [$y$])
      content((2, -0.38), text(fill: gray)[$rho$])
      circle((6, 0), radius: 0.06, fill: black)
      content((6, -0.4), [$x_0$])
      content((3.4, -1.95), [$r = ||x - y||$])
    }),
  )


  This *allows* us to *squeeze* a tiny portion *$epsilon v$* of it *on top of $u$.*

  The derivative of the sum $u + epsilon v$ is still not negative. *In order to cancel* the negative derivative of $epsilon v$, *$u$ has *to have* positive deriviative!*

]




== Hopf's Maximum Principle

Assume that $L$ has the three properties stated at the start of the chapter. Assume that *$L u >= 0$* on $Omega.$ If $u$ attains a maximum inside $Omega$, then it must be constant already.

#callout[
  *Proof idea*: Define
  $
    Omega^- := {x in Omega | u(x) < M}.
  $

  Then *hit $partial Omega^-$ with Hopf's Lemma.*
  (Grow a ball onto it to satisfy interior ball condition)

  The Contradiction comes from the basic fact that at an interior maximum, the derivative must be zero of course -- but Hopf would imply otherwise.

]

#callout3[
  *So how do we use it?* Hopf's Lemma shows the Maximum Principle survives for general elliptic
  operators — so we still get uniqueness and a priori bounds for free. But
  existence is a different story: Without an explicit fundamental solution or
  Poisson kernel, we have no constructive way to build solutions on _even_ a small
  ball anymore.

  The bottom line is that at this point, *Classical technique has "run out of fuel"* — not because the Maximum Principle
  failed, but because nothing is left to constructively build a solution with.
  This is what forces the shift to *_weak solutions_*.
]


= Weak Solutions -- Allowing more general solutions
#callout1[
  In order to find more solutions, one needs to be "less strict about the
  niceness" of the functions that solve a PDE at hand. Modern PDE Theory
  therefore weakened the notion of a solution by introducing a weaker sense of
  the derivative, yielding a new function space one can look for (and find more)
  solutions in.
]

#callout2[
  We will see later that often times one can find out that a weak solution "is
  not as bad after all". So the modern logic goes like this:

  + Look for a weak solution first, as they are easier to find.
  + Show that this weak solution is actually better behaved, more _regular_,
    than "expected".

  This part of the theory is called *_Regularity Theory_*.
]

=== Fundamental Lemma of Calculus of Variations

== Mollifiers

== Distributions -- Part II

== Weak Derivatives

== Sobolev Spaces

== Weak Solutions

== Divergence Form




#callout[
  We can actually write the general linear operator L
  in a way that $u$ makes integration by parts straightforward. If the coefficent matrix *$A$* is *symmetric* and if there are *no first order terms*, it makes the *operator * formally *self-adjoint*, which produces

  $
    integral L u phi = integral u L phi
  $
]

Consider

$ partial_i (a_(i j) partial_j u). $

The product rule implies

$
  partial a_(i j) partial_j u + partial_(i j) u
$

The left term only of first order. Thus, it can be absorbed into the first order term in the general representation (just yielding a different coefficent $tilde(b)$)


Let's assume that this $tilde(b)$ is zero. Then our operator looks like this (carrying along the conventional minus sign as always):

$
  L u = - partial_(i) (a_(i j) partial_j ) + c u
$

Let $phi$ be a test function. Integrating by parts twice yields :
$
  integral L u phi = integral u L phi.
$

#callout[
  Note that this only holds if $A$ is symmetric!
]

This can be used to solve problems in weak formulation again.

== Trace Theorem

== Existence via Lax–Milgram


= Variational Approaches

== Dirichlet Principle -- Minimzing Energy $<=>$ Solving PDE

#callout[
  We want to now show that *finding solutions* is the *same* thing is *minimizing* some energy functional.
]

Define the energy functional
$
  S(u) = A(u,u) + l(u),
$

where
$
  A(u,eta) := integral a^(i j) partial_i u partial_j eta + c u eta
$
and
$
  l(u) = -2 integral f u.
$


#callout[
  To *motivate* this *definition*: Let's say we are given the weak formulation of a PDE:
  $
    integral L u eta= integral f eta,
  $
  where *$eta$* is an arbitrary *test function.*

  Lets say $eta$ is a test function. When we test $L u$ against $eta$. Using *partial integration*, we get (Remember, L is in *divergence form!*)
  $
    integral L u eta & = - integral partial_i (a^(i j) partial_j u) eta + c u eta \
                     & = integral a^(i j) partial_i u partial_j eta + c u eta = A(u,eta).
  $
  This is *_exactly_ $A(u,eta).$*

  So both terms in the energy functional are motivated by a linear elliptic PDE that shall be soletaed. Why the factor $-2$ is necessary, we will see in a minute.
]

Assume that $u$ minimizes $S$. Let $eta$ be any test function and define
$
  Phi(t) = S(u + t eta).
$

#callout[
  If $u$ minimizes $S$, then *$Phi$ must have a minimum at $t = 0.$* Therefore we want to evaluate $Phi'$
]

Let's unpack $Phi$ first. Since $A$ is a symmetric bilinear form, we get
$
  A(u + t eta) = A(u,u) + 2t A(u, eta) + t^2 A(eta, eta).
$

So
$
  partial_t A(u+ t eta)_(|t = 0) = 2 A(u, eta).
$

#callout[
  This is why the factor $2$ is needed in the definition above. The $2$ obtained from differntiating and it will cancel, leaving the weak formulation of the problem.
]

Similarily, inspecting $l$ and using linearity, we get
$
  partial_t l(u + t eta)_(|t = 0) = l(eta).
$
Putting these together yields
$
  Phi'(t) = 2 A (u, eta ) + l (eta)
$

Setting this zero gives us the so called _Euler-Lagrange Equation_:
$
             A(u, eta) & = 1/2 l( eta) \
  <=> integral L u eta & = integral f eta
$

#callout[
  The *Euler–Lagrange Equation* *_is_* exactly the *weak formulation* of the PDE.
]

#callout[
  Remember that we first assumed that $u$ is a critical point! So:

  A *critical point of $S$ *is a* weak solution to $ L u = f. $*

  That is exactly what Dirichlet's Principle is. What is left *to do* is *showing* that a *minimzer* actually *exists*. This is what we will do now
]

== Direct Method Of Variations -- Finding a Minimizer

=== Energy is bounded below
Uniform ellipticity and boundedness of $l$ give us
$
  S(u) = A(u,u) + l(u) >= lambda ||u||^2 + ||l|| ||u||.
$



#callout[

  The whole idea is:
  Poincaré turns uniform ellipticity of $A$ into coercivity of $S$. Then:

  *coercive* + *convex* + *parallelogram* *=>* minimizing *sequence* is *Cauchy*.

  Since Hilbert spaces are complete, it converges.
]



== Convex Variational Problems

== Finite Element Method


= Sobolev Embeddings

== Gagliardo-Nirenberg-Sobolev Inequality

== Morrey Inequality

== Rellich-Kondrachov


= Regularity Theory

== Linear

=== Cacciopoli

=== Nirenberg Difference Quotients

#callout[
  Important Lemma: *If* $w in L^2$ *difference quotients* are *uniformly bounded*, then $w$ has a *weak derivative!*
  Sketch:
  - move the difference quotient over to test function vie *discrete integration by parts*
  - since *test functions* _do_ have a derivative, there *exists* a *limit* as $h->0$.
  - *Riesz-Representation* now implies that there exists a representative $v$ for the functional
    $
      eta |-> - integral w partial_i eta
    $
    This works, because the functional is bounded. (*because* of the *uniform bound!*)
  - This *matches* the *definition* of weak derivative:
  $
    integral v eta = - integral w partial_i eta
  $

  Note that this *only works for **$Omega' subset.double Omega.$* We need to be able to choose an *$ h < "dist"(Omega', partial Omega)! $*
]

#callout[
  Let's say we have a solution *$u in H^1$*. We can use the above lemma to *actually* show its *in $H^2$*. So has one more derivative than what is currently known. We only need to *find* a *uniform bound for $w=D u$*.

  Again, this only works on the _interior_ with $Omega' subset.double Omega.$
]

#callout[
  *If* the *data* (coefficient functions and $f$ "other side of equation") *allows* it (they are still differentiable), *then* one can use Nirenberg's *Difference-Quotients* *iteratively*:
  - Find *Solution in $H^1$*
  - Use difference quotients to show its *actually* in *$H^2$*
  - _*Differentiate*_ the *equation* $->$ *$D u$ will solve* the new equation!
  - $D u$ is currently in $H^1$ -- *same situation* as in the beginning
  - *Repeat* until you cannot differentiate the equation anymore.

  For $C^infty$ data, this means, the process does not stop.
  $
    H^1 -> H^2 -> H^3 -> ...
  $
  So *$u$* is *actually smooth!*
  $
    u in inter.big_k H^k_"loc" arrow.hook C^infty.
  $
]

#callout[
  *All* that we have done so far was look at the *interior*. The difference quotient method required $Omega' subset.double Omega.$ To get it to work on the boundary, do the following:
  - use a chart to *flatten* the *boundary* locally
  - this *makes "room"* *for every difference quotient* *except one* normal to the boundary.
  - Use Nirenberg's Lemma for all the difference quotients except that one
  - *Solve* the *PDE* *only for* the *missing one:*
    $
      a_(i i) partial_(i i) u = ...
    $

    Ellipticity allows to divide through $a_(i i)$, which gives us a second derivative of u!

    (Note that we can write $partial_(i i) u$ in the sense of distributions always, even if it would not have an associated function.)
]


== Non-Linear

=== De Giorgi-Nash

=== Moser Iteration
