#import "template.typ": *

#let Laplace = $Delta$
#let Gradient = $nabla$
#let int = $integral_(RR^n)$
#let intinside = $integral_Omega$
#let intbound = $integral_(partial Omega)$
#let int0 = $integral_(B_epsilon)$
#let int1 = $integral_(RR^n \\ B_epsilon)$
#let int2 = $integral_(partial B_epsilon)$


#show: conf.with(title: "Second-Order \nElliptic PDEs", subtitle: "A Conceptual Overview")

= Integration By Parts
#callout[*Integration By Parts* plays a fundamental role in modern PDE theory. It allows us to *find* otherwise *"hidden" solutions*. It allows us to "*move the Laplacian over*" to another function, *enabling countless proofs*. Therefore, we revise the reason why it works in the first place -- the Divergence Theorem --right at the beginning of this summary.]
== Divergence Theorem
The Divergence Therom states, that for a differentiable vector field $F = (F_1, ..., F_n)$ and bounded $Omega subset RR^n$ we have
$ intinside Gradient dot F = intbound F dot nu, $

where $nu$ is the outer normal field of Omega and $ Gradient dot F = (partial_1 F_1, ..., partial_n F_n) $ is the Divergence of F.

== Green's Identities
=== Green's First Identity
Setting $F = u Laplace v$ and using the product rule, one unpacks the definitions to Green's First Identity:
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

=== Green's Second Identity
Green's Second Identity just subtracts two Green's First Identity Equation. One for $u Laplace v$ and one for the other way around where $v Laplace u$. Since the scalar product is symmetric, the rightmost integrals cancel out and we are left with

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

= Prerequisits

== Introduction to Distributions
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
  What exactly a "Variation" is will be explained in the later chapters.
]

A _test function_ is a "very nice" function. It is smooth and compactly supported, formally $phi in C^infty_c.$

A _Distribution_ is a bounded linear functional acting on a test function. (i.e. an element of the dual space of $C_c^infty$)
For example, for a locally integrable function $f$, the mapping
$ T_f colon quad phi |-> integral f phi $
is the _Associated Distribution_ to $f$. However, _not_ every Distribution needs to stem from a locally integrable function!

#callout[
  We will often argue in the following way. Let's say we want to show that $f =g$. Then we *make* a *detour* *through* the world of *Distributions:* That means, often we can find a distribution $S$, such that
  $ T_f = S = T_g. $
  Now we are done, because this implies $f=g$ by the Fundamental Lemma stated above.
]

=== Operator applied to Distribution
#callout[
  Let's say $u$ is differentiable twice. Then Green's Second Identity and the fact that test functions vanish far out imply
  $ T_(Laplace u) phi = int (Laplace u) phi = int u (Laplace phi) = T_u Laplace phi. $

  This motivates the definition
  $ (Laplace T) phi = T (Laplace phi). $

  More general:
  $ (L T)phi := T (L^* phi), $
  where $L$ is a Linear Operator, $L^*$ is its _adjoint_ and $T$ is a Distribution. Keep in mind that the Laplacian is self-adjoint.
]






= Constructing Solutions to the Laplace / Poisson Equation

The *Poisson Equation* is 
$
 Laplace u =  f.
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

$ (Phi''(r)) / (Phi'(r)) = (1-n) /r $

Integrating both sides yields

$ ln|Phi'(r)| = (1-n)ln r + c. $

Applying the exponential function gives

$ Phi'(r) = A r^(1-n) $

Integrating again yields

$ Phi(r) = cases(A ln r + B &"if" n = 2, A/(2-n) r^(2-n) + B quad &"if" n >= 3), $

where $A,B$ are constants depending on $n.$

#callout[
  What we just derived is the basis for the *Fundamental Solution,* which we are going to find now.
]

To make sense of the subsection afterwards, we need just a bit of distribution
theory now:
== Solving the Poisson Equation for a point source -- The Fundamental Solution

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
  The *idea* behind this is the following: Our "point source" is the *limit* of test functions $psi_k$ that get *taller and narrower* towards the origin, *but* their *integral remains constant*. Let's see how how these act on a test function $phi$. For large $k$, the support of $psi_k$ shrinks by construction. Hence there are $epsilon_k -> 0$ such that
  #let intk = $integral_(||x|| < epsilon_k )$
  $
    T_(phi_k) = integral psi_k phi & = intk psi_k phi \
                                   & = intk psi_k
                                     underbrace(phi, approx phi(0)) \
                                   & approx phi (0) intk psi_k \
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

directly. Therefore, we *punch a hole* of radius $epsilon$ around the origin and take the limit $epsilon -> 0$. We then *apply Green's Second* Identity. Because *test functions vanish far out* and *$Phi$ is harmonic*, this yields





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
where $|S_(n-1)|$ is the surface area of the sphere. Remember, we want to show that
$ - integral_(RR^n) Phi Delta psi = psi(0). $
Therefore *$A$ must equal* $ -1/(|S_(n-1)|). $


#callout[
  Looking back at the previous subsection, this gives us the *Fundamental Solution*
  $ Phi(r) := cases(-1/(|S_1|)ln r &"if" n = 2, 1/(|S_(n-1)|(n-2)) r^(2-n) quad &"if" n>=3) $

  to the Laplace Equation.

]


#callout[
  Technincally, we only found a "radial" fundamental solution, but it turns out that its actually the _only_ one.
]


== Deriving a Solution for \ arbitrary $f$ on $RR^n$


Remember that our "point source" $delta$, more formally known as the Dirac Distribution acted on a test function $phi$ by evaluating it at the origin: $ delta(phi) = f(0). $

Let $x$ now be an arbitrary point and consider the function $ phi_x := y |-> phi(x-y). $
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


== Honorable Mention: \ The Fourier Transform

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
  domains where something like the mirror-trick works. It's hard to find
  solutions in general.

  Therefore, the following sections mainly focus on uniqueness and existence in
  more arbitrary settings without constructing explicit solutions.
]

= Harmonic Functions

#callout1[
  This section is about finding more general but non-constructive solutions to
  Laplace's Equation by investigating properties of harmonic functions.
]

== Mean Value Property

== Maximum Principles

=== The Weak Maximum Principle

=== The Strong Maximum Principle

=== Uniqueness of Solutions

=== Liouville's Theorem

=== Perron's Method

#callout2[
  Perron's method answers the question raised earlier about existence on domains
  without an explicit Green's function.
]

==== Barriers

==== Regular Points

==== Lebesgue-Spine

#callout1[
  Now we move from the Laplace-Operator to more general Second-Order Elliptic
  Operators.
]

#callout2[
  We will see that under the right assumptions, the Maximum Principle still
  holds in the general setting. But we can no longer rely on the Mean Value
  Property. We need _Hopf's Lemma_ to replace it in the argument.
]

= General Second-Order Elliptic Operators

== The Ellipticity Condition

== Generalized Maximum Principles

=== Hopf's Lemma
#callout3[
  Hopf's Lemma shows the Maximum Principle survives for general elliptic
  operators — so we still get uniqueness and a priori bounds for free. But
  existence is a different story: without an explicit fundamental solution or
  Poisson kernel, we have no constructive way to build solutions on even a small
  ball anymore.

  *Classical technique has run out of fuel* — not because the Maximum Principle
  failed, but because nothing is left to constructively build a solution with.
  This is what forces the shift to *_weak solutions_*.
]

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

= Generalized Solutions

== Distributions

=== Fundamental Lemma of Calculus of Variations



== Weak Derivatives

== Sobolev Spaces

== Weak Solutions

== Divergence Form

#callout3[
  Though we are considering _Second-Order_ Elliptic Operators, Integration By
  Parts using _Divergence-Form_ allows us to look for solutions having only
  _one_ Weak Derivative.

  (Regularity Theory will give us the second derivative back later.)
]

== Trace Theorem

== Existence via Lax–Milgram


= Variational Approaches

== Dirichlet Principle

#callout2[
  Lax–Milgram already gave us existence and it did not even require symmetry —
  so why bother with an energy functional? Because Variational Approaches are
  not restricted to linear problems!
]

== Euler–Lagrange Equation

== Direct Method Of Variations

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

== Non-Linear

=== De Giorgi-Nash

=== Moser Iteration
