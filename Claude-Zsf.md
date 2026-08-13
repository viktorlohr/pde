# PDE I (Finster, SS 2013) — Main Results for the Oral Exam

**Source:** *Partial Differential Equations I*, lecture by Prof. Dr. Felix Finster, script by A. Völklein (135 pp.).

**How this document is organized.** For each result you get:

1. **Hypotheses** — spelled out completely, including the ones the script leaves implicit.
2. **Statement**
3. **Proof sketch** — the skeleton you should be able to reproduce at the blackboard, with the one or two *ideas* that carry the proof marked ▶.
4. **Role of the hypotheses** — where each is used, and what breaks without it. This is the part oral examiners live on.

**Priority tags** (my judgement of what a typical second-order-elliptic examiner asks):

| Tag | Meaning |
|---|---|
| ★★★ | Core. Expect to be asked; must know statement *and* proof idea. |
| ★★ | Important. Statement cold, proof idea in one or two sentences. |
| ★ | Supporting / technical. Know what it says and why it is needed. |
| ○ | Peripheral for this exam. Recognize it, don't invest time. |

Standing notation: $\Omega\subseteq\mathbb R^n$ open, $\omega_n=\mu(B_1(0))$, so $n\omega_n=|S^{n-1}|$; $\nu$ = outer unit normal; $\rlap{\,\text{--}}\!\int_U f = \frac1{\mu(U)}\int_U f$ (average integral).

---

## Table of contents

- [0. The four-line story of the lecture](#0-the-four-line-story-of-the-lecture)
- [1. Classification (Ch. 1)](#1-classification-ch-1)
- [2. Distributions and Fourier transform (Ch. 2)](#2-distributions-and-fourier-transform-ch-2)
- [3. The Laplace equation (Ch. 3)](#3-the-laplace-equation-ch-3)
- [4. The Perron method (Ch. 4)](#4-the-perron-method-ch-4)
- [5. Maximum principles for general elliptic $L$ (Ch. 5)](#5-maximum-principles-for-general-elliptic-l-ch-5)
- [6. Sobolev spaces (Ch. 6)](#6-sobolev-spaces-ch-6)
- [7. Existence of weak solutions, Dirichlet principle (Ch. 7)](#7-existence-of-weak-solutions-dirichlet-principle-ch-7)
- [8. Convex variational problems (Ch. 8)](#8-convex-variational-problems-ch-8)
- [9. Finite elements — Céa's lemma (Ch. 9)](#9-finite-elements--céas-lemma-ch-9)
- [10. Embedding theorems (Ch. 10)](#10-embedding-theorems-ch-10)
- [11. Regularity theory, linear case (Ch. 11)](#11-regularity-theory-linear-case-ch-11)
- [12. De Giorgi–Nash–Moser (Ch. 12)](#12-de-giorginashmoser-ch-12)
- [13. Cross-cutting themes and likely exam questions](#13-cross-cutting-themes-and-likely-exam-questions)
- [14. Errata / things stated loosely in the script](#14-errata--things-stated-loosely-in-the-script)

---

## 0. The four-line story of the lecture

If you can tell this story in two minutes, you have the lecture.

1. **Explicit theory for $\Delta$** (Ch. 3): the fundamental solution gives representation formulas $\Rightarrow$ mean value property $\Rightarrow$ maximum principle, Harnack, Liouville, smoothness. Everything is a consequence of one formula.
2. **Existence without formulas, classically** (Ch. 4–5): Perron's method builds a harmonic function as a supremum of subsolutions using only the maximum principle; the boundary values are attained iff barriers exist. The maximum principle itself survives for general $L=a^{ij}\partial_{ij}+b^i\partial_i+c$ provided $c\le 0$.
3. **Existence via Hilbert space** (Ch. 6–9): give up classical solutions, minimize the Dirichlet energy over $H^{1,2}_0$. Needs Sobolev spaces (completeness, traces, Sobolev/Morrey/Poincaré inequalities). Coercivity + convexity + completeness ⟹ a minimizer exists; the minimizer is a weak solution.
4. **Regularity** (Ch. 10–12): a weak solution is better than it looks. Difference quotients + Caccioppoli give $H^{2,2}_{\rm loc}$ and by bootstrap $C^\infty$ for smooth coefficients (Ch. 11). If the coefficients are merely $L^\infty$ (which is what nonlinear problems produce after "freezing"), De Giorgi–Nash–Moser still gives $C^{0,\alpha}$, via the Harnack inequality obtained by Moser iteration (Ch. 12).

The pivot points to name out loud: **mean value property**, **maximum principle**, **Poincaré + coercivity**, **Caccioppoli**, **Moser iteration**.

---

## 1. Classification (Ch. 1)

**○ / ★** (short warm-up question at most)

For a scalar 2nd order equation $F(x,u,Du,D^2u)=0$ set $A^{ij}:=\dfrac{\partial F}{\partial p_{ij}}$ (symmetric).

- $A$ positive definite ⟹ **elliptic** (Laplace, Poisson, stationary Schrödinger)
- $n-1$ positive, one negative eigenvalue ⟹ **hyperbolic** (wave equation)
- $n-1$ positive eigenvalues, non-trivial kernel ⟹ **parabolic** (heat equation)

Mixed types are excluded from the lecture. Note that ellipticity is a condition on the *principal symbol only*; lower-order terms $b^i,c$ are irrelevant for the type but decisive for the maximum principle (Ch. 5).

*Caveat if asked:* the script also calls the Schrödinger equation "parabolic". By the symbol criterion the classification of $i\partial_t\psi = -\Delta\psi+V\psi$ is degenerate (the coefficient matrix is real but the equation is complex); it is standardly called *dispersive*, not parabolic. Safe answer: "formally the same principal part as the heat equation, but with $i$ in front of $\partial_t$, hence unitary evolution rather than smoothing — usually classified as dispersive."

---

## 2. Distributions and Fourier transform (Ch. 2)

**Overall priority: ★ / ○.** This chapter is a toolkit, not the heart of the course. Know: why we need distributions, the definition of $\mathcal S$, $\mathcal S^*$, distributional derivative, and the three theorems below. Do not memorize the Schwartz-norm estimates.

Notation: $\|f\|_{r,s}=\sum_{|\alpha|\le r}\sum_{|\beta|\le s}\sup_{x}|x^\alpha D^\beta f(x)|$; $\mathcal S(\mathbb R^n)=\{f\in C^\infty:\ \|f\|_{r,s}<\infty\ \forall r,s\}$; $\mathcal S^*$ = tempered distributions = continuous linear functionals on $\mathcal S$.

### 2.1 $\mathcal F$ maps $\mathcal S$ to $\mathcal S$ (Prop. 2.2.2) — ★

**Hypotheses.** $f\in\mathcal S(\mathbb R^n)$.

**Statement.** $\mathcal F,\overline{\mathcal F}:\mathcal S\to\mathcal S$ are well defined, linear, continuous, with
$$\|\mathcal Ff\|_{r,s}\le c(r,s,n)\,\|f\|_{s+n+1,\,r}.$$

**Proof sketch.** ▶ The only mechanism is the exchange rule
$$x^j \longleftrightarrow i\partial_{p_j},\qquad -i\partial_{x^j}\longleftrightarrow p_j,$$
i.e. differentiation in $p$ = multiplication by $x$ and vice versa. Then $p^\alpha D^\beta(\mathcal Ff)(p)=\frac{(-i)^{|\alpha|+|\beta|}}{(2\pi)^{n/2}}\int D^\alpha_x\big(x^\beta f(x)\big)e^{-ipx}\,d^nx$, and bound this crudely by $\|\cdot\|_{C^0}\int (1+|x|)^{-(n+1)}$. Differentiation under the integral is justified by dominated convergence.

**Role of hypotheses.** Rapid decay is needed to differentiate under the integral (dominating function $(1+\|x\|)^{-(n+2)}$); smoothness is needed to integrate by parts without boundary terms. *Why the norms $\|\cdot\|_{r,s}$ and not $\|f\|_{C^k}$?* Because the Fourier transform trades decay for smoothness — with $C^k$-norms alone the transform of a function with finite norms need not have finite norms. This is exactly why $\mathcal S$, and not $C^\infty_0$ or $C^k$, is the right space.

### 2.2 Plancherel / Fourier inversion (Thm. 2.2.3, 2.2.5) — ★★

**Hypotheses.** On $\mathcal S(\mathbb R^n)$; then transported to $\mathcal S^*(\mathbb R^n)$ by duality.

**Statement.** $\mathcal F\overline{\mathcal F}=\overline{\mathcal F}\mathcal F=\mathbb 1$ on $\mathcal S(\mathbb R^n)$, and likewise on $\mathcal S^*(\mathbb R^n)$.

**Proof sketch.** Write out the double integral; the inner integral $\int e^{-i(p-q)x}d^nx$ **does not converge**. ▶ Insert a *convergence generating factor* $e^{-\varepsilon x^2}$, compute the resulting Gaussian integral in closed form by completing the square and a contour shift,
$$\int_{\mathbb R}e^{-i\lambda x}e^{-\varepsilon x^2}dx=\sqrt{\tfrac\pi\varepsilon}\,e^{-\lambda^2/(4\varepsilon)},$$
so that the kernel becomes an approximate identity $\left(\frac\pi\varepsilon\right)^{n/2}e^{-(p-q)^2/(4\varepsilon)}$, and let $\varepsilon\searrow 0$. On $\mathcal S^*$ nothing has to be redone: $(\mathcal F\overline{\mathcal F}T)(f)=T(\overline{\mathcal F}\mathcal F f)=T(f)$ by definition of the distributional transform.

**Role of hypotheses.** The regularization is not cosmetic: without it Fubini is illegal because the integrand is not in $L^1$ of the product space. The passage to $\mathcal S^*$ is free *only because* $\mathcal F$ was shown to be continuous $\mathcal S\to\mathcal S$ in 2.2.2 — that is what makes $\mathcal FT$ again a tempered distribution.

### 2.3 $\mathcal F$ is unitary on $L^2$ (Thm. 2.2.7) — ★

**Hypotheses.** $f\in L^2(\mathbb R^n)$.

**Statement.** $\|\mathcal Ff\|_{L^2}=\|f\|_{L^2}$; with $\mathcal F\overline{\mathcal F}=\mathbb 1$, $\mathcal F$ is unitary.

**Proof sketch.** Prove $\langle \mathcal Ff,\mathcal Fg\rangle=\langle f,g\rangle$ for $f,g\in\mathcal S$ by viewing $f$ as the regular distribution $T_f$ and using $\mathcal F\overline{\mathcal F}=1$; then extend by density of $\mathcal S$ in $L^2$ and continuity.

**Role of hypotheses.** Density of $\mathcal S$ in $L^2$ is the whole extension argument; continuity of $\mathcal F$ makes the limit exist.

### 2.4 Application: constant-coefficient PDE — ★

For $\Delta u=f$ in $\mathbb R^n$, $f\in\mathcal S$: transform to $-\|p\|^2\hat u=\hat f$, so $\hat u=-\hat f/\|p\|^2$.

Two lessons worth stating in an exam:
- $\|p\|^{-2}\hat f$ is a *regular* distribution only for $n\ge3$ (for $n<3$ the singularity at $p=0$ is not locally integrable) — this is exactly the same $n$-dependence as the fundamental solution $\Gamma$.
- The distributional solution is **not unique**: $\hat u+c\,\delta$ solves it too (i.e. one may add a harmonic polynomial). Uniqueness requires prescribing the behaviour as $\|x\|\to\infty$ — the Fourier picture of "boundary conditions matter".

---

## 3. The Laplace equation (Ch. 3)

This is the chapter with the highest exam yield per page.

### 3.0 Green's identities (Thm. 3.0.2) — ★ (tool)

For $u,w\in C^\infty(\overline\Omega)$, $\partial\Omega$ smooth:
$$\int_\Omega w\Delta u=\int_{\partial\Omega}w\,\nabla_\nu u-\int_\Omega\langle\nabla w,\nabla u\rangle,\qquad
\int_\Omega(w\Delta u-u\Delta w)=\int_{\partial\Omega}(w\nabla_\nu u-u\nabla_\nu w).$$
Both are just $\Delta=\operatorname{div}\operatorname{grad}$ + Gauss's theorem; the second is the first minus itself with $u,w$ swapped. **These are used in almost every proof of Ch. 3.**

### 3.1 Fundamental solution (Def. 3.1.2) — ★★★

$$\Gamma(x,y)=\Gamma(\|x-y\|)=\begin{cases}\dfrac1{2\pi}\ln\|x-y\|, & n=2,\\[2mm]
\dfrac1{n(2-n)\omega_n}\|x-y\|^{2-n}, & n>2.\end{cases}$$

**Where it comes from (be able to derive this!).** In polar coordinates
$$\Delta=\frac1{r^{n-1}}\frac{\partial}{\partial r}\Big(r^{n-1}\frac{\partial}{\partial r}\ \cdot\ \Big)+\frac1{r^2}\Delta_{S^{n-1}},$$
so a radial harmonic function satisfies $r^{n-1}\Gamma'(r)=\text{const}$, hence $\Gamma'(r)=cr^{1-n}$ and $\Gamma(r)=a+c\int^r\tau^{1-n}d\tau$, which is $\ln r$ for $n=2$ and $r^{2-n}$ otherwise. The constants are normalized so that $\Delta\Gamma=\delta$.

**Why the two cases?** $\int^r \tau^{1-n}d\tau$ has an antiderivative $\frac{r^{2-n}}{2-n}$ except when $2-n=0$. Dimension $n=2$ is genuinely different: $\Gamma\to-\infty$ at $0$ *and* $\to+\infty$ at $\infty$, which is why e.g. Liouville-type and exterior problems behave differently in the plane.

### 3.2 Green's representation formula (Thm. 3.1.3) — ★★★

**Hypotheses.**
- $\Omega\subseteq\mathbb R^n$ open with **smooth boundary** (so that Gauss/Green apply),
- $u\in C^2(\overline\Omega)$ — i.e. $C^2$ up to the boundary, so that $u,\nabla u$ have boundary values and $\Delta u$ is integrable,
- $y\in\Omega$ fixed.

**Statement.**
$$u(y)=\int_{\partial\Omega}\big(u(x)\nabla_\nu\Gamma(x,y)-\Gamma(x,y)\nabla_\nu u(x)\big)\,d\mu_{\partial\Omega}(x)+\int_\Omega \Gamma(x,y)\,\Delta u(x)\,d\mu(x).$$
For harmonic $u$ the last term drops: $u$ is determined in $\Omega$ by $u|_{\partial\Omega}$ **and** $\nabla_\nu u|_{\partial\Omega}$.

**Proof sketch.** ▶ Excise the singularity: apply the second Green identity to $v(x)=\Gamma(x,y)$ and $u$ on $\Omega\setminus B_\varepsilon(y)$, where $\Delta v=0$, then let $\varepsilon\searrow0$. Two boundary integrals over $\partial B_\varepsilon(y)$ appear (with a sign flip, since the outer normal of $\Omega\setminus B_\varepsilon$ points *into* the small ball):
- $\displaystyle\int_{\partial B_\varepsilon}\Gamma\,\nabla_\nu u \lesssim \Gamma(\varepsilon)\cdot\varepsilon^{n-1}\sim\varepsilon$ (resp. $\varepsilon\ln\varepsilon$ for $n=2$) $\to0$;
- $\displaystyle\int_{\partial B_\varepsilon}(\nabla_\nu\Gamma)u=\Gamma'(\varepsilon)\int_{\partial B_\varepsilon}u=\frac1{n\omega_n\varepsilon^{n-1}}\big(u(y)n\omega_n\varepsilon^{n-1}+o(\varepsilon^{n-1})\big)\to u(y)$.

**Role of hypotheses.**
- **The exact normalization of $\Gamma$** is what makes the second limit equal $u(y)$ and not $c\,u(y)$.
- **$n\ge2$ / the $\varepsilon$-counting**: the first term vanishes because $\Gamma$ is *less* singular than the surface measure $\varepsilon^{n-1}$ degenerates — this is the precise sense in which $\Gamma$ is "the right" singularity.
- **$u\in C^2(\overline\Omega)$, not just $C^2(\Omega)$**: without control up to the boundary the boundary integrals need not exist. **Smooth $\partial\Omega$**: needed for Gauss.
- Without **$y\in\Omega$** (i.e. $y\notin\overline\Omega$) the singularity is never excised and one gets $0$ on the left-hand side instead of $u(y)$.

**Corollary 3.1.4 (★★).** For $\varphi\in C^\infty_0(\Omega)$: $\varphi(y)=\int_\Omega\Gamma(x,y)\Delta\varphi(x)\,dx$, i.e. $\Delta_x\Gamma(x,y)=\delta^{(n)}(x-y)$ in $\mathcal S^*$. Proof: compact support kills the boundary terms. *This is the statement "$\Gamma$ is a fundamental solution" made rigorous.*

### 3.3 Green's function and the solution of the Dirichlet problem (Def. 3.2.1, Prop. 3.2.2, Thm. 3.2.3) — ★★★

**Motivation to state first.** The representation formula needs *both* $u|_{\partial\Omega}$ and $\nabla_\nu u|_{\partial\Omega}$, but the Dirichlet problem prescribes only $u|_{\partial\Omega}$. Fix: modify $\Gamma$ by a harmonic correction so that the unwanted term dies.

**Definition.** $G(x,y)$, $x\ne y\in\Omega$, is a *Green's function for $\Omega$* if
1. $G(x,y)=0$ for all $x\in\partial\Omega$, $y\ne x$;
2. $h(x,y):=G(x,y)-\Gamma(x,y)$ extends to a $C^2(\Omega)$ function (also at $x=y$) which is **harmonic in $x$**.

**Prop. 3.2.2.** If $u\in C^2(\overline\Omega)$ solves $\Delta u=f$, $u|_{\partial\Omega}=\varphi$, then
$$u(y)=\int_{\partial\Omega}\varphi(x)\nabla_\nu G(x,y)\,d\mu_{\partial\Omega}(x)+\int_\Omega G(x,y)f(x)\,d\mu(x).$$
*Proof:* apply the 2nd Green identity to $h$ (legal — $h$ is smooth, no excision needed) and add Green's representation; the $\nabla_\nu u$ terms cancel because $G|_{\partial\Omega}=0$.

**Thm. 3.2.3 (Symmetry).** $G(x,y)=G(y,x)$.
*Proof sketch:* put $u(z)=G(z,x)$, $v(z)=G(z,y)$, apply Green II on $\Omega\setminus(B_\varepsilon(x)\cup B_\varepsilon(y))$. Both functions are harmonic there and vanish on $\partial\Omega$, so $0=\int_{\partial B_\varepsilon(x)\cup\partial B_\varepsilon(y)}(v\nabla_\nu u-u\nabla_\nu v)$. On $\partial B_\varepsilon(x)$: $u\sim\Gamma(\varepsilon)$ is only logarithmically/power singular while $\nabla_\nu v$ is bounded, so that term $\to0$; the other term reproduces $c\,v(x)$ exactly as in 3.1.3. Same at $y$, giving $0=c\,(v(x)-u(y))$ with $c\ne0$.

**Role of hypotheses / what this buys.**
- Property (i) is *exactly* what removes the unknown Neumann data. Property (ii) keeps the singularity of $\Gamma$ (so the $\delta$ is still produced) while making the correction harmless.
- Symmetry is what lets you also read the formula as a function of the *source* point and conclude $\Delta_y G(x,y)=\delta(x-y)$, hence (formally) that the formula really solves $\Delta u=f$.
- **Existence of $G$ is not proved in general** — only constructed for the ball. This is the honest reason Ch. 4 (Perron) and Ch. 7 (variational methods) exist.

### 3.4 The Green's function of the ball, Poisson formula (Ex. 3.2.4, Thm. 3.2.5) — ★★

**Construction (mirror-charge / Kelvin reflection).** For $\Omega=B_R(0)$ and $y\ne0$ set $\tilde y=\frac{R^2}{\|y\|^2}y$ (so $\|y\|\,\|\tilde y\|=R^2$, $\tilde y\notin \overline{B_R}$) and
$$G(x,y)=\Gamma(\|x-y\|)-\Gamma\!\left(\tfrac{\|y\|}{R}\|x-\tilde y\|\right),\qquad G(x,0)=\Gamma(\|x\|)-\Gamma(R).$$
Checks: (a) the identity $\frac{\|y\|}{R}\|x-\tilde y\|=\sqrt{\frac{\|x\|^2\|y\|^2}{R^2}+R^2-2\langle x,y\rangle}$ shows the second term is **smooth in $x,y$** including $y=0$, and manifestly symmetric; (b) for $\|x\|=R$ that expression equals $\|x-y\|$, so $G=0$ on $\partial B_R$; (c) the second term is harmonic in $x$ because $\tilde y\notin B_R$ (computation using $\Gamma''+\frac{n-1}{r}\Gamma'=0$).

**Poisson kernel.** $\displaystyle \nabla_\nu G(x,y)=\frac{R^2-\|y\|^2}{n\omega_n R}\cdot\frac1{\|x-y\|^n}$, giving

**Thm. 3.2.5 (Poisson representation).** For $\varphi\in C^0(\partial B_R(0))$,
$$u(y):=\frac{R^2-\|y\|^2}{n\omega_nR}\int_{\partial B_R(0)}\frac{\varphi(x)}{\|x-y\|^n}\,d\mu_{\partial B_R}(x)\ (y\in B_R),\qquad u:=\varphi \text{ on }\partial B_R$$
is in $C^0(\overline{B_R})\cap C^2(B_R)$ and harmonic in $B_R$.

**Role of hypotheses.** Only $\varphi\in C^0$ is needed — continuity of the boundary data suffices for solvability *in a ball*. This is the workhorse of Ch. 4: the harmonic lift exists because the Dirichlet problem on balls is solvable **explicitly**. The mirror charge only works because the sphere is invariant under inversion; for a general domain there is no such trick.

### 3.5 Mean value formulas (Thm. 3.3.1) — ★★★

**Hypotheses.** $u:\Omega\to\mathbb R$ **continuous**, $\Omega\subseteq\mathbb R^n$ open. Balls $B_r(x_0)\subseteq\Omega$.

**Statement (an equivalence!).** $u$ is harmonic (i.e. $u\in C^2$ and $\Delta u=0$) **iff** for all $x_0\in\Omega$ and all $B_r(x_0)\subseteq\Omega$ one of
$$u(x_0)=\frac1{n\omega_nr^{n-1}}\int_{\partial B_r(x_0)}u\,d\mu_{\partial B_r}\qquad\text{(spherical mean)}$$
$$u(x_0)=\frac1{\omega_nr^{n}}\int_{B_r(x_0)}u\,d\mu\qquad\text{(solid mean)}$$
holds; and then both hold.

**Proof sketch.**
- "$\Rightarrow$": use Green's representation on $B_r(y)$ with $H(x,y)=\Gamma(x,y)-\Gamma(r)$, which vanishes on $\partial B_r(y)$, so only the $u\nabla_\nu H$ term survives; and $\nabla_\nu H=\Gamma'(r)=\frac1{n\omega_nr^{n-1}}$ is *constant* on the sphere. Spherical $\Rightarrow$ solid by Fubini in polar coordinates.
- "$\Leftarrow$": (a) solid $\Rightarrow$ spherical: write $r^nu(y)=\frac1{\omega_n}\int_0^r\big(\int_{\partial B_\rho}u\big)d\rho$ and differentiate in $r$. (b) ▶ **Smoothness by mollification:** with a radial mollifier $\rho_\varepsilon$, the spherical mean property gives $u_\varepsilon(y)=\int\rho_\varepsilon(x-y)u(x)=u(y)$ *exactly* (not just approximately), and $u_\varepsilon\in C^\infty$, so $u\in C^\infty$. (c) Then $\int_{B_r(y)}\Delta u=\int_{\partial B_r}\nabla_\nu u=r^{n-1}\frac{\partial}{\partial r}\big(r^{1-n}\int_{\partial B_r}u\big)=r^{n-1}\frac{\partial}{\partial r}(n\omega_n u(y))=0$ for all $r$; let $r\to0$.

**Role of hypotheses.**
- The direction "$\Leftarrow$" needs only **continuity**: this is the point. It upgrades a purely averaging property to $C^\infty$ + harmonicity, and it is what makes the Perron method possible (limits of harmonic functions are harmonic, sup of subsolutions is harmonic) — you never have to control derivatives.
- $B_r(x_0)\subseteq\Omega$: the property is required only for balls *inside* $\Omega$; near $\partial\Omega$ nothing is claimed.
- Radial symmetry of the mollifier is used in step (b).

### 3.6 Strong maximum principle (Thm. 3.3.2) — ★★★

**Hypotheses.** $\Omega$ open **and connected**; $u$ harmonic on $\Omega$.

**Statement.** If $u$ attains its supremum (or infimum) **over $\Omega$** at some interior $x_0\in\Omega$, then $u$ is constant.

**Proof sketch.** ▶ Connectedness argument. $\Omega_M=\{u=M\}$ is non-empty and (by continuity) relatively closed. It is open: for $y\in\Omega_M$ and $B_r(y)\subseteq\Omega$, the solid mean value property gives $0=u(y)-M=\rlap{\,\text{--}}\!\int_{B_r(y)}(u-M)$ with a **continuous, non-positive** integrand, hence $u\equiv M$ on $B_r(y)$. A non-empty, open, closed subset of a connected set is everything.

**Role of hypotheses.**
- **Connectedness** is essential: on $\Omega=B_1(0)\cup B_1(5e_1)$ take $u\equiv0$ on one ball, $u\equiv1$ on the other — harmonic, has an interior max, not constant.
- The **mean value property** is doing all the work: this is why the same proof runs verbatim for subharmonic functions (Prop. 4.7).
- "Sup over $\Omega$, attained in $\Omega$" — a *local* max is not what is assumed here (though for harmonic functions the same argument applied to a small ball shows a local max also forces local constancy).

### 3.7 Weak maximum principle and its corollaries (Thm. 3.3.3, Cor. 3.3.4, 3.3.5) — ★★★

**Weak maximum principle.** *Hypotheses:* $\Omega$ open and **bounded**, $u\in C^0(\overline\Omega)$ harmonic in $\Omega$. *Statement:* $\min_{\partial\Omega}u\le u(x)\le\max_{\partial\Omega}u$ on $\Omega$.

*Proof:* $\overline\Omega$ compact ⟹ extrema attained. If attained at an interior $x_0$, apply the strong principle on the connected component $\tilde\Omega\ni x_0$, so $u\equiv u(x_0)$ there and the extremum is also attained on $\partial\tilde\Omega\subseteq\partial\Omega$.

**Role of hypotheses.** **Boundedness** gives compactness of $\overline\Omega$, i.e. existence of extrema, and also gives $\partial\Omega\ne\emptyset$. Counterexamples if dropped: $u(x)=x_n$ on the half-space is harmonic, $u=0$ on the boundary, but unbounded above inside. **Continuity up to $\partial\Omega$** is needed to compare with boundary values at all.

**Cor. 3.3.4 (Uniqueness / comparison).** $u,v\in C^0(\overline\Omega)\cap C^2(\Omega)$ with $\Delta u=f=\Delta v$ and $u\le v$ on $\partial\Omega$ ⟹ $u\le v$ in $\Omega$. In particular the Dirichlet problem for the Poisson equation has **at most one** solution. *Proof:* $h=u-v$ is harmonic, $\le0$ on $\partial\Omega$.
*(Say out loud in the exam: existence is hard, uniqueness is a one-liner from the maximum principle. Note also: this is uniqueness for the **Dirichlet** problem; for the Neumann problem uniqueness only holds up to constants.)*

**Cor. 3.3.5 (Liouville).** $u:\mathbb R^n\to\mathbb R$ harmonic **and bounded** ⟹ constant.
*Proof sketch:* for $y_1,y_2$ compare the solid means over $B_r(y_1)$ and $B_r(y_2)$; the two balls differ by a symmetric difference contained in $B_{r+d}\setminus B_{r-d}$ with $d=\|y_1-y_2\|$, so
$$|u(y_1)-u(y_2)|\le\frac{\sup|u|}{\omega_nr^n}\big(\omega_n(r+d)^n-\omega_n(r-d)^n\big)=\sup|u|\cdot\frac{2nd\,r^{n-1}+\dots}{r^n}\xrightarrow{r\to\infty}0.$$
**Role of hypotheses:** *entire* (harmonic on all of $\mathbb R^n$ — you need $r\to\infty$) and *bounded* (or the prefactor blows up). $u=x_1$ shows boundedness cannot be dropped; harmonicity on a half-space is not enough either.

### 3.8 Harnack inequality and Harnack's convergence theorem (Thm. 3.4.1, Cor. 3.4.2) — ★★★

**Hypotheses.** $\Omega\subseteq\mathbb R^n$ open, $u:\Omega\to\mathbb R$ harmonic and **non-negative**; $\Omega'\subseteq\Omega$ compact (and, for simplicity, connected).

**Statement.** There is $c=c(\Omega,\Omega')$ **independent of $u$** with
$$\sup_{\Omega'}u\le c\,\inf_{\Omega'}u.$$

**Proof sketch.**
1. *Local step.* If $B_{4r}(x_0)\subseteq\Omega$ and $y_1,y_2\in B_r(x_0)$ then $B_r(y_1)\subseteq B_{2r}(x_0)\subseteq B_{3r}(y_2)$, so by the solid mean value property and $u\ge0$
$$u(y_1)=\frac1{\omega_nr^n}\int_{B_r(y_1)}u\le\frac1{\omega_nr^n}\int_{B_{3r}(y_2)}u=3^n\,\frac1{\omega_n(3r)^n}\int_{B_{3r}(y_2)}u=3^nu(y_2).$$
Hence $\sup_{B_r(x_0)}u\le3^n\inf_{B_r(x_0)}u$.
2. *Chaining.* Choose $r<\frac14\operatorname{dist}(\Omega',\partial\Omega)$ (positive since $\Omega'$ is compact and $\partial\Omega$ closed and disjoint from $\Omega'$), cover $\Omega'$ by finitely many such balls $\Omega_1,\dots,\Omega_N$, and use connectedness to chain overlapping balls, picking up a factor $3^n$ per step: $c=3^{Nn}$ works.

**Role of hypotheses.**
- **$u\ge0$** is indispensable — it is what allows enlarging the domain of integration ($\int_{B_r}\le\int_{B_{3r}}$). Without it, $u(x)=x_1$ on any $\Omega'$ has $\inf<0<\sup$, so no such $c$ exists.
- **$\Omega'\Subset\Omega$ compact**: gives a *uniform* $r>0$ and a *finite* cover; the constant blows up as $\Omega'\to\Omega$, which is correct (there is no global Harnack inequality up to the boundary).
- **Connectedness of $\Omega'$**: needed for chaining; otherwise take different constants on different components (or the statement fails as in the max-principle counterexample).
- $c$ **does not depend on $u$** — this is the strength of the statement and exactly what Cor. 3.4.2 uses.

**Cor. 3.4.2 (Harnack's convergence theorem).** *Hypotheses:* $(u_n)$ **monotonically increasing** sequence of harmonic functions on $\Omega$, and there is one point $y\in\Omega$ where $(u_n(y))$ is **bounded**. *Statement:* $u_n\to u$ locally uniformly and $u$ is harmonic.
*Proof:* $u_k-u_m\ge0$ is harmonic for $k>m$, so on $\Omega'\Subset\Omega$ containing $y$,
$$\sup_{\Omega'}(u_k-u_m)\le c\inf_{\Omega'}(u_k-u_m)\le c\,(u_k(y)-u_m(y))\to0,$$
i.e. Cauchy in $C^0(\Omega')$. The limit inherits the mean value property (uniform convergence lets you pass to the limit in the integral), hence is harmonic by Thm. 3.3.1.
**Role of hypotheses:** monotonicity makes $u_k-u_m$ non-negative (Harnack applies) *and* makes pointwise boundedness at a single point equivalent to convergence at that point. Dropping monotonicity: $u_n=\sin(nx_1)\sinh(nx_2)/n$-type examples do not converge. Dropping harmonicity of the limit-check: the mean value characterization (only continuity needed!) is what makes the limit harmonic without any derivative estimates.

---

## 4. The Perron method (Ch. 4)

**Setting.** $\Omega\subseteq\mathbb R^n$ **bounded**, $\varphi\in C^0(\partial\Omega)$ (the script writes $C^2$, but $C^0$ is what is actually used and what Thm. 4.14 states). Goal: solve $\Delta u=0$ in $\Omega$, $u|_{\partial\Omega}=\varphi$ **classically**, with no explicit formula and no Sobolev spaces.

**The idea in one sentence:** define $u:=\sup\{v : v \text{ subharmonic},\ v|_{\partial\Omega}\le\varphi\}$; the supremum is *always* harmonic, and the boundary values are attained exactly where the domain is geometrically decent (barriers).

### 4.1 Definitions — ★★

- $u\in C^0(\Omega)$ is **subharmonic** if for every ball $B\Subset\Omega$ and every $h$ harmonic in $B$, continuous on $\overline B$, with $u\le h$ on $\partial B$, one has $u\le h$ in $B$. (Superharmonic: reverse inequalities.) Note: no differentiability required — this is a *comparison* definition, which is why the class is closed under $\max$ and under harmonic lifting.
- $S_\varphi:=\{v\in C^0(\overline\Omega): v \text{ subharmonic},\ v|_{\partial\Omega}\le\varphi\}$; elements are **subsolutions**. $S_\varphi\ne\emptyset$ since the constant $\min_{\partial\Omega}\varphi$ belongs to it (finite because $\partial\Omega$ is compact — *here boundedness of $\Omega$ is used*).
- **Harmonic lift** of $v$ in a ball $B\Subset\Omega$: $\overline v:=v$ on $\Omega\setminus B$, $\overline v:=$ the Poisson solution with boundary data $v|_{\partial B}$ in $B$.

**Supporting lemmas (★, know the statements):**
- **4.2**: $\max(u_1,u_2)$ of two subharmonic functions is subharmonic. (Immediate from the comparison definition.)
- **4.5**: the harmonic lift exists — *because the Dirichlet problem in a ball is solved explicitly by the Poisson formula (Thm. 3.2.5)*. Also $\overline v\ge v$ by subharmonicity.
- **4.6**: the harmonic lift is again subharmonic. (Case $B'\cap B=\emptyset$ trivial; otherwise use $v\le\overline v$, subharmonicity of $v$ on $B'$, and the weak maximum principle on $B\cap B'$ where both $\overline v$ and the comparison function are harmonic.)
- **4.7**: strong and weak maximum principle for subharmonic functions. Proof of the strong one: if $u$ is not constant, find a ball where $u|_{\partial B_r}$ is not constant while $u(y)=\sup u$; the harmonic lift satisfies $u(y)\le\overline u(y)\le\sup_{\partial B_r}\overline u=\sup_{\partial B_r}u$, and the maximum principle forces $\overline u$ constant on $B_r$ — contradiction.
- **4.8**: $v$ subharmonic, $u$ superharmonic, $v\le u$ on $\partial\Omega$ ⟹ either $v<u$ in $\Omega$ or $v\equiv u$ (and both are harmonic).

### 4.2 The Perron solution is harmonic (Thm. 4.3) — ★★★

**Hypotheses.** $\Omega$ bounded, $\varphi\in C^0(\partial\Omega)$ (bounded suffices). **No regularity of $\partial\Omega$ whatsoever.**

**Statement.** $u(x):=\sup_{v\in S_\varphi}v(x)$ is harmonic in $\Omega$.

**Proof sketch.**
1. *$u$ is bounded*: $\inf_{\partial\Omega}\varphi\le u\le\sup_{\partial\Omega}\varphi$ by Prop. 4.8 comparing with constants.
2. Fix $y\in\Omega$, take $v_n\in S_\varphi$ with $v_n(y)\to u(y)$; replace $v_n$ by $\max(v_1,\dots,v_n,\inf_{\partial\Omega}\varphi)$ to make the sequence **monotone and bounded** (still subsolutions, by 4.2).
3. Take harmonic lifts $\overline v_n$ in a fixed ball $B_r(y)\Subset\Omega$: still subsolutions, still monotone (weak max principle), and $v_n(y)\le\overline v_n(y)\le u(y)$, so $\overline v_n(y)\to u(y)$.
4. ▶ **Harnack's convergence theorem** (3.4.2) ⟹ $\overline v_n\rightrightarrows\tilde v$ harmonic in $B_r(y)$, with $\tilde v\le u$ and $\tilde v(y)=u(y)$.
5. *$\tilde v=u$ on $B_r(y)$*: if $\tilde v(x)<u(x)$ for some $x$, pick $s\in S_\varphi$ with $\tilde v(x)<s(x)$, run the same construction with $w_n=\max(s,v_n)$ to get harmonic $\tilde w$ with $\tilde v\le\tilde w\le u$ and $\tilde v(y)=\tilde w(y)=u(y)$. Then $\tilde v-\tilde w$ is harmonic $\le0$ with an interior maximum $0$ at $y$ ⟹ **strong maximum principle** ⟹ $\tilde v\equiv\tilde w$, contradicting $\tilde w(x)\ge s(x)>\tilde v(x)$.

**Role of hypotheses.**
- Boundedness of $\Omega$ / of $\varphi$: gives $S_\varphi\ne\emptyset$ and the two-sided bound in step 1 (needed for Harnack: the difference sequence must be bounded at a point).
- The proof uses **only** the maximum principle, the mean-value characterization and solvability on balls — that is why it needs **no boundary regularity**. This is the punchline: *the interior problem is always solvable; only the boundary condition can fail.*

### 4.3 Barriers, regular points, and attainment of the boundary values (Def. 4.10/4.12, Thm. 4.11, 4.13) — ★★★

**Barrier at $\xi\in\partial\Omega$:** $w\in C^0(\overline\Omega)$ with (i) $w$ superharmonic, (ii) $w>0$ on $\overline\Omega\setminus\{\xi\}$ and $w(\xi)=0$. A **local barrier** is the same on $\overline\Omega\cap B_\varepsilon(\xi)$. $\xi$ is a **regular** boundary point if a barrier exists at $\xi$.

**Thm. 4.11 (barrier is a local concept).** If there is a local barrier $w$ on $\overline\Omega\cap B_\varepsilon(\xi)$, then with $m:=\inf_{B_\varepsilon(\xi)\setminus B_{\varepsilon/2}(\xi)}w>0$ the function $\overline w=\min(w,m)$ inside $\Omega\cap B_{\varepsilon/2}(\xi)$ and $\overline w=m$ outside is a (global) barrier. *(Superharmonicity is preserved under $\min$ with a constant; the choice of $m$ makes the two definitions match on the overlap.)* **Why this matters:** regularity of a boundary point is a purely local, *geometric* property.

**Thm. 4.13.** If $\xi\in\partial\Omega$ is regular, then the Perron solution satisfies $\lim_{\Omega\ni x\to\xi}u(x)=\varphi(\xi)$.

**Proof sketch.** ▶ Squeeze $u$ between an explicit sub- and supersolution built from the barrier. With $M=\sup_{\partial\Omega}|\varphi|$ choose, for given $\varepsilon>0$, first $\delta>0$ with $|\varphi(x)-\varphi(\xi)|<\varepsilon$ on $B_\delta(\xi)\cap\partial\Omega$ (continuity of $\varphi$), then $k>0$ with $kw\ge2M$ on $\partial\Omega\setminus B_\delta(\xi)$ (possible since $w>0$ there and that set is compact). Then
$$u^\pm:=\varphi(\xi)\pm(\varepsilon+kw)$$
are super-/subsolutions dominating/dominated by $\varphi$ on all of $\partial\Omega$ — near $\xi$ because of $\varepsilon$, far from $\xi$ because of $kw\ge2M$. The maximum principle gives $\varphi(\xi)-\varepsilon-kw\le u\le\varphi(\xi)+\varepsilon+kw$; let $x\to\xi$ (so $w\to0$) and then $\varepsilon\to0$.

**Role of hypotheses.** The barrier provides *a function that detects the point $\xi$ and nothing else*: positivity away from $\xi$ lets you overpower the boundary data, vanishing at $\xi$ lets the estimate collapse to $\varphi(\xi)$. Continuity of $\varphi$ at $\xi$ is used for $\delta$; compactness of $\partial\Omega$ (i.e. $\Omega$ bounded) for $k$.

### 4.4 Solvability ⟺ all boundary points regular (Thm. 4.14) — ★★★

**Statement (equivalence).**
1. For every $\varphi\in C^0(\partial\Omega)$ the Dirichlet problem has a solution in $C^2(\Omega)\cap C^0(\overline\Omega)$.
2. Every boundary point of $\Omega$ is regular.

**Proof sketch.** "2⟹1" is Thm. 4.3 + 4.13. ▶ "1⟹2" is the slick direction: given $\xi\in\partial\Omega$, solve the Dirichlet problem with boundary data $\varphi(x)=\|x-\xi\|$ and call the solution $w$. Then $w$ is harmonic (hence superharmonic), $w(\xi)=0$, $w\ge0$; and $w>0$ inside, since $w(y)=0$ for an interior $y$ would be an interior minimum, forcing $w\equiv0$ by the strong maximum principle — contradicting $w|_{\partial\Omega\setminus\{\xi\}}>0$. So $w$ is a barrier.

**Also: Prop. 4.9.** If the Dirichlet problem has a solution, it *is* the Perron solution ($\tilde u\in S_\varphi$ gives $u\ge\tilde u$; then $u-\tilde u$ is harmonic with zero boundary values). So the method never produces a wrong answer.

### 4.5 Geometric sufficient conditions; the Lebesgue spine (Def. 4.15, Ex. 4.16) — ★★

**Sufficient conditions for regularity of $\xi$:**
- **$n=2$:** if a ray/slit $S$ with $\xi\in S$, $S\cap\Omega=\emptyset$ can be chosen locally, then $w(z)=-\operatorname{Re}\big(1/\ln z\big)$ (branch cut on $S$, $\xi=0$) is a local barrier: it is harmonic off the cut, and in polar coordinates $-\operatorname{Re}\frac1{\ln z}=-\frac{\ln r}{(\ln r)^2+(\varphi+2\pi n)^2}\to0$ as $r\to0$, locally uniformly in $\varphi$. **In the plane, essentially any boundary point that is not isolated is regular** — hence "one-dimensional obstacles suffice". (Alternative route: Riemann mapping theorem + solve in the disc.)
- **Exterior sphere condition** at $\xi$: there is a closed ball $K$ of radius $R$ with $K\cap\overline\Omega=\{\xi\}$. Barrier: $w(x)=-\Gamma(\|x-y\|)+\Gamma(\|\xi-y\|)$ with $y$ the center of $K$. It is harmonic in $\Omega$ (singularity at $y\notin\overline\Omega$), vanishes exactly at $\|x-y\|=R$ i.e. at $x=\xi$, and is positive elsewhere because $\Gamma$ is strictly monotone.
- **Exterior cone condition** (weaker, hence better): also gives barriers.

**Ex. 4.16 (Lebesgue spine, 1912).** Take in $\mathbb R^3$ the charge density supported on the segment $\{(x,0,0):0\le x\le1\}$ with density $-4\pi x$, and $u(x)=\int\Gamma(\|x-y\|)\varrho(y)$. With $\zeta=\sqrt{y^2+z^2}$ one computes $u(x,\zeta)=A(x,\zeta)-2x\ln\zeta$, where $A$ is continuous at the origin with $A\to1$, but $x\ln\zeta$ is **not** continuous at $0$: along $\zeta=|x|^\alpha$ it tends to $0$, along $\zeta=e^{-c/x}$ it tends to $-c$. Choosing the sublevel/level set $\{u=1+C\}$ as $\partial\Omega$ produces a domain with an infinitely sharp inward cusp ("spine") at the origin, and $u$ is harmonic in $\Omega$ with constant boundary values but is not continuous at the cusp tip. **Conclusion: the Dirichlet problem with continuous boundary data is not always solvable; the origin is an irregular boundary point.**

**Exam-ready summary of Ch. 4:** *Interior: always fine (Perron). Boundary: needs geometry. Sufficient: exterior sphere or cone. Necessary and sufficient: barriers/regularity. Failure: Lebesgue spine — the cusp is "too thin" for the exterior of $\Omega$ to be seen by a superharmonic function.*

---

## 5. Maximum principles for general elliptic $L$ (Ch. 5)

**Setting.** $u\in C^2(\Omega,\mathbb R)$,
$$Lu=a^{ij}(x)\partial_{ij}u+b^i(x)\partial_iu+c(x)u$$
with the two standing assumptions
- **(E) uniform ellipticity:** $\exists\lambda>0$ with $a^{ij}(x)\xi_i\xi_j\ge\lambda\|\xi\|^2$ for all $x\in\Omega,\xi\in\mathbb R^n$;
- **(B) uniformly bounded coefficients:** $|a^{ij}|,|b^i|,|c|\le K$.

### 5.0 The one-dimensional example (Ex. 5.1) — ★★★ (best possible answer to "why $c\le0$?")

$u''+cu=0$ on $(0,1)$, $u(0)=u(1)=0$.
- $c<0$: solutions $e^{\pm\sqrt{|c|}x}$; the boundary conditions force $u\equiv0$. Consistent with the maximum principle.
- $c>0$: solutions $\sin(\sqrt cx),\cos(\sqrt cx)$. For $c=\pi^2$, $u(x)=\sin(\pi x)$ solves the homogeneous Dirichlet problem, is non-trivial and has an **interior maximum**. The maximum principle is false; uniqueness for the Dirichlet problem fails.

**Have this example ready.** It explains, in one line, the sign condition in every theorem of Ch. 5, the condition $c\ge0$ in the divergence-form problem of Ch. 7 ($Lu=-\partial_i(a^{ij}\partial_ju)+cu$, note the sign flip from the divergence form!), and why "eigenvalues" are the obstruction to existence.

### 5.1 Weak maximum principle (Thm. 5.2) — ★★★

**Hypotheses.** $\Omega$ **bounded**; (E) and (B); **$c\equiv0$**; $u\in C^2(\Omega)\cap C^0(\overline\Omega)$; $Lu\ge0$ (subsolution) in $\Omega$.

**Statement.** $\sup_\Omega u=\sup_{\partial\Omega}u$ (and dually $\inf_\Omega u=\inf_{\partial\Omega}u$ if $Lu\le0$).

**Proof sketch.**
- **(a) Strict case $Lu>0$.** If the sup were attained at an interior $x_0$: there $\partial_iu(x_0)=0$ and $D^2u(x_0)\le0$ (negative semidefinite). For a positive definite $A$ and negative semidefinite $H$ one has $\operatorname{tr}(AH)=a^{ij}H_{ij}\le0$, so $Lu(x_0)=a^{ij}\partial_{ij}u(x_0)\le0$ — contradiction.
- **(b) General case $Lu\ge0$.** ▶ **Perturbation trick:** $L e^{\gamma x^1}=(\gamma^2a^{11}+\gamma b^1)e^{\gamma x^1}>0$ as soon as $\gamma>K/\lambda$, using $a^{11}\ge\lambda$ and $|b^1|\le K$. Then $L(u+\varepsilon e^{\gamma x^1})>0$, apply (a), and let $\varepsilon\searrow0$.

**Role of hypotheses.**
- **$c\equiv0$** (or $c\le0$, see 5.3): with $c>0$ the linear-algebra step fails because $cu(x_0)$ can be positive; Example 5.1(b) is the counterexample.
- **(E)**: strict positive definiteness is what makes $a^{ij}\partial_{ij}u\le0$ at a max — for a degenerate $A$ one only gets $\le0$ with equality possible, and more importantly $\gamma$ in step (b) could not be chosen ($\lambda=0$).
- **(B)**: bounds $b^1$ so that $\gamma$ can be chosen uniformly; this is where "uniformly bounded" is really needed.
- **$\Omega$ bounded**: compactness of $\overline\Omega$ ⟹ the sup is attained. Also $e^{\gamma x^1}$ must be bounded on $\Omega$ for the $\varepsilon\to0$ step.

### 5.2 The case $c\le0$ and the comparison principle (Cor. 5.3, Thm. 5.4) — ★★

**Cor. 5.3.** With $c\le0$ and $Lu\ge0$: $\sup_\Omega u\le\sup_{\partial\Omega}u^+$ (where $u^+=\max(u,0)$).
*Proof:* on $\Omega^+=\{u>0\}$ one has $L_0u\ge L_0u+cu=Lu\ge0$ with $L_0=L-c$ having no zero-order term, so Thm. 5.2 applies on $\Omega^+$; and $\partial\Omega^+\subseteq\partial\Omega\cup\{u=0\}$.
**Note the weakening:** with $c\le0$ you control only the *positive* part — the correct statement, since $c\le0$ tolerates e.g. $u<0$ interior minima.

**Thm. 5.4 (comparison).** $c\le0$, $u,v\in C^2(\Omega)\cap C^0(\overline\Omega)$, $Lu\ge Lv$ in $\Omega$, $u\le v$ on $\partial\Omega$ ⟹ $u\le v$ in $\Omega$. *Proof:* apply 5.3 to $u-v$. **Consequence: uniqueness for the Dirichlet problem for $L$ when $c\le0$.**

### 5.3 Hopf boundary point lemma (Lemma 5.6) — ★★★

**Hypotheses.** (E), (B), **$c\equiv0$**, $Lu\ge0$ in $\Omega$, and at a boundary point $x_0\in\partial\Omega$:
1. $u$ continuous at $x_0$;
2. $u(x_0)>u(x)$ for all $x\in\Omega$ (**strict** interior inequality);
3. the **interior sphere condition** at $x_0$: there is a ball $B=B_R(y)\subseteq\Omega$ with $x_0\in\partial B$.

**Statement.** If the outer normal derivative exists, then $\dfrac{\partial u}{\partial\nu}(x_0)>0$ — **strictly**.

**Proof sketch.** ▶ Build an explicit auxiliary function with a good sign of $L$ on an annulus. Put $r=\|x-y\|$ and
$$v(x)=e^{-\alpha r^2}-e^{-\alpha R^2}.$$
A direct computation gives
$$Lv=e^{-\alpha r^2}\Big(4\alpha^2a^{ij}(x-y)_i(x-y)_j-2\alpha\big(a^{ij}\delta_{ij}+b^i(x-y)_i\big)\Big).$$
On the annulus $B_R(y)\setminus B_\rho(y)$ (with $0<\rho<R$) the first bracket is $\ge4\alpha^2\lambda\rho^2$ and the second is $\le 2\alpha(n^2K+nKR)$, so for $\alpha$ **large enough** $Lv\ge0$ there.
Now: $v=0$ on $\partial B_R$; on $\partial B_\rho$ we have $u-u(x_0)<0$ (strictly, by hypothesis 2, and by compactness bounded away from $0$), so for small $\varepsilon>0$
$$u-u(x_0)+\varepsilon v\le0\ \text{on}\ \partial\big(B_R\setminus B_\rho\big),\qquad L\big(u-u(x_0)+\varepsilon v\big)\ge0 .$$
The **weak maximum principle** gives $u-u(x_0)+\varepsilon v\le0$ inside, with equality at $x_0$. Hence the outer normal derivative of the left side at $x_0$ is $\ge0$:
$$0\le\frac{\partial u}{\partial\nu}(x_0)+\varepsilon\frac{\partial v}{\partial\nu}(x_0),\qquad \frac{\partial v}{\partial\nu}(x_0)=v'(R)=-2\alpha Re^{-\alpha R^2}<0,$$
so $\partial_\nu u(x_0)>0$.

**Role of hypotheses.**
- **Interior sphere condition** gives the geometry on which the barrier $v$ is built; it fails at inward cusps/corners, and the lemma genuinely fails there.
- **Strict inequality $u(x_0)>u(x)$**: needed on $\partial B_\rho$ to absorb $\varepsilon v$. Without strictness only $\partial_\nu u\ge0$ (which is trivial anyway) survives — **the whole point of the lemma is the strict sign**.
- **Choosing $\alpha$ large** requires exactly (E) (to have $\lambda\rho^2>0$ in the good term) and (B) (to bound the bad term). Note the good term is quadratic in $\alpha$, the bad one linear — that is why large $\alpha$ wins.
- Excising $B_\rho$ is necessary: near $y$ the term $-2\alpha a^{ij}\delta_{ij}$ dominates and $Lv<0$ there.
- **$c\equiv0$**; with $c\le0$ one gets the same conclusion provided $u(x_0)\ge0$.

### 5.4 Hopf's strong maximum principle (Thm. 5.7) — ★★★

**Hypotheses.** $L$ uniformly elliptic with uniformly bounded coefficients, $c\equiv0$, $Lu\ge0$ in $\Omega$ ($\Omega$ **need not be bounded**), $u\in C^2(\Omega)$, $\Omega$ connected.

**Statement.** If $u$ attains a maximum in $\Omega$, then $u$ is constant. For $c\le0$: $u$ cannot attain a **non-negative** maximum (resp. non-positive minimum) unless it is constant.

**Proof sketch.** ▶ Reduce to the boundary lemma. Suppose $u\le M$, $M$ attained, $u\not\equiv M$. Then $\Omega^-:=\{u<M\}\ne\emptyset$ and $\partial\Omega^-\cap\Omega\ne\emptyset$. Pick $x_0\in\Omega^-$ close enough to $\partial\Omega^-\cap\Omega$ so that the largest ball $B=B_R(x_0)$ contained in $\Omega^-$ satisfies $\overline B\subseteq\Omega$; by maximality $\partial B$ touches $\partial\Omega^-$ at some $y$ with $u(y)=M$. Apply Lemma 5.6 to the domain $\Omega^-$ and the boundary point $y$: all three hypotheses hold (continuity since $u\in C^2$; $u(y)=M>u$ in $\Omega^-$; interior sphere by construction). Hence $\partial_\nu u(y)>0$. But $y$ is an interior maximum of $u$ in $\Omega$, so $Du(y)=0$ — contradiction.

**Role of hypotheses.**
- **Connectedness** (as in 3.3.2).
- **$c\le0$ and the sign of the extremum**: for $c\le0$ one only excludes non-negative maxima, because $cu\le 0$ helps only when $u\ge0$. Ex. 5.1(b) again shows what happens for $c>0$.
- $\Omega$ **not** required bounded here — because we never need a boundary; the weak principle is applied only on the small annulus inside Lemma 5.6.
- The script's remark that this "generalizes Liouville's theorem" is a nice thing to comment on: a bounded harmonic function on $\mathbb R^n$ attaining its supremum is constant; Liouville additionally handles the case where the sup is not attained.

---

## 6. Sobolev spaces (Ch. 6)

**Why this chapter exists.** Write $L$ in **divergence form** $Lu=\partial_i(a^{ij}\partial_ju)+\tilde b^j\partial_ju+cu$ and test against $\eta\in C^\infty_0(\Omega)$; after one integration by parts (boundary terms vanish!)
$$0=\int_\Omega\Big(-a^{ij}(\partial_ju)(\partial_i\eta)+\tilde b^i(\partial_iu)\eta+cu\eta\Big)d^nx .$$
This makes sense for $u$ with merely **one weak derivative in $L^2$**. Divergence form is also exactly what variational methods produce. The price: we must build the function spaces.

### 6.1 Hölder spaces (6.1.1, 6.1.2) — ★

$\|u\|_{C^{0,\alpha}(\Omega)}=\|u\|_{C^0}+\sup_{x\ne y}\frac{\|u(x)-u(y)\|}{\|x-y\|^\alpha}$; $C^{k,\alpha}=\{u\in C^k: D^\beta u\in C^{0,\alpha}\ \forall|\beta|\le k\}$. $C^{0,0}$ = bounded continuous, $C^{0,1}$ = bounded Lipschitz. $(C^{k,\alpha},\|\cdot\|_{k,\alpha})$ is a **Banach space** (Cauchy in $C^{k,\alpha}$ ⟹ Cauchy in $C^k$ ⟹ uniform limits exist; then the difference quotients converge as well). Standard example: $\sqrt{|x|}\in C^{0,1/2}[-1,1]$.

### 6.2 Mollification (6.2.1–6.2.4) — ★★ (technique, used everywhere)

$\eta\in C^\infty_0(B_1(0))$, $\eta\ge0$, $\int\eta=1$; $\eta_\varepsilon(x)=\varepsilon^{-n}\eta(x/\varepsilon)$; $u_\varepsilon=\eta_\varepsilon*u$.

- **6.2.1**: for $u\in L^1_{\rm loc}(\Omega)$, $u_\varepsilon\in C^\infty(\Omega')$ for every $\Omega'\Subset\Omega$ (differentiate under the integral; justified by dominated convergence).
- **6.2.2**: $u\in C^0$ ⟹ $u_\varepsilon\to u$ **locally uniformly** (uses uniform continuity on compacts and $\int\eta=1$).
- **6.2.3**: $u\in L^p_{\rm loc}$ ⟹ $u_\varepsilon\to u$ in $L^p_{\rm loc}$ ($1\le p<\infty$). ▶ Two ingredients: (a) the *uniform bound* $\|u_\varepsilon\|_{L^p(\Omega')}\le\|u\|_{L^p(\Omega'')}$, proved by writing $u_\varepsilon(x)=\int u(x+\varepsilon z)\,d\varrho$ with the probability measure $d\varrho=\eta\,dz$ and applying **Hölder** plus Fubini; (b) approximation by a continuous $\omega$ (Urysohn/density) plus 6.2.2, in the standard $3\varepsilon$-pattern.
- **6.2.4**: consequently $C^\infty(\Omega)$ is dense in $L^p_{\rm loc}$, and $C^\infty_0(\Omega)$ is dense in $L^p(\Omega)$ for $1\le p<\infty$.

**Where the hypotheses bite:** $p<\infty$ (mollification does **not** converge in $L^\infty$ — the limit would have to be continuous); $\Omega'\Subset\Omega$ with $\operatorname{dist}(\Omega',\partial\Omega)>\varepsilon$, otherwise $u_\varepsilon$ would need values of $u$ outside $\Omega$.

### 6.3 Weak derivatives and Sobolev spaces (6.3.1–6.3.7) — ★★★ (definitions must be instant)

**Weak derivative.** $u\in L^1_{\rm loc}$ is the $\alpha$-th weak derivative of $v\in L^1_{\rm loc}$ iff $\int v\,(-1)^{|\alpha|}D^\alpha\eta=\int u\,\eta$ for all $\eta\in C^\infty_0(\Omega)$. (Same formula as the distributional derivative, but with fewer test functions and the requirement that the result be a *function*.)

**$H^{k,p}(\Omega)$** $=\{u\in L^1_{\rm loc}: D^\alpha u\text{ exists weakly and lies in }L^p,\ |\alpha|\le k\}$ with $\|u\|_{H^{k,p}}=\big(\sum_{|\alpha|\le k}\|D^\alpha u\|_{L^p}^p\big)^{1/p}$; for $p=2$ a Hilbert space with $\langle u,v\rangle=\sum_{|\alpha|\le k}\int D^\alpha uD^\alpha v$.

- **6.3.3 (Completeness).** $H^{k,p}$ is a Banach space (Hilbert for $p=2$). *Proof:* $L^p$-completeness gives limits $v^\alpha$ of $D^\alpha u_n$; pass to the limit in the defining identity, legal because $L^p$-convergence implies $L^1_{\rm loc}$-convergence (this uses $\eta$ compactly supported).
- **6.3.4.** Mollification commutes with weak differentiation: $(D^\alpha u)_\varepsilon=D^\alpha u_\varepsilon$ on $\Omega'$ with $\operatorname{dist}(\Omega',\partial\Omega)>\varepsilon$. *Proof:* move $D^\alpha$ from $x$ to $y$ inside $\eta_\varepsilon(x-y)$ (sign $(-1)^{|\alpha|}$) and use the definition of the weak derivative. **This is the workhorse lemma of the chapter.**
- **6.3.5 (Meyers–Serrin, "$H=W$").** $C^\infty(\Omega)\cap H^{k,p}(\Omega)$ is **dense** in $H^{k,p}(\Omega)$, for *any* open $\Omega$. ▶ *Proof:* exhaust $\Omega$ by $\Omega_n\Subset\Omega_{n+1}$, set $A_n=\Omega_{n+1}\setminus\overline\Omega_{n-1}$ (a locally finite open cover), take a subordinate partition of unity $\varphi_n$, mollify each $\varphi_nu$ at a scale $\varepsilon_n$ so small that $\|(\varphi_nu)_{\varepsilon_n}-\varphi_nu\|_{H^{k,p}}\le\delta2^{-n}$, and sum. The sum is locally finite, hence smooth.
  **Note what is *not* claimed:** $C^\infty(\overline\Omega)$-density, and *not* $C^\infty_0(\Omega)$-density — the latter is false in general.
- **6.3.6.** $H^{k,p}_0(\Omega):=\overline{C^\infty_0(\Omega)}^{H^{k,p}}$ — the space encoding **zero Dirichlet boundary values**.
- **6.3.7 (calculus rules).** (i) $D^\alpha u\in H^{k-|\alpha|,p}$; (ii) restriction to $\Omega'\subseteq\Omega$; (iii) **Leibniz rule** for $u\in H^{k,p}$, $v\in C^\infty_0$: $D^\alpha(vu)=\sum_{\beta\le\alpha}\binom\alpha\beta D^\beta v\,D^{\alpha-\beta}u$ — *warning:* a product of two $H^{k,p}$ functions need not be $H^{k,p}$; (iv) **chain rule** $D(f\circ u)=f'(u)Du$ for $f\in C^1$ with $f'\in L^\infty$. *Proof of (iv)* by approximation $u_n\to u$ in $H^{1,1}_{\rm loc}$: the boundedness $\|f'\|_\infty<\infty$ gives the Lipschitz estimate $|f(u_n)-f(u)|\le\|f'\|_\infty|u_n-u|$, and $f'(u_n)\to f'(u)$ a.e. plus dominated convergence handles the right-hand side.
  **Hypotheses matter:** $f'\in L^\infty$ cannot be dropped (otherwise $f\circ u$ need not even be in $L^1_{\rm loc}$); $f\in C^1$ can be relaxed to Lipschitz (needed later for $\max(u,k)$ — see Lemma 12.2.3, where exactly this approximation is carried out).

### 6.4 Trace theorem (6.4.1, 6.4.2) — ★★★

**Hypotheses.** $\Omega\subseteq\mathbb R^n$ **bounded** with **$C^1$ boundary**; $1\le p<\infty$.

**Statement (6.4.1).** There is a unique bounded linear operator $T:H^{1,p}(\Omega)\to L^p(\partial\Omega)$ with $Tu=u|_{\partial\Omega}$ for all $u\in H^{1,p}(\Omega)\cap C^0(\overline\Omega)$, and
$$\|Tu\|_{L^p(\partial\Omega)}\le K\,\|u\|_{H^{1,p}(\Omega)} .$$

**Proof sketch.**
1. **Flat piece.** Assume $u\in C^1(\overline\Omega)$ and $\partial\Omega$ locally a hyperplane, $U\cap\Omega=U\cap\mathbb R^n_+$. Take a cutoff $\eta\in C^\infty_0(B_{2r}(y))$, $\eta\equiv1$ on $B_r(y)$, $\eta\ge0$. ▶ **Write the boundary integral as a bulk integral:**
$$\int_\Gamma|u(\tilde x,0)|^p\,d^{n-1}\tilde x\le\int_{\mathbb R^{n-1}}\eta|u|^p =-\int_{\mathbb R^n_+}\partial_n\big(\eta|u|^p\big)\,d^nx=\int_{\mathbb R^n_+}\Big(-\partial_n\eta\,|u|^p-\eta\,p\,|u|^{p-1}\operatorname{sgn}(u)\partial_nu\Big).$$
2. **Young's inequality** $ab\le\frac{a^p}p+\frac{b^q}q$ turns $|u|^{p-1}|\partial_nu|$ into $\frac{|\partial_nu|^p}p+\frac{|u|^p}q$, giving $\int_\Gamma|u|^p\le C\|u\|^p_{H^{1,p}(\Omega)}$.
3. **General $\Omega$:** finitely many charts (compactness of $\partial\Omega$), partition of unity; the Jacobians $|\det\partial\varphi/\partial\tilde x|$ are bounded because $\partial\Omega$ is $C^1$ and compact.
4. **Density:** $C^1(\overline\Omega)$ is dense in $H^{1,p}(\Omega)$, so $Tu:=\lim Tu_n$ is well defined and the bound passes to the limit.

**Role of hypotheses / what to say when pushed.**
- **$C^1$ boundary**: needed to flatten and to bound the Jacobians. For Lipschitz domains the theorem still holds, for arbitrary open sets it does not (there may be no sensible $\partial\Omega$-measure).
- **Boundedness**: finitely many charts, and $C^1(\overline\Omega)\subseteq H^{1,p}(\Omega)$.
- **$u\in H^{1,p}$, not $L^p$**: the trace of an $L^p$ function is meaningless — $\partial\Omega$ is a null set. Exactly one weak derivative is the minimum that makes restriction continuous. This is the honest content of the theorem: *"$u|_{\partial\Omega}$ makes sense for Sobolev functions, but only because $Du\in L^p$."*
- $T$ is **not surjective** onto $L^p(\partial\Omega)$ (the sharp image is the fractional space $W^{1-1/p,p}$) and **not injective** on $H^{1,p}$ — 6.4.2 identifies its kernel:

**Thm. 6.4.2.** $\Omega$ bounded, $1\le p<\infty$: $u\in H^{1,p}_0(\Omega)\iff Tu=0$.
"⟹" is one line (approximate by $C^\infty_0$, whose traces vanish, and use continuity of $T$); "⟸" is technical (Evans). **This is the theorem that legitimizes "$H^{1,p}_0$ = zero boundary values".**

### 6.5 Gagliardo–Nirenberg–Sobolev inequality (Thm. 6.5.1) — ★★★

**Hypotheses.** $1\le p<n$; $u\in C^1_0(\mathbb R^n)$ (compact support!).

**Statement.** With the **Sobolev conjugate** $p^*=\frac{np}{n-p}$, i.e. $\frac1{p^*}=\frac1p-\frac1n$,
$$\|u\|_{L^{p^*}(\mathbb R^n)}\le c\,\|Du\|_{L^p(\mathbb R^n)},\qquad c=\frac{p(n-1)}{n-p}.$$

**Where $p^*$ comes from (always start here — it is a 30-second derivation).** Set $u_\lambda(x)=u(\lambda x)$. Then $\|Du_\lambda\|_{L^p}=\lambda^{1-n/p}\|Du\|_{L^p}$ and $\|u_\lambda\|_{L^q}=\lambda^{-n/q}\|u\|_{L^q}$. An inequality of the form $\|u\|_{L^q}\le c\|Du\|_{L^p}$ can only hold for all $\lambda$ if the powers agree: $1-\frac np=-\frac nq$, i.e. $\frac1q=\frac1p-\frac1n$.

**Proof sketch.**
1. **Case $p=1$** ($p^*=\frac n{n-1}$). By the fundamental theorem of calculus in the $i$-th direction, $|u(x)|\le\int_{\mathbb R}|Du|\,dy_i$ for each $i$; multiply the $n$ estimates and take the $\frac1{n-1}$ power:
$$|u(x)|^{\frac n{n-1}}\le\prod_{i=1}^n\Big(\int_{\mathbb R}\|Du\|\,dy_i\Big)^{\frac1{n-1}} .$$
▶ Now integrate in $x_1$, pull out the factor that does not depend on $x_1$, and apply the **generalized Hölder inequality** (Lemma 6.5.2) with $n-1$ exponents all equal to $n-1$. Iterate over $x_2,\dots,x_n$. Result: $\|u\|_{L^{n/(n-1)}}\le\|Du\|_{L^1}$.
2. **General $1<p<n$:** apply case 1 to $v:=|u|^c$ with $c=\frac{(n-1)p}{n-p}$ chosen so that $\frac{n}{n-1}c=p^*$, then estimate $\int|Dv|\le c\int|u|^{c-1}|Du|$ by Hölder with exponents $\tilde q=\frac{p^*}{c-1}$ and $p$. Arithmetic gives the exponent $\frac{n-1}n-\frac{p-1}p=\frac1{p^*}$, and the constant $c=\frac{p(n-1)}{n-p}$.

**Role of hypotheses.**
- **Compact support** is essential: for $u\equiv\text{const}\ne0$ the right side vanishes and the left does not. On $H^{1,p}(\Omega)$ without boundary conditions one must use the full norm (Thm. 6.5.3).
- **$p<n$**: at $p=n$ the constant $\frac{p(n-1)}{n-p}$ blows up and $p^*=\infty$; indeed $H^{1,n}\not\hookrightarrow L^\infty$ (borderline case, $\log\log$ counterexamples). For $p>n$ you get Morrey instead.
- Homogeneity: the inequality is *scale invariant* by construction — a good sanity check to mention.

**Thm. 6.5.3 (version on domains).** $\Omega$ bounded with $C^1$ boundary ⟹ $\|u\|_{L^{p^*}(\Omega)}\le C\|u\|_{H^{1,p}(\Omega)}$ for all $u\in H^{1,p}(\Omega)$. *Proof:* an **extension operator** $A:C^1(\overline\Omega)\to C^1_0(\Omega')$ with $\|Au\|_{H^{1,p}(\Omega')}\le c\|u\|_{H^{1,p}(\Omega)}$ (this is where $C^1$ boundary and boundedness are used), then apply 6.5.1. Full norm on the right, because there are no boundary conditions.

### 6.6 Poincaré inequality (Thm. 6.5.4, Cor. 6.5.5) — ★★★

**Hypotheses.** $\Omega$ **bounded** open, $1\le p<\infty$, $1\le q\le p^*$, and **$u\in H^{1,p}_0(\Omega)$**.

**Statement.** $\|u\|_{L^q(\Omega)}\le C(\Omega)\,\|Du\|_{L^p(\Omega)}$.

**Proof sketch.** For $u_k\in C^1_0(\Omega)$ with $u_k\to u$ in $H^{1,p}_0$, extend by zero to $\mathbb R^n$ and apply GNS: $\|u_k\|_{L^{p^*}}\le c\|Du_k\|_{L^p}$; the sequence is Cauchy in $L^{p^*}$, so the estimate passes to the limit. Then Hölder with $s=p^*/q\ge1$ (**finite measure!**) gives $\|u\|_{L^q}\le\mu(\Omega)^{1/r}\|u\|_{L^{p^*}}$.

**Corollary 6.5.5.** On $H^{1,p}_0(\Omega)$ ($\Omega$ bounded, $p<n$), $\|Du\|_{L^p}$ is a **norm equivalent to $\|\cdot\|_{H^{1,p}}$**.

**Role of hypotheses (ask yourself this before the exam):**
- **Zero boundary values** ($H^{1,p}_0$): constants are the counterexample otherwise. On $H^{1,p}(\Omega)$ one needs the mean-value version $\|u-\bar u\|_{L^p}\le C\|Du\|_{L^p}$ (not proved in this lecture).
- **Bounded $\Omega$**: used twice — for $\mu(\Omega)<\infty$ in the Hölder step, and morally because $C(\Omega)$ scales like $\operatorname{diam}(\Omega)$. On $\Omega=\mathbb R^n$ Poincaré is false (only the scale-invariant GNS survives).
- **Why it is the key inequality of Ch. 7:** it converts the ellipticity bound $\int a^{ij}\partial_iu\partial_ju\ge\lambda\|Du\|^2_{L^2}$ into **coercivity with respect to the full $H^{1,2}$ norm**, without which the direct method fails.

### 6.7 Morrey inequality and Hölder representative (Thm. 6.6.1, 6.6.2) — ★★★

**Hypotheses.** $n<p\le\infty$; $u\in C^1(\mathbb R^n)\cap H^{1,p}(\mathbb R^n)$; $\gamma:=1-\frac np\in(0,1)$.

**Statement.** $\|u\|_{C^{0,\gamma}(\mathbb R^n)}\le C(n,p)\,\|u\|_{H^{1,p}(\mathbb R^n)}$.

**Proof sketch (three steps — this is a favourite blackboard proof).**
1. **Mean oscillation estimate:** $\displaystyle\rlap{\,\text{--}}\!\int_{B_r(x)}|u(x)-u(y)|\,d^ny\le C_1(n)\int_{B_r(x)}\frac{\|Du(y)\|}{\|x-y\|^{n-1}}\,d^ny$.
 *Proof:* $|u(x+sw)-u(x)|\le\int_0^s\|Du(x+tw)\|dt$ for a unit vector $w$; integrate over $w\in\partial B_1(0)$, substitute $z=x+tw$ (Jacobian $t^{n-1}$, which produces the Riesz kernel $\|x-z\|^{1-n}$), then multiply by $s^{n-1}$ and integrate in $s$ and divide by $r^n$.
2. **$L^\infty$ bound:** $|u(x)|\le\rlap{\,\text{--}}\!\int_{B_1(x)}|u(x)-u(y)|+\rlap{\,\text{--}}\!\int_{B_1(x)}|u(y)|$; apply step 1 and **Hölder**. The kernel is integrable exactly when $(n-1)q<n$ with $\frac1p+\frac1q=1$, i.e. **iff $p>n$**. ⟹ $\|u\|_{C^0}\le C_4\|u\|_{H^{1,p}}$.
3. **Hölder seminorm:** for $x,y$ with $r=\|x-y\|$ use the lens $W=B_r(x)\cap B_r(y)$, whose volume is a fixed fraction of $\mu(B_r)$ (scale-invariant!), split $|u(x)-u(y)|\le\rlap{\,\text{--}}\!\int_W|u(x)-u(z)|+\rlap{\,\text{--}}\!\int_W|u(z)-u(y)|$, apply steps 1 and Hölder:
$$\int_{B_r(x)}\|x-z\|^{-(n-1)\frac p{p-1}}d^nz=C_7(n)\,r^{\frac{p-n}{p-1}}\ \Longrightarrow\ |u(x)-u(y)|\le C_9\,r^{1-\frac np}\|Du\|_{L^p}.$$

**Role of hypotheses.**
- **$p>n$** is used *exactly once but decisively*: it is the integrability threshold of the Riesz kernel $\|x-y\|^{1-n}$ in step 2/3. At $p=n$, $\gamma=0$ and the estimate degenerates.
- The exponent $\gamma=1-n/p$ can again be guessed by scaling.
- **$u\in C^1$** in 6.6.1 is a technical convenience; 6.6.2 removes it:

**Thm. 6.6.2 (Hölder continuous representative).** $\Omega$ bounded with $C^1$ boundary, $n<p\le\infty$, $u\in H^{1,p}(\Omega)$ ⟹ $u$ has a representative $u^*\in C^{0,\gamma}(\overline\Omega)$, $\gamma=1-\frac np$, with $\|u^*\|_{C^{0,\gamma}}\le c\|u\|_{H^{1,p}}$.
*Proof:* extend and approximate by $u_m\in C^1_0(\mathbb R^n)$; Morrey makes $(u_m)$ Cauchy in $C^{0,\gamma}(\overline\Omega)$, which is complete (6.1.2). **Emphasize the conceptual point:** an inequality like $|u(x)|\le c\|u\|_{H^{1,p}}$ is meaningless for an *equivalence class*; the theorem says the class contains a (unique) continuous member.

---

## 7. Existence of weak solutions, Dirichlet principle (Ch. 7)

**Setting.** $\Omega\subseteq\mathbb R^n$ bounded, smooth boundary, $n>2$;
$$Lu=-\partial_i\big(a^{ij}(x)\partial_ju\big)+c(x)u,$$
with
- **uniform ellipticity** $a^{ij}\xi_i\xi_j\ge\lambda\|\xi\|^2$,
- **bounded (smooth) coefficients** $|a^{ij}|,|c|\le K$,
- **$c\ge0$** (used in 7.1.1 — with this sign convention $-\partial_i(a^{ij}\partial_j\cdot)+c$ corresponds to $c\le0$ in the Ch. 5 convention!),
- **no first-order term.**

**Reduction to zero boundary data.** If $u|_{\partial\Omega}=u_0$ and $v\in C^\infty(\overline\Omega)$ with $v|_{\partial\Omega}=u_0$, set $\tilde u=u-v$: then $L\tilde u=f-Lv=:\tilde f$ and $\tilde u|_{\partial\Omega}=0$. So WLOG $u|_{\partial\Omega}=0$, i.e. $u\in H^{1,2}_0(\Omega)$.

**The action.**
$$S(u):=\int_\Omega\Big(a^{ij}(\partial_iu)(\partial_ju)+c\,u^2-2fu\Big)d^nx,\qquad S:H^{1,2}_0(\Omega)\to\mathbb R .$$
All three terms are finite on $H^{1,2}_0$: the first two by boundedness of $a^{ij},c$, the third by Cauchy–Schwarz plus $\|u\|_{L^2}\le\|u\|_{H^{1,2}}$.

### 7.1 The action is bounded below (Thm. 7.1.1) — ★★

**Hypotheses.** As above; crucially **uniform ellipticity**, **$c\ge0$**, **$f\in L^2(\Omega)$**, **$\Omega$ bounded** (for Poincaré).

**Statement.** $S(u)\ge-K_0$ for all $u\in H^{1,2}_0(\Omega)$, with $K_0=\frac{c_P^2}{4\lambda}\|f\|^2_{L^2}$.

**Proof sketch.** Ellipticity: $a^{ij}\partial_iu\partial_ju\ge\lambda\|Du\|^2$; $c\ge0$ kills the middle term; **Poincaré** $\|u\|_{L^2}\le c_P\|Du\|_{L^2}$ converts $\int\lambda\|Du\|^2$ into $\frac{\lambda}{c_P^2}\|u\|^2_{L^2}$; then complete the square in $\|u\|_{L^2}$ against $\|f\|_{L^2}\|u\|_{L^2}$.

**Role of hypotheses.** Drop **$c\ge0$** and the statement is false in general (Ex. 5.1(b): with $c=-\pi^2$ in this convention the quadratic form has a zero eigenvalue, and slightly beyond that $S$ is unbounded below). Drop **Poincaré** (i.e. unbounded $\Omega$ or no boundary condition) and the completed square has nothing to control $\|u\|_{L^2}$ with. This theorem is *the* place where all three structural assumptions meet.

### 7.2 Euler–Lagrange equation (Thm. 7.1.2) — ★★

**Hypotheses.** $u\in H^{1,2}_0(\Omega)$ with $S(u)=\inf_{H^{1,2}_0}S$.

**Statement.** For all $\eta\in C^\infty_0(\Omega)$ (hence, by density, all $\eta\in H^{1,2}_0$):
$$\int_\Omega\Big(a^{ij}(\partial_iu)(\partial_j\eta)+cu\eta-f\eta\Big)d^nx=0,$$
i.e. $u$ is a **weak solution** of $Lu=f$.

**Proof sketch.** $S(u+\tau\eta)=\tau^2\big[\dots\big]+2\tau\big[\dots\big]+S(u)$ is a **quadratic polynomial in $\tau$** with a minimum at $\tau=0$; hence the linear coefficient vanishes. (No differentiability issues — this is why the quadratic structure is so convenient.)

**Role of hypotheses.** Nothing beyond minimality and quadratic structure. Remark to make: for $u\in C^2$ one may integrate by parts back and obtain $\int(Lu-f)\eta=0$ for all $\eta$, hence $Lu=f$ pointwise — so "weak solution + regularity = classical solution", which is exactly the programme of Ch. 11.

### 7.3 Existence and uniqueness of the minimizer (Thm. 7.2.2, Cor. 7.2.3) — ★★★

**Hypotheses.**
- $(H,\langle\cdot,\cdot\rangle)$ a **Hilbert space** (completeness!),
- $V\subseteq H$ **closed** and **convex**, $V\ne\emptyset$,
- $A:H\times H\to\mathbb R$ bilinear, **symmetric**, **continuous** ($|A(u,v)|\le\|A\|\|u\|\|v\|$), **coercive** ($A(u,u)\ge\lambda\|u\|^2$, $\lambda>0$),
- $l:H\to\mathbb R$ linear and continuous.

**Statement.** $S(u)=A(u,u)+l(u)$ has a **unique** minimizer in $V$.

**Proof sketch.** ▶ *The direct method, made to work by the parallelogram-type identity.*
1. Bounded below: $S(v)\ge\lambda\|v\|^2-\|l\|\|v\|\ge-\frac{\|l\|^2}{2\lambda}$ (complete the square) — this is coercivity.
2. Take a minimizing sequence $u_n\in V$, $S(u_n)\to\kappa=\inf_VS$. **Convexity** gives $\frac12(u_n+u_m)\in V$, so
$$\kappa\le S\Big(\frac{u_n+u_m}2\Big)=\frac12S(u_n)+\frac12S(u_m)-\frac14A(u_n-u_m,u_n-u_m).$$
(Expand using bilinearity + symmetry; the $l$ terms are linear and combine exactly.)
3. Hence $A(u_n-u_m,u_n-u_m)\le2S(u_n)+2S(u_m)-4\kappa\to0$, and **coercivity** gives $\|u_n-u_m\|^2\le\frac1\lambda A(u_n-u_m,\cdot)\to0$: Cauchy.
4. **Completeness of $H$ + closedness of $V$** ⟹ $u_n\to u\in V$; **continuity** of $A,l$ ⟹ $S(u)=\kappa$.
5. Uniqueness: run step 2 with two minimizers to get $A(u_1-u_2,u_1-u_2)\le0$, so $u_1=u_2$ by coercivity.

**Role of hypotheses — the exam checklist.**
| Hypothesis | Used for | Fails if dropped |
|---|---|---|
| coercive | lower bound + Cauchy estimate | $S$ may be unbounded below or minimizing sequences may not converge |
| symmetric + bilinear | the identity in step 2 | (for non-symmetric $A$ use Lax–Milgram instead of minimization — there is no functional to minimize) |
| continuous | passing to the limit in step 4 | limit need not be a minimizer |
| $V$ convex | $\frac12(u_n+u_m)\in V$ | step 2 collapses |
| $V$ closed, $H$ complete | limit exists in $V$ | classic failure of the direct method (Weierstrass' counterexample) |

**Corollary 7.2.3.** If in addition $V$ is a **closed linear subspace**, there is a unique $u\in V$ with $2A(u,\varphi)+l(\varphi)=0$ for all $\varphi\in V$. *(This is the symmetric case of Lax–Milgram / a Riesz representation statement.)* Proof: differentiate the polynomial $\tau\mapsto S(u+\tau\varphi)$ at $\tau=0$; note that linearity of $V$ is needed so that $u+\tau\varphi\in V$ for **both** signs of $\tau$.

**Application (the punchline of Ch. 7).** With $H=V=H^{1,2}_0(\Omega)$,
$$A(u,v)=\int_\Omega\big(a^{ij}(\partial_iu)(\partial_jv)+cuv\big),\qquad l(u)=-2\int_\Omega fu,$$
$A$ is coercive by **uniform ellipticity + Poincaré**:
$$A(u,u)\ge\lambda\|Du\|_{L^2}^2=\tfrac\lambda2\|Du\|^2_{L^2}+\tfrac\lambda2\|Du\|^2_{L^2}\ge\tfrac\lambda2\|Du\|^2+\tfrac{\lambda}{2c_P^2}\|u\|^2\ge\tilde c\,\|u\|^2_{H^{1,2}_0}.$$
Hence: **the Dirichlet problem $Lu=f$, $u|_{\partial\Omega}=0$ has a unique weak solution in $H^{1,2}_0(\Omega)$.** Say this sentence in the exam; it is the main theorem of the first half of the course.

---

## 8. Convex variational problems (Ch. 8)

Now the action is genuinely nonlinear: $S(u)=\int_\Omega f(x,Du)\,d^nx$ on $H^{1,2}_0(\Omega)$, $\Omega$ bounded with smooth boundary. The quadratic tricks of Ch. 7 are gone; convexity replaces them.

### 8.1 Existence of a minimizer (Thm. 8.1) — ★★★

**Hypotheses on $f:\Omega\times\mathbb R^n\to\mathbb R$.**
1. **Measurability:** $f(\cdot,v)$ measurable for each $v\in\mathbb R^n$;
2. **Convexity:** $f(x,\cdot)$ convex on $\mathbb R^n$ for each $x$;
3. **Coercivity:** $\exists\kappa>0$, $\gamma\in L^1(\Omega)$ with $f(x,v)\ge-\gamma(x)+\kappa\|v\|^2$.
Plus: $\Omega$ bounded (Poincaré), $S\not\equiv\infty$.

**Statement.** $S$ attains its minimum on $H^{1,2}_0(\Omega)$: $\exists u_0$ with $S(u_0)=\inf_{H^{1,2}_0}S$.

**Proof sketch.**
1. **Bounded below:** $S(y)\ge\int(-\gamma+\kappa\|Dy\|^2)\ge-\|\gamma\|_{L^1}$; combined with **Poincaré**, $\|y\|^2_{H^{1,2}_0}\le\frac{C(\Omega)}\kappa\big(S(y)+\|\gamma\|_{L^1}\big)$, i.e. $S(y)\ge\frac{\kappa}{C(\Omega)}\|y\|_{H^{1,2}_0}-\tilde C$. So sublevel sets are bounded.
2. **$S$ is convex and lower semicontinuous** (Lemmas 8.2–8.4).
3. Apply the abstract Thm. 8.5 to $S_\lambda(y)=S(y)+\lambda\|u-y\|^2$: each $S_\lambda$ has a unique minimizer $u_\lambda$, and the bound in step 1 shows $\|u_\lambda\|$ stays bounded as $\lambda\searrow0$ (because $S_\lambda(u_\lambda)\le S_\lambda(u)=S(u)$). Hence $u_0=\lim_{\lambda\searrow0}u_\lambda$ exists and minimizes $S$.

**Role of hypotheses.**
- **Coercivity** does two jobs: bounds $S$ below, and keeps minimizing sequences bounded in $H^{1,2}_0$ (via Poincaré). Without it, minimizing sequences run off to infinity.
- **Convexity** is what gives *lower semicontinuity* (via Fatou below) and the parallelogram estimate in Thm. 8.5. **Without convexity, existence genuinely fails**: the classical example is $f(x,v)=(\|v\|^2-1)^2$ on $\Omega=(0,1)$ with zero boundary data — the infimum $0$ is approached by finer and finer sawtooth functions with $|u'|=1$, but no $H^{1,2}_0$ function attains it. The minimizing sequence *oscillates*: it converges weakly to $0$ but $S(0)>0$. This is the standard picture to draw.
- **Convexity is also what gives uniqueness** (strict convexity, really); the script's Fig. 8.1 makes exactly this point.
- **Measurability** of $f(x,\cdot)$ + continuity in $v$ (automatic for convex functions!) make $x\mapsto f(x,Du(x))$ measurable — small but necessary (Lemma 8.2 does this carefully via $g(x,y)=f(x,v(y))$ and the diagonal injection).

### 8.2 Lower semicontinuity (Lemma 8.2/8.3/8.4) — ★★

**Statement.** $J(v)=\int_\Omega f(x,v(x))$ is convex and **lower semicontinuous** on $L^2(\Omega,\mathbb R^n)$: $v_k\to v$ in $L^2$ ⟹ $J(v)\le\liminf J(v_k)$. Consequently $S(u)=J(Du)$ is convex and l.s.c. on $H^{1,2}_0(\Omega)$.

**Proof sketch.** ▶ **Fatou, applied to the shifted integrand.** $L^2$-convergence gives a.e. convergence (subsequence), and $f(x,\cdot)$ is continuous (convex ⟹ continuous), so $f(x,v_k)-\kappa\|v_k\|^2\to f(x,v)-\kappa\|v\|^2$ a.e. with the **integrable lower bound $-\gamma$**. Fatou gives
$$\liminf_k\int\big(f(x,v_k)-\kappa\|v_k\|^2\big)\ge\int\big(f(x,v)-\kappa\|v\|^2\big),$$
and since $v_k\to v$ in $L^2$ the subtracted terms converge, so they can be added back.

**Role of hypotheses / why only "$\le\liminf$".** Equality is false in general: the integrand need not be dominated from above. The script's picture is $g_k(x)=\sqrt ke^{-kx^2}$, which $\to0$ a.e. but has $\int g_k=c>0$ — mass escapes. Fatou's one-sided conclusion is *exactly* what a minimization argument needs, and no more. The coercivity bound $f\ge-\gamma+\kappa\|v\|^2$ supplies both the integrable minorant for Fatou and the term that must be subtracted first.

### 8.3 The abstract existence theorem (Thm. 8.5) — ★★ (Moreau–Yosida regularization)

**Hypotheses (as actually used — see the errata section).** $(H,\langle\cdot,\cdot\rangle)$ Hilbert; $S:H\to\mathbb R\cup\{\infty\}$ **bounded below**, $S\not\equiv\infty$, **convex**, **lower semicontinuous**.

**Statement.** For every $\lambda>0$ and $u\in H$, $S_\lambda(y)=S(y)+\lambda\|u-y\|^2$ has a **unique** minimizer $u_\lambda$. If $\|u_\lambda\|$ stays bounded as $\lambda\searrow0$, then $u_0:=\lim_{\lambda\searrow0}u_\lambda$ exists and minimizes $S$.

**Proof sketch.**
1. *Existence of $u_\lambda$:* minimizing sequence $y_k$; the **parallelogram law** gives
$$\|u-y_{k,l}\|^2=-\tfrac14\|y_k-y_l\|^2+\tfrac12\|u-y_k\|^2+\tfrac12\|u-y_l\|^2$$
for $y_{k,l}=\frac12(y_k+y_l)$; combined with convexity of $S$,
$$s_\lambda\le S(y_{k,l})+\lambda\|u-y_{k,l}\|^2\le\tfrac12S_\lambda(y_k)+\tfrac12S_\lambda(y_l)-\tfrac\lambda4\|y_k-y_l\|^2 .$$
Since the first two terms $\to s_\lambda$, we get $\|y_k-y_l\|\to0$: Cauchy. Lower semicontinuity makes the limit a minimizer; uniqueness by interlacing two minimizing sequences.
2. *Monotonicity:* for $\lambda_1<\lambda_2$, comparing the two minimality inequalities gives $\|u-u_{\lambda_2}\|\le\|u-u_{\lambda_1}\|$, i.e. $\|u-u_\lambda\|$ increases as $\lambda\searrow0$; being bounded, it converges.
3. *Cauchy in $\lambda$:* a second application of the parallelogram law + convexity turns the Cauchy property of the numbers $\|u-u_\lambda\|$ into $\|u_{\lambda_1}-u_{\lambda_2}\|^2\le\varepsilon$.
4. Lower semicontinuity gives $S(u_0)\le\lim S(u_\lambda)=\inf S$.

**Role of hypotheses.** The added term $\lambda\|u-y\|^2$ makes the functional **strictly convex / quadratically coercive**, which is precisely what generates the Cauchy estimate — this is the same $-\frac\lambda4\|y_k-y_l\|^2$ mechanism as in Thm. 7.2.2, and it is worth pointing out that Ch. 8 is the nonlinear echo of Ch. 7. The boundedness assumption on $\|u_\lambda\|$ is what must be verified in the application (step 1 of Thm. 8.1). The limit $u_0$ may a priori depend on the base point $u$; uniqueness needs strict convexity.

---

## 9. Finite elements — Céa's lemma (Ch. 9)

**★★ (short, elegant, easy to be asked as "what is this good for?")**

**Hypotheses.** As in Thm. 7.2.2: $A$ bilinear, symmetric, continuous with $|A(u,v)|\le\|A\|\|u\|\|v\|$, coercive with constant $\lambda$; $l$ linear continuous; $u$ the minimizer of $S=A(\cdot,\cdot)+l(\cdot)$ on $H$ and $u_V$ the minimizer on a **closed subspace** $V\subseteq H$ (in practice finite-dimensional: triangulations, lattices, wavelets).

**Statement.**
$$\|u-u_V\|\le\frac{\|A\|}\lambda\,\inf_{v\in V}\|u-v\| .$$

**Proof sketch.** ▶ **Galerkin orthogonality.** The Euler–Lagrange equations $2A(u,\varphi)+l(\varphi)=0$ for $\varphi\in H$ and $2A(u_V,\varphi)+l(\varphi)=0$ for $\varphi\in V$ subtract to $A(u-u_V,\varphi)=0$ for all $\varphi\in V$. Then for any $v\in V$,
$$\lambda\|u-u_V\|^2\le A(u-u_V,u-u_V)=A(u-u_V,u-v)+\underbrace{A(u-u_V,v-u_V)}_{=0,\ v-u_V\in V}\le\|A\|\,\|u-u_V\|\|u-v\| .$$
Divide and take the infimum.

**Role of hypotheses / interpretation.** Coercivity gives the lower bound, continuity the upper one; the ratio $\|A\|/\lambda$ is the "condition number". **Meaning:** the Galerkin/FEM solution is quasi-optimal — as good as the best approximation in $V$, up to a constant independent of $V$. For a filtration $V_1\subseteq V_2\subseteq\cdots\subseteq H$ with $\bigcup V_n$ dense, $\inf_{v\in V_n}\|u-v\|\to0$ and hence $u_{V_n}\to u$: **convergence of the method**. This reduces PDE numerics to approximation theory. Note $V$ must be a **subspace** (not just convex) for Galerkin orthogonality.

---

## 10. Embedding theorems (Ch. 10)

### 10.1 Higher-order embeddings (Thm. 10.1) — ★★

**Hypotheses.** $\Omega$ open, bounded, with **$C^k$ boundary**; $u\in H^{k,p}(\Omega)$.

**Statement.**
- (i) If $k<\frac np$: $u\in L^q(\Omega)$ with $\frac1q=\frac1p-\frac kn$, and $\|u\|_{L^q}\le C\|u\|_{H^{k,p}}$.
- (ii) If $k>\frac np$: $u\in C^{k-\lfloor n/p\rfloor-1,\gamma}(\overline\Omega)$ with $\gamma=\lfloor\frac np\rfloor+1-\frac np$ if $\frac np\notin\mathbb N$, and $\gamma\in(0,1)$ arbitrary if $\frac np\in\mathbb N$; with the corresponding norm bound.

**Proof sketch.** Pure bookkeeping: iterate $H^{k,p}\hookrightarrow H^{k-1,p^*}\hookrightarrow H^{k-2,p^{**}}\hookrightarrow\cdots$, each step by GNS applied to all derivatives of order $\le k-1$, so $\frac1{p^{(l)}}=\frac1p-\frac ln$. In case (i) run $k$ steps. In case (ii) iterate only until the exponent exceeds $n$ — this happens for the smallest $l$ with $l+1>\frac np$, i.e. $l=\lfloor n/p\rfloor$ — then apply Morrey once, gaining $\gamma=1-\frac nr$ with $\frac1r=\frac1p-\frac ln$. The borderline case $\frac np\in\mathbb N$ is handled by stopping at $r=n$ and using that $H^{1,n}\hookrightarrow L^q$ for all $q<\infty$; this is why $\gamma$ is then arbitrary in $(0,1)$ but not $1$.

**Role of hypotheses.** $C^k$ boundary + boundedness for the extension operator at every step. The dichotomy $k\lessgtr n/p$ is exactly GNS vs. Morrey. **Mnemonic to state:** *"one derivative buys $n/p$ units of integrability; when you have more derivatives than $n/p$ you can buy continuity instead."*

### 10.2 Arzelà–Ascoli (Thm. 10.3) — ★★ (tool)

**Hypotheses.** $K\subseteq\mathbb R^n$ compact; $(f_k)$ real-valued on $K$, **uniformly bounded** ($|f_k|\le M$) and **equicontinuous** ($\forall\varepsilon\exists\delta$, independent of $k$, with $\|x-y\|<\delta\Rightarrow|f_k(x)-f_k(y)|<\varepsilon$).

**Statement.** A subsequence converges uniformly, i.e. in $C^0(K)$.

**Proof sketch.** Cover $K$ by finitely many $\delta$-balls $B_\delta(x_1),\dots,B_\delta(x_L)$ (compactness). Uniform boundedness + Bolzano–Weierstrass + a finite diagonal extraction give convergence at the centers. Then the $4\varepsilon$-estimate
$$|f_j(y)-f_k(y)|\le\underbrace{|f_j(y)-f_j(x_l)|}_{\text{equicont.}}+\underbrace{|f_j(x_l)-f(x_l)|}_{\text{centers}}+|f(x_l)-f_k(x_l)|+\underbrace{|f_k(x_l)-f_k(y)|}_{\text{equicont.}}<4\varepsilon .$$
Repeat with $\varepsilon=1,\frac12,\frac13,\dots$ and take the **diagonal sequence**, which is Cauchy in $C^0(K)$.

**Immediate corollary used constantly:** $C^{0,\gamma}(\overline\Omega)\Subset C^0(\overline\Omega)$ for bounded $\Omega$: a $C^{0,\gamma}$-bounded family is uniformly bounded and equicontinuous with $\delta=(\varepsilon/\tilde c)^{1/\gamma}$. Combined with Morrey: **$H^{1,p}(\Omega)\Subset C^0(\overline\Omega)$ for $p>n$.** Both hypotheses are needed: without equicontinuity take $f_k(x)=\sin(kx)$; without uniform boundedness take $f_k=k$.

### 10.3 Rellich–Kondrachov (Thm. 10.4) — ★★★

**Hypotheses.** $\Omega$ open, **bounded**, with **$C^1$ boundary**; $1\le p<n$; **$1\le q<p^*=\frac{np}{n-p}$ (strict!)**.

**Statement.** The embedding $H^{1,p}(\Omega)\hookrightarrow L^q(\Omega)$ is **compact**: bounded sequences in $H^{1,p}$ have subsequences converging in $L^q$.

**Proof sketch (four steps).** Extend to $u_k\in H^{1,p}_0(V)$, $\Omega\Subset V$, with $\|u_k\|_{H^{1,p}(V)}\le M$.
1. **Mollification converges uniformly in $k$.** With $u_k^\varepsilon=\eta_\varepsilon*u_k$, write $u_k^\varepsilon(x)-u_k(x)=\int_{B_1}\eta(y)\int_0^1\frac{d}{d\tau}u_k(x-\varepsilon\tau y)\,d\tau\,d^ny$, so $|u_k^\varepsilon-u_k|\le\varepsilon\int\eta(y)\int_0^1\|Du_k(x-\varepsilon\tau y)\|$, and integrating in $x$ (Fubini + translation invariance):
$$\|u^\varepsilon_k-u_k\|_{L^1(V)}\le\varepsilon\,\tilde c\,\|Du_k\|_{L^1(V)}\le\varepsilon\,c\,M .$$
Combine with the *uniform* bound $\|u^\varepsilon_k-u_k\|_{L^{p^*}}\le2C M$ and the **interpolation inequality**
$$\|w\|_{L^q}\le\|w\|^\Theta_{L^1}\|w\|^{1-\Theta}_{L^{p^*}},\qquad \tfrac1q=\Theta+\tfrac{1-\Theta}{p^*},\ \Theta\in(0,1),$$
to get $\|u^\varepsilon_k-u_k\|_{L^q(V)}\le c\varepsilon^\Theta M\xrightarrow{\varepsilon\to0}0$ **uniformly in $k$**.
2. **For fixed $\varepsilon$, the family $(u^\varepsilon_k)_k$ is uniformly bounded and equicontinuous:** $|u_k^\varepsilon|\le\|\eta_\varepsilon\|_\infty\|u_k\|_{L^1}\le c\varepsilon^{-n}$ and $|Du^\varepsilon_k|\le c\varepsilon^{-n-1}$ (the constants blow up as $\varepsilon\to0$, but $\varepsilon$ is fixed here).
3. Given $\delta>0$: choose $\varepsilon$ with $\|u^\varepsilon_k-u_k\|_{L^q}<\delta/4$ for all $k$ (step 1), extract by **Arzelà–Ascoli** a subsequence with $u^\varepsilon_{k_j}\to$ in $C^0$, hence in $L^q(V)$ ($V$ bounded); triangle inequality gives $\|u_{k_j}-u_{k_l}\|_{L^q}<\delta$.
4. Diagonal argument over $\delta=1,\frac12,\frac13,\dots$

**Role of hypotheses — this is a classic exam question.**
- **$q<p^*$ strictly.** At $q=p^*$ compactness **fails**. Reason: the inequality is scale invariant, so the concentrating family $u_k(x)=k^{(n-p)/p}u(kx)$ has $\|u_k\|_{H^{1,p}}$ bounded and $\|u_k\|_{L^{p^*}}$ constant, but $u_k\to0$ a.e.; no subsequence converges in $L^{p^*}$. In the proof, this is exactly the point where $\Theta>0$ is needed for the interpolation step.
- **$\Omega$ bounded.** Otherwise translation gives a counterexample: $u_k(x)=u(x-ke_1)$ is $H^{1,p}$-bounded with no $L^q$-convergent subsequence. In the proof, boundedness is used for $L^{p^*}\subseteq L^q$ (Hölder needs finite measure) and in step 3.
- **$C^1$ boundary:** needed for the extension operator. (With more work one gets Rellich for $H^{1,p}_0$ on arbitrary bounded $\Omega$ — no boundary regularity needed there, since extension by zero is free.)
- **What it is used for:** compactness is the standard route to existence of minimizers/eigenfunctions, and to Fredholm alternatives. In this lecture it is the conceptual counterpart to the "coercivity + convexity" route.

---

## 11. Regularity theory, linear case (Ch. 11)

**Question.** $u\in H^{1,2}(\Omega)$ is a weak solution; is it better than $H^{1,2}$? Interior: yes, always. Boundary: yes, if $\partial\Omega$ and the boundary data are regular.

**Master tool: difference quotients** $\big(\Delta^h_iu\big)(x):=\dfrac{u(x+he_i)-u(x)}h$. The idea is that a difference quotient is an admissible test object (unlike $\partial_iu$, which we do not yet know exists), and a *uniform* bound on difference quotients produces a weak derivative.

### 11.1 Difference quotients (Lemma 11.1.1, 11.1.2) — ★★★

**Lemma 11.1.1.** *Hypotheses:* $u\in H^{1,2}(\Omega)$, $\Omega'\Subset\Omega$, $0<|h|<\operatorname{dist}(\Omega',\partial\Omega)$. *Statement:* $\|\Delta^h_iu\|_{L^2(\Omega')}\le\|D_iu\|_{L^2(\Omega)}$.
*Proof:* by density assume $u\in C^1$; write $\Delta^h_iu(x)=\frac1h\int_0^h\partial_iu(x+\xi e_i)\,d\xi$, apply Cauchy–Schwarz in $\xi$, then Fubini and $\Omega'+\xi e_i\subseteq\Omega$.
*Hypotheses:* $|h|<\operatorname{dist}$ is what makes the translated domain stay inside $\Omega$; without it the right-hand side is not defined.

**Lemma 11.1.2 (converse).** *Hypotheses:* $u\in L^2(\Omega)$ and $\exists K$ with $\|\Delta^h_iu\|_{L^2(\Omega')}\le K$ for **all** small $h$ and all $\Omega'\Subset\Omega$ with $\operatorname{dist}(\Omega',\partial\Omega)>h$. *Statement:* $u$ is weakly differentiable in the $i$-th direction with $\|D_iu\|_{L^2(\Omega)}\le K$.
*Proof sketch:* ▶ **discrete integration by parts** $\int(\Delta^h_iu)\eta=-\int u(\Delta^{-h}_i\eta)$ (shift the integration variable); let $h\to0$ on the right to get $-\int u\,\partial_i\eta$, and bound the left by $K\|\eta\|_{L^2}$. Thus $\Phi(\eta)=-\int u\partial_i\eta$ is a densely defined bounded functional on $L^2$; extend and apply **Fréchet–Riesz** to obtain $v\in L^2$ with $\Phi(\eta)=\langle v,\eta\rangle$ — that is precisely the definition of $D_iu=v$.
*Why this is the key lemma:* it converts an *a priori estimate uniform in $h$* into the *existence* of a derivative. Uniformity in $h$ is the whole content; a bound for each single $h$ is worthless.

### 11.2 Caccioppoli inequality (Lemma 11.1.4) — ★★★

**Hypotheses.** $u\in H^{1,2}(\Omega)$ a weak solution of $-\Delta u=f$, $f\in L^2(\Omega)$; $\Omega'\Subset\Omega$ with $\operatorname{dist}(\Omega',\partial\Omega)>\delta>0$.

**Statement.**
$$\int_{\Omega'}\|Du\|^2\,d^nx\le\frac{17}{\delta^2}\|u\|^2_{L^2(\Omega)}+\delta^2\|f\|^2_{L^2(\Omega)} .$$

**Proof sketch.** ▶ **Test with $v=\eta^2u$** where $\eta\in C^\infty_0(\Omega)$, $\eta\equiv1$ on $\Omega'$, $0\le\eta\le1$, $\|\nabla\eta\|\le2/\delta$. (One *cannot* test with $u$ itself — it is not in $H^{1,2}_0$.) Then
$$\int\eta^2\|\nabla u\|^2=-2\int\eta(\nabla u)(\nabla\eta)u+\int\eta^2fu\le2\|\eta\nabla u\|_{L^2}\|u\nabla\eta\|_{L^2}+\|\eta f\|_{L^2}\|\eta u\|_{L^2}.$$
Absorb the first term with **Young's inequality** $2ab\le\frac{a^2}{\kappa^2}+\kappa^2b^2$, $\kappa=\sqrt2$, so that half of $\|\eta\nabla u\|^2$ moves to the left. Rearranging gives the stated bound.

**Role of hypotheses / interpretation.**
- This is a **reverse Poincaré inequality**: the gradient on the smaller set is controlled by the function on the bigger set. It is false for general functions; it holds because $u$ solves an equation.
- The **cutoff** is what pays for the loss $\Omega\to\Omega'$, and the $\delta^{-2}$ blow-up is optimal (scaling: $\|\nabla\eta\|\sim1/\delta$).
- The **absorption trick** (Young with a well-chosen $\kappa$, then move the term to the left) is the single most reused device in Ch. 11–12 — say this explicitly.

### 11.3 Interior $H^{2,2}$ regularity for $-\Delta u=f$ (Thm. 11.1.3) — ★★★

**Hypotheses.** $u\in H^{1,2}(\Omega)$ weak solution of $-\Delta u=f$ with $f\in L^2(\Omega)$; $\Omega'\Subset\Omega$.

**Statement.** $u\in H^{2,2}(\Omega')$ and
$$\|u\|_{H^{2,2}(\Omega')}\le c(\Omega')\big(\|u\|_{L^2(\Omega)}+\|f\|_{L^2(\Omega)}\big).$$

**Proof sketch.**
1. *Formal motivation (worth telling first).* Testing with $v=u$ gives $\int\|\nabla u\|^2$; testing with $v=\Delta u$ and integrating by parts gives $-\int\|D^2u\|^2$. Neither $v$ is admissible ($\notin H^{1,2}_0$) — hence cutoffs and difference quotients.
2. Difference-quotient version of the equation: for $v\in H^{1,2}_0(\Omega')$,
$$\int\big(D\Delta^h_iu\big)(Dv)=-\int(Du)(D\Delta^{-h}_iv)=-\int f\,\Delta^{-h}_iv\ \Rightarrow\ \Big|\int(D\Delta^h_iu)(Dv)\Big|\le\|f\|_{L^2(\Omega)}\|Dv\|_{L^2(\Omega')}$$
using Lemma 11.1.1 on $\Delta^{-h}_iv$.
3. Test with $v=\eta^2\Delta^h_iu$ ($\eta$ a cutoff, $|D\eta|\le8/\delta$), expand $Dv=\eta^2D\Delta^h_iu+2\eta(D\eta)\Delta^h_iu$. The "good" term $\int\eta^2\|D\Delta^h_iu\|^2$ appears with a positive sign; all remaining terms contain at most one factor of $D\Delta^h_iu$ and are absorbed by **Young + absorption**, using Lemma 11.1.1 to bound $\|\Delta^h_iu\|_{L^2}\le\|Du\|_{L^2}$.
4. Result: $\|\Delta^h_iDu\|^2_{L^2(\Omega'')}\le2C\big(\|Du\|^2_{L^2(\Omega)}+\|f\|^2_{L^2(\Omega)}\big)$, **uniformly in $h$**. Lemma 11.1.2 ⟹ $\partial_iDu$ exists in $L^2$, i.e. $u\in H^{2,2}(\Omega'')$.
5. Finally replace $\|Du\|_{L^2(\Omega)}$ by $\|u\|_{L^2}+\|f\|_{L^2}$ using **Caccioppoli**.

**Role of hypotheses.**
- The estimate is **interior only**: the constant depends on $\operatorname{dist}(\Omega',\partial\Omega)$ and blows up at the boundary. No boundary data are used or needed.
- $f\in L^2$ is exactly what makes the right-hand side of step 2 finite; more integrability of $f$ buys more regularity (this is the bootstrap of 11.1.6).
- Everything is done with **difference quotients in all directions** — possible because $\Omega'\Subset\Omega$ leaves room in every direction. At the boundary only *tangential* quotients survive (see 11.5).

### 11.4 General elliptic operators, interior (Thm. 11.1.5) — ★★

**Hypotheses.** $\partial_i(a^{ij}\partial_ju)+b^i\partial_iu+cu=f$ weakly, with
- **uniform ellipticity** $a^{ij}\xi_i\xi_j\ge\kappa\|\xi\|^2$,
- **uniform boundedness** $|a^{ij}|,|b|,|c|\le C$,
- **regularity of coefficients** $a^{ij}\in C^1(\Omega)$ with $|\partial_ka^{ij}|\le C$, $b^i,c\in L^\infty$, $f\in L^2$.

**Statement.** $u\in H^{2,2}(\Omega')$ for all $\Omega'\Subset\Omega$, with the analogous estimate.

**Proof strategy (three steps, state them, don't compute).**
1. **Absorb lower-order terms into the inhomogeneity:** $\partial_i(a^{ij}\partial_ju)=\tilde f:=f-b^i\partial_iu-cu\in L^2$.
2. **Caccioppoli** for $L$: test with $\eta^2u$; ellipticity gives $\kappa\int\eta^2\|Du\|^2$ on the left, everything else is absorbed as before ⟹ $\|Du\|_{L^2(\Omega')}\le c(\Omega',\kappa,C)\big(\|u\|_{L^2}+\|f\|_{L^2}\big)$.
3. **Difference quotients** with the **discrete Leibniz rule**
$$\Delta^h_i(fg)(x)=g(x+he_i)\big(\Delta^h_if\big)(x)+f(x)\big(\Delta^h_ig\big)(x),$$
which produces the extra term $\int(\partial_ju)\big(\Delta^{-h}_ia^{ij}\big)(\partial_iv)$. **This is precisely where $a^{ij}\in C^1$ with bounded derivative is needed:** $|\Delta^{-h}_ia^{ij}|\le\|Da^{ij}\|_\infty<C$ uniformly in $h$. Then proceed exactly as in 11.1.3.

**Role of hypotheses — the crucial one.** Without $a^{ij}\in C^1$ (merely $a^{ij}\in L^\infty$), the difference quotient of the coefficients **cannot be controlled**, and this method collapses. That failure is the whole motivation for Ch. 12: nonlinear problems, after "freezing the coefficients", give $a^{ij}$ that are only measurable and bounded.

### 11.5 Bootstrap to $C^\infty$ (Thm. 11.1.6) — ★★

**Hypotheses.** $f\in C^\infty(\Omega)$, $a^{ij},b^i,c\in C^\infty(\Omega)$; $u\in H^{1,2}$ a weak solution.

**Statement.** $u\in H^{k,2}_{\rm loc}(\Omega)$ for every $k$, hence $u\in C^\infty(\Omega)$.

**Proof sketch.** ▶ **Iteration.** Knowing $u\in H^{2,2}_{\rm loc}$, differentiate the equation: $\partial_i(a^{ij}\partial_j(\partial_lu))=\hat f\in L^2_{\rm loc}$ (all other terms are in $H^{1,2}$ by the product rule and the assumed smoothness). Apply Thm. 11.1.5 to $\partial_lu$: $\partial_lu\in H^{2,2}_{\rm loc}$, i.e. $u\in H^{3,2}_{\rm loc}$. Repeat. Finally, by the **embedding theorem 10.1** there is a $k_0=k_0(n)$ with $H^{k_0,2}(\Omega')\hookrightarrow C^{0,\gamma}(\overline{\Omega'})$ and $H^{k_0+p,2}\hookrightarrow C^{p,\gamma}$; since $p$ is arbitrary, $u\in C^\infty(\Omega')$.

**The sentence to say:** *"Weak solutions of elliptic equations with smooth coefficients are smooth in the interior — so the weak formulation costs nothing; it is only a device to prove existence."* (This closes the loop with Ch. 7: the variational solution *is* the classical solution.)

### 11.6 Boundary regularity (Sect. 11.2, Thm. 11.2.1) — ★★

**Hypotheses.**
- $\Omega$ bounded with **$C^k$ boundary**, $k\ge2$;
- same ellipticity/boundedness/regularity of coefficients as in 11.1.5;
- **regularity of the boundary data:** there is $g\in H^{2,2}(\Omega)$ with $\tilde u:=u-g\in H^{1,2}_0(\Omega)$ (e.g. $u|_{\partial\Omega}=u_0\in C^2(\partial\Omega)$ extended to $g\in C^2(\overline\Omega)$).

**Statement.** $u\in H^{2,2}$ up to the boundary.

**Proof sketch (structure only).**
1. Subtract $g$ to reduce to zero boundary values; the equation keeps its form with a modified right-hand side $\tilde f$.
2. Flatten the boundary with a $C^k$ chart $y=\varphi(x)$; the equation stays of the same type (ellipticity and boundedness are preserved, with new constants).
3. ▶ **Only tangential difference quotients.** $\Delta^h_\alpha$ for $\alpha\in\{1,\dots,n-1\}$ can be used near the flat boundary (the shifted domain stays inside), while the normal quotient $\Delta^h_0$ leaves $\Omega$ for one sign of $h$. So the interior argument yields $\partial_\alpha\partial_iu\in L^2$ for all $i$ and all tangential $\alpha$ — that is all second derivatives except $\partial_{00}u$.
4. ▶ **Get $\partial_{00}u$ from the equation itself:** solve
$$a^{00}\partial_{00}u=\tilde f-2a^{0\alpha}\partial_{0\alpha}u-a^{\alpha\beta}\partial_{\alpha\beta}u-b^i\partial_iu-cu-(\partial_ia^{ij})\partial_ju$$
for $\partial_{00}u$. Every term on the right is in $L^2$ by step 3, and **uniform ellipticity gives $a^{00}\ge\kappa>0$**, so dividing is legal.

**Role of hypotheses.** $C^k$ boundary for the flattening (this is why boundary regularity, unlike interior regularity, *needs* geometric assumptions); $H^{2,2}$ boundary data because the theorem cannot give more regularity than the data have; **$a^{00}\ge\kappa>0$ is exactly ellipticity in the normal direction** — a degenerate-elliptic equation would fail at step 4. Note the elegant division of labour: derivatives that the difference quotient method cannot see are recovered *algebraically* from the PDE.

---

## 12. De Giorgi–Nash–Moser (Ch. 12)

**Why this chapter.** Consider the nonlinear variational problem $S(u)=\int\big(g(\|\nabla u\|^2)+fu\big)$ with $0<\lambda\le g'\le\Lambda<\infty$. Its Euler–Lagrange equation is
$$\partial_i\big(a^{ij}\partial_ju\big)=f,\qquad a^{ij}=2g'(\|\nabla u\|^2)\delta^{ij},$$
which is **uniformly elliptic with $L^\infty$ coefficients** — but with coefficients depending on the (unknown) solution. This is "**freezing of coefficients**": to get regularity for the nonlinear problem, prove regularity for linear equations with merely **measurable, bounded, uniformly elliptic** coefficients. (For the $p$-Laplacian, $a^{ij}=\|Du\|^{p-2}\delta^{ij}$, the coefficients are not even bounded — harder still.) The method of Ch. 11 is unavailable: $\Delta^{-h}a^{ij}$ cannot be controlled.

**Setting for the whole chapter.** $Lu=\partial_i(a^{ij}\partial_ju)$ with $a^{ij}$ **measurable**, $|a^{ij}|\le\Lambda$, $a^{ij}\xi_i\xi_j\ge\lambda\|\xi\|^2$; $u\in H^{1,2}(\Omega)$ a weak solution of $Lu=0$.

### 12.1 The two big theorems (Thm. 12.1.1, 12.1.2) — ★★★

**Thm. 12.1.2 (Moser).** Weak solutions are locally bounded: $\sup_{B_R(x_0)}u<\infty$. If moreover $u\ge0$ in $B_{4R}(x_0)$, then the **Harnack inequality**
$$\sup_{B_R(x_0)}u\le C\Big(n,\frac\Lambda\lambda\Big)\ \inf_{B_R(x_0)}u$$
holds, with $C$ **independent of $R$** (and of $u$, and of the modulus of continuity of $a^{ij}$ — there is none!).

**Thm. 12.1.1 (De Giorgi–Nash).** $u\in C^{0,\alpha}(\Omega')$ for every $\Omega'\Subset\Omega$, for some $\alpha=\alpha(n,\Lambda/\lambda)>0$.

**Proof of 12.1.1 from the Harnack inequality (know this — it is short and beautiful).**
Set $M(R)=\sup_{B_R(x_0)}u$, $m(R)=\inf_{B_R(x_0)}u$, and the **oscillation** $\omega(R)=M(R)-m(R)$. Both $M(R)-u$ and $u-m(R)$ are **non-negative** weak solutions on $B_R$ (note $L(-u)=-Lu=0$ and $L(\text{const})=0$), so Harnack on $B_{R/4}\subseteq B_R\subseteq B_{4R}$ gives
$$M(R)-m(R/4)\le C\big(M(R)-M(R/4)\big),\qquad M(R/4)-m(R)\le C\big(m(R/4)-m(R)\big).$$
Add:
$$(1+C)\,\omega(R/4)\le(C-1)\,\omega(R)\quad\Longrightarrow\quad \omega(R/4)\le\vartheta\,\omega(R),\quad\vartheta=\frac{C-1}{C+1}<1 .$$
Iterating, $\omega(4^{-k}R)\le\vartheta^k\omega(R)$. For $r\in(0,R)$ choose $k$ with $4^{-(k+1)}R\le r<4^{-k}R$; since $\omega$ is monotone,
$$\omega(r)\le\vartheta^k\omega(R)=\big(4^{-k}\big)^{\alpha}\omega(R)\le4^\alpha\Big(\frac rR\Big)^\alpha\omega(R),\qquad \alpha:=\frac{\ln\vartheta}{\ln\frac14}>0 .$$
Hence $|u(x)-u(x_0)|\le\omega(\|x-x_0\|)\le C\,\|x-x_0\|^\alpha$: **Hölder continuity with a universal exponent.**

▶ **The essential point to articulate:** the Harnack constant $C$ is **independent of $R$** (scale invariance of the class of equations), which is why iterating gives a *geometric* decay of the oscillation. If $C$ degenerated as $R\to0$, no Hölder exponent would come out.

### 12.2 Weak sub-/supersolutions and compositions (Def. 12.2.1, Lemma 12.2.2, 12.2.3) — ★★

**Definition.** $u\in H^{1,2}(\Omega)$ is a **weak subsolution** ($Lu\ge0$) if $\int a^{ij}(\partial_iu)(\partial_j\eta)\le0$ for all $0\le\eta\in H^{1,2}_0(\Omega)$; supersolution if $-u$ is a subsolution.

**Lemma 12.2.2.** Let $f\in C^2(\mathbb R)$ with $\sup|f'|,\sup|f''|<\infty$.
(i) $u$ subsolution, $f$ **convex** and $f'\ge0$ ⟹ $f\circ u$ subsolution.
(ii) $u$ **solution**, $f$ convex ⟹ $f\circ u$ subsolution.
*Proof idea (smooth case, then approximate):*
$$L(f\circ u)=\underbrace{a^{ij}f''(u)(\partial_iu)(\partial_ju)}_{\ge0\ \text{by ellipticity and }f''\ge0}+\ f'(u)\,\underbrace{Lu}_{\ge0\ \text{or}=0} .$$
For (i) one needs $f'\ge0$ to keep the second term's sign; for (ii) the second term vanishes, so no sign condition on $f'$ is needed. The passage $u\in C^2\to u\in H^{1,2}$ uses the bounds on $f',f''$ (mean value theorem + dominated convergence) — exactly the chain rule 6.3.7(iv).

**Lemma 12.2.3.** $u$ subsolution, $k\in\mathbb R$ ⟹ $v=\max(u,k)$ is a subsolution. *Proof:* approximate $x\mapsto\max(x,k)$ by convex $f_n\in C^2$ with $f_n'\ge0$, $f_n\rightrightarrows f$; the only delicate limit is $\int|f_n'(u)-f'(u)|^2|\partial_iu|^2\to0$, which holds by dominated convergence since $f_n'\to f'$ pointwise off the single point $x=k$.

**Why these lemmas exist:** the Moser iteration needs $u^q$ (and $\max(u,\varepsilon)$ to avoid zeros) to be subsolutions. **Note $f(u)=u^p$ is convex with $f'\ge0$ on $u\ge0$** — the whole scheme runs on powers.

### 12.3 The Caccioppoli inequality for powers (Lemma 12.2.7) — ★★★ (engine of the iteration)

**Hypotheses.** $u\in H^{1,2}(\Omega)$, $u\ge0$, a weak **subsolution**; $q>\frac12$ with $v:=u^q\in L^2(\Omega)$; $\eta\in H^{1,2}_0(\Omega)$.

**Statement.**
$$\int_\Omega\eta^2\|Dv\|^2\ \le\ C\Big(\frac\Lambda\lambda\Big)^2\Big(\frac{2q}{2q-1}\Big)^2\int_\Omega\|D\eta\|^2v^2 .$$

**Proof sketch.** Test the subsolution inequality with $\varphi=f'(u)\eta^2$, so $\partial_j\varphi=f''(u)(\partial_ju)\eta^2+f'(u)2\eta\partial_j\eta$. Using $a^{ij}\partial_iu\partial_ju\ge\lambda\|Du\|^2$ and $|a^{ij}|\le\Lambda$ and **Young's inequality with $\kappa=2\Lambda/\lambda$** (the usual absorption) gives
$$\int\|Du\|^2f''(u)\eta^2\le4\Big(\frac\Lambda\lambda\Big)^2\int\frac{(f'(u))^2}{|f''(u)|}\|D\eta\|^2 .$$
Now choose $f(u)=u^{2q}$ — truncated linearly/exponentially beyond a level $L$ so that $f',f''$ stay bounded (Lemma 12.2.2 requires this), then $L\to\infty$ by monotone convergence on the left and dominated convergence on the right. With $f'=2qu^{2q-1}$, $f''=2q(2q-1)u^{2q-2}$ and $v=u^q$, $Dv=qu^{q-1}Du$, the stated inequality falls out.

**Role of hypotheses.**
- **$q>\frac12$** keeps $2q-1>0$, i.e. $f''>0$ (convexity) — for $q\le\frac12$ the sign flips and the estimate is false. The factor $\frac{2q}{2q-1}$ blows up as $q\searrow\frac12$; tracking this constant is what makes the iteration converge.
- **$u\ge0$** so that powers are defined (in the proof one replaces $u$ by $\max(u,\varepsilon)$).
- **Only $\lambda,\Lambda$ enter** — no smoothness of $a^{ij}$ anywhere. That is the entire point of Moser's method.

### 12.4 Moser iteration: local boundedness (Thm. 12.2.4) — ★★★

**Hypotheses.** $u$ a subsolution in $B_{4R}(x_0)$; $p>1$.

**Statement.**
$$\sup_{B_R(x_0)}u\ \le\ C\Big(n,\frac\Lambda\lambda\Big)\Big(\frac p{p-1}\Big)^{2/p}\left(\ \rlap{\,\text{--}}\!\int_{B_{2R}(x_0)}\big(\max(0,u)\big)^p\right)^{1/p}.$$

**Proof sketch (this is the proof to be able to outline).** WLOG $R=1$, $x_0=0$ (scale and translate), $u>0$ (replace by $\max(u,\varepsilon)$, Lemma 12.2.3, then $\varepsilon\to0$).
1. Pick radii $r'<r<2r'<2$ and a cutoff $\eta$ with $\eta|_{B_{r'}}=1$, $\operatorname{supp}\eta\subseteq B_r$, $\|D\eta\|\le\frac2{r-r'}$. Lemma 12.2.7 with $v=u^q$:
$$\int_{B_{r'}}\|Dv\|^2\le c\Big(\frac{2q}{2q-1}\Big)^2\frac4{(r-r')^2}\int_{B_r}v^2 .$$
2. ▶ **Feed this into Sobolev.** $H^{1,2}(B_{r'})\hookrightarrow L^{p^*}(B_{r'})$ with $p^*=\frac{2n}{n-2}$:
$$\left(\rlap{\,\text{--}}\!\int_{B_{r'}}v^{\frac{2n}{n-2}}\right)^{\frac{n-2}n}\le c\Big(\frac{r'}{r-r'}\Big)^2\Big(\frac{2q}{2q-1}\Big)^2\rlap{\,\text{--}}\!\int_{B_r}v^2 .$$
In terms of $\varphi(p,R):=\big(\rlap{\,\text{--}}\!\int_{B_R}u^p\big)^{1/p}$ and $s=2q$, this reads
$$\varphi\Big(\frac n{n-2}s,\ r'\Big)\ \le\ \left[c_1\Big(\frac{r'}{r-r'}\Big)^2\Big(\frac s{s-1}\Big)^2\right]^{1/s}\varphi(s,r).$$
**The gain: the integrability exponent is multiplied by $\chi:=\frac n{n-2}>1$ at the cost of shrinking the ball a little and a computable constant.**
3. **Iterate** with $s_k=\chi^kp$ and $r_k=1+2^{-k}$, $r_k'=r_{k+1}$. The constants at step $k$ are $\big(c_2(p)\big)^{k\chi^{-k}}$; the exponents form the **convergent series** $\sum_k k\chi^{-k}<\infty$, so the total constant is finite:
$$\varphi(s_{k+1},r_{k+1})\le (c_2)^{\sum_l l\chi^{-l}}\varphi(p,2)\le c_3\Big(\frac p{p-1}\Big)^{2/p}\varphi(p,2).$$
4. By **Lemma 12.2.6**, $\lim_{p\to\infty}\varphi(p,R)=\operatorname{ess\,sup}_{B_R}u$. Hence $\sup_{B_1}u=\varphi(\infty,1)\le c\big(\frac p{p-1}\big)^{2/p}\varphi(p,2)$.

**Role of hypotheses / what makes it work.**
- **$n\ge3$** so that $\chi=\frac n{n-2}$ is finite and $>1$. (For $n=2$ one uses any $\chi>1$ from $H^{1,2}\hookrightarrow L^q$, $q<\infty$.)
- **Convergence of $\sum k\chi^{-k}$** is the miracle: infinitely many applications of Sobolev + Caccioppoli, yet a finite constant. If the radii shrank too fast or the constants grew like $c^k$ with the *same* $k$-power, the product would diverge.
- **Only $\lambda,\Lambda,n$ enter the constant** — the estimate is uniform over the whole class of equations, which is exactly what "freezing coefficients" requires.

**Lemma 12.2.6 (★, needed above).** $\lim_{p\to+\infty}\varphi(p,R)=\operatorname{ess\,sup}_{B_R}u$ and $\lim_{p\to-\infty}\varphi(p,R)=\operatorname{ess\,inf}_{B_R}u$. *Proof:* monotonicity of $p\mapsto\varphi(p,R)$ by Hölder (note the **normalized** average is essential — otherwise no monotonicity), one inequality from $u\le\sup$, the other by restricting to a set where $u\ge\sup-\varepsilon$; the case $p\to-\infty$ follows by applying the first to $1/u$.

### 12.5 The other half of Harnack (Thm. 12.2.5, John–Nirenberg) — ★★

**Thm. 12.2.5.** For $u\ge0$ a subsolution in $B_{4R}$ and $n\ge3$, a "reverse" Moser iteration run with **negative exponents** ($p<0$, i.e. applied to $u^{-1}$) gives
$$\varphi(-\mu,3)\le c\,\varphi(-\infty,2)=c\,\inf_{B_2}u,$$
i.e. a bound of a *negative* mean by the infimum.

**The gap and how it is closed.** Combining the two iterations gives
$$\sup_{B_R}u\le c\,\varphi(\mu,2),\qquad \varphi(-\mu,2)\le c\inf_{B_R}u .$$
What is missing is a comparison of $\varphi(\mu,2)$ and $\varphi(-\mu,2)$, i.e. a bound
$$\Big(\rlap{\,\text{--}}\!\int u^{\mu}\Big)\Big(\rlap{\,\text{--}}\!\int u^{-\mu}\Big)\le \text{const}.$$
This is supplied by:

**Thm. 12.2.8 (John–Nirenberg).** *Hypotheses:* $u\in H^{1,1}(B_{R_0}(y_0))$ with the **BMO-type gradient bound** $\int_{B_{R_0}\cap B_R(y)}\|Du\|\le R^{n-1}$ for all balls $B_R(y)$. *Statement:* there are $\alpha,\beta_0>0$ with
$$\rlap{\,\text{--}}\!\int_{B_{R_0}(y_0)}e^{\alpha|u-u_0|}\le\beta_0,\qquad u_0=\rlap{\,\text{--}}\!\int_{B_{R_0}}u .$$
*Consequence:* with $v=\ln u$ (so $e^{\alpha v}=u^\alpha$, $e^{-\alpha v}=u^{-\alpha}$), Cauchy–Schwarz gives
$$\Big(\rlap{\,\text{--}}\!\int u^{\alpha}\Big)\Big(\rlap{\,\text{--}}\!\int u^{-\alpha}\Big)\le\Big(\rlap{\,\text{--}}\!\int e^{\alpha|v-v_0|}\Big)^2\le\beta_0^2,$$
which is exactly the missing link. To apply it one must verify the hypothesis $\int_{B_R(y)}\frac{\|Du\|}u\le R^{n-1}$, which follows from **testing the equation with $\varphi=\frac{\eta^2}u$** (legal since $u>0$) plus Cauchy–Schwarz — the same Caccioppoli mechanism once more, now for $\ln u$.

*The two auxiliary lemmas 12.2.9/12.2.10 (proofs omitted in the script) estimate the Riesz-type potential $V_\mu f(x)=\int\|x-y\|^{n(\mu-1)}f(y)$, exactly as in the Morrey inequality, and are then used to expand $e^{V_\mu(f)/\gamma}$ in a power series.*

**Priority note:** for an oral exam, know (a) the statement of John–Nirenberg, (b) that it is used to bridge positive and negative exponents, (c) that $\ln u$ is the natural quantity because the equation is invariant under $u\mapsto cu$ (scaling in the *value*, not the variable). The detailed proof is safely "quotable but omitted" — the script itself omits it.

**Summary picture of Ch. 12 to draw on the board:**
$$\underbrace{\text{Caccioppoli for }u^q}_{12.2.7}\ +\ \underbrace{\text{Sobolev}}_{6.5.1}\ \xrightarrow{\ \text{iterate}\ }\ \underbrace{\sup\le c\,\varphi(\mu)}_{12.2.4},\ \underbrace{\varphi(-\mu)\le c\inf}_{12.2.5}\ \xrightarrow[\text{John–Nirenberg}]{\ \ln u\in\text{BMO}\ }\ \underbrace{\text{Harnack}}_{12.1.2}\ \xrightarrow{\ \text{oscillation}\ }\ \underbrace{C^{0,\alpha}}_{12.1.1}$$

---

## 13. Cross-cutting themes and likely exam questions

### 13.1 The four ways this course proves existence

| Method | Chapter | Needs | Gives | Fails when |
|---|---|---|---|---|
| Explicit kernel (Green's function / Poisson) | 3 | very special geometry (ball) | classical solution, explicit formula | no $G$ for general $\Omega$ |
| Perron sub-/supersolutions | 4 | maximum principle + solvability on balls | classical solution | boundary point irregular (Lebesgue spine) |
| Direct method / Dirichlet principle | 7, 8 | coercivity, convexity, completeness | weak solution in $H^{1,2}_0$ | $c<0$ (eigenvalue), non-convex $f$, unbounded $\Omega$ |
| Compactness (Rellich) | 10 | bounded domain, $q<p^*$ | convergent subsequences | critical exponent $q=p^*$ |

### 13.2 The three "absorption" moments
Young's inequality $2ab\le\frac{a^2}{\kappa^2}+\kappa^2b^2$ with the bad term moved to the left, appears in: the **trace theorem** (6.4.1 step 2), **Caccioppoli** (11.1.4), the **interior $H^{2,2}$ estimate** (11.1.3), and **Moser's Caccioppoli for powers** (12.2.7). If you can explain the trick once, you have four proofs.

### 13.3 Standard oral questions and one-line answers
- *"Why do we need weak solutions at all?"* — Because we can prove existence by minimizing over a complete space (Ch. 7), and regularity theory then shows nothing is lost (Ch. 11).
- *"Where exactly does ellipticity enter?"* — (a) sign of $a^{ij}\partial_{ij}u$ at an interior max (5.2); (b) coercivity of the bilinear form, hence existence (7.2.2); (c) the good term in every Caccioppoli inequality (11.1.4, 12.2.7); (d) $a^{00}\ge\kappa>0$ in boundary regularity (11.2).
- *"Why $c\le0$ (resp. $c\ge0$ in divergence form)?"* — Example 5.1(b): $u=\sin(\pi x)$ on $(0,1)$; eigenvalues destroy both the maximum principle and uniqueness/coercivity.
- *"What is special about the fundamental solution?"* — It is radial, harmonic away from the origin, and normalized so that its singularity has exactly the strength that the sphere-area factor $\varepsilon^{n-1}$ cancels — that is why $\Delta\Gamma=\delta$.
- *"Give me a harmonic function that violates the maximum principle."* — Impossible for bounded $\Omega$; on unbounded $\Omega$: $u(x)=x_n$ on the half-space.
- *"State the Harnack inequality and one consequence."* — 3.4.1 + Liouville (or Harnack's convergence theorem, used in Perron; or, in the $L^\infty$-coefficient version, De Giorgi–Nash).
- *"What can go wrong at the critical Sobolev exponent?"* — GNS still holds; **compactness** fails (concentration by scaling), which is exactly why Rellich requires $q<p^*$.
- *"Why does the difference quotient method fail in Ch. 12?"* — $\Delta^{-h}a^{ij}$ is uncontrolled for merely measurable $a^{ij}$; Moser replaces derivatives of coefficients by iteration of integral estimates.
- *"What is the role of the cutoff function $\eta$?"* — It makes the test function admissible ($\in H^{1,2}_0$) and localizes; the price is the factor $\|D\eta\|\sim1/\delta$ in every interior estimate.

### 13.4 Minimal formula sheet
$$\Gamma(r)=\tfrac1{2\pi}\ln r\ (n=2),\quad \tfrac{r^{2-n}}{n(2-n)\omega_n}\ (n>2);\qquad
u(x_0)=\rlap{\,\text{--}}\!\int_{B_r(x_0)}u;\qquad
p^*=\tfrac{np}{n-p};\qquad \gamma=1-\tfrac np;$$
$$\|u\|_{L^{p^*}}\le c\|Du\|_{L^p}\ (p<n);\qquad \|u\|_{C^{0,\gamma}}\le c\|u\|_{H^{1,p}}\ (p>n);\qquad
\|u\|_{L^q}\le C\|Du\|_{L^p}\ (u\in H^{1,p}_0);$$
$$\int_{\Omega'}\|Du\|^2\le\tfrac{17}{\delta^2}\|u\|^2_{L^2}+\delta^2\|f\|^2_{L^2};\qquad
\sup_{B_R}u\le C\big(n,\tfrac\Lambda\lambda\big)\inf_{B_R}u .$$

---

## 14. Errata / things stated loosely in the script

Worth knowing — being able to point these out (politely) is a strong signal in an oral exam.

1. **Thm. 8.5** lists only "bounded from below and $S\not\equiv\infty$", but the proof uses **convexity** (in the parallelogram estimate) and **lower semicontinuity** (to conclude that the limit is a minimizer). Both must be added to the hypotheses. Similarly, uniqueness of $u_0=\lim u_\lambda$ requires strict convexity; the script itself flags that $u_0$ may still depend on the base point $u$.
2. **Ch. 4** sometimes assumes $\varphi\in C^2(\partial\Omega)$, but $\varphi\in C^0(\partial\Omega)$ is all that is used, and Thm. 4.14 is stated for $C^0$ data. Use $C^0$.
3. **Def. 4.4 (harmonic lift)** is written with $v$ on both sides ("$\overline v|_{\Omega\setminus B}=v|_{\Omega\setminus B}$" is meant); also the definition should say *"let $v$ be subharmonic"*.
4. **Lemma 5.6** as stated needs $u(x_0)>u(x)$ for all $x\in\Omega$ *strictly*, and $\Omega$ should be understood as the domain on which $Lu\ge0$ (in the application, $\Omega^-$). It is applied to $\Omega^-$, not to $\Omega$.
5. **Thm. 12.1.2** writes $C(n,\Lambda/\lambda)$ in one place and $C(p,n,\lambda/\Lambda)$ in another (12.2.5); the dependence is on the **ellipticity ratio** $\Lambda/\lambda$ (and $n$, and $p$).
6. **Def. 5.5 (interior sphere condition)** should read "$x_0\in\partial B$", not "$x_0=\partial B$".
7. **Ch. 1** classifies the Schrödinger equation as parabolic; see the remark in §1 above.
8. **Constants** in 12.2.7 differ by a factor between the statement and the last line of the proof; only the *structure* $C(\Lambda/\lambda)^2\big(\tfrac{2q}{2q-1}\big)^2$ matters.
9. **Thm. 6.4.1** states $\|Tu\|_{L^p(\partial\Omega)}\le K\|u\|_{H^{1,p}}$ with "$C\in\mathbb R_{>0}$ independent of $u$" — the constant is $K=C^{1/p}$ and depends on $\Omega$ and $p$.
10. **Thm. 3.2.5** is stated with the proof only sketched ("compute the boundary values and justify differentiating under the integral") — if asked, say that the two things to check are (a) harmonicity, by differentiating the Poisson kernel under the integral sign, and (b) attainment of the boundary values, by an approximate-identity argument using $\int_{\partial B_R}\nabla_\nu G\,d\mu=1$.

---

*Prepared from the script; priorities and counterexamples are my own editorial judgement. If your examiner is Prof. Finster, expect emphasis on the logical architecture (why each hypothesis is there, how chapters connect) rather than on constants.*
