# Elliptic PDE Theory — Condensed Exam Notes

*Pass-level oral exam prep. Focus: precise definitions/statements + big-picture motivation. Proof reproduction not required.*

---

## Big Picture (have a 90s version ready)

**Course goal:** solve linear (and convex-nonlinear) 2nd-order elliptic PDEs. Strategy: *weaken* the notion of solution to get existence cheaply via functional analysis, then *upgrade* weak solutions back to classical smoothness.

1. **Ch 1** — classify PDEs (order, linearity, ellipticity).
2. **Ch 2 — Distributions and Fourier Transform.** Realize classical (pointwise) solutions/derivatives are too restrictive → build **distributions** as the rigorous language for "generalized functions" and weak derivatives. **Fourier transform** is introduced here as the concrete computational payoff: on all of $\mathbb R^n$ (no boundary conditions), it turns $-\Delta u=f$ into pointwise multiplication $|\xi|^2\hat u=\hat f$, algebraically solvable — this is how you *derive* the fundamental solution $\Phi$, which is needed immediately in Ch 3.
3. **Ch 3 — The Laplace Equation.** Uses the fundamental solution $\Phi$ from Ch 2 as its starting building block: **Green's representation formula** expresses any $u$ via $\Phi$; correcting $\Phi$ with a harmonic term to vanish on $\partial\Omega$ gives the **Green's function** $G$, which explicitly *solves* the Dirichlet problem via the **Poisson representation formula** $u(x)=-\int_{\partial\Omega} u\,\partial_\nu G\,dS$. So: Ch 2 (Fourier) *manufactures the tool* ($\Phi$), Ch 3 *uses it* to build explicit solution formulas, and then goes on to MVP, max principles, Harnack — qualitative theory that doesn't need $\Phi$ directly.
4. **Ch 4** — Perron's method, barriers: existence for the Dirichlet problem on general (non-explicit) domains, where an explicit Green's function isn't available.
5. **Ch 5** — generalize from $\Delta$ to general $Lu = -\sum a_{ij}\partial_i\partial_j u+\sum b_i\partial_i u+cu$; generalize the max-principle machinery (Ch 3–4's qualitative toolkit) to this broader class. Still classical solutions conceptually, but no more explicit formulas (no analogue of Ch 2–3's $\Phi$/$G$ for general $L$) — this is *why* the course pivots to weak solutions next.
6. **Ch 6–7** — full switch to weak/distributional framework: Sobolev spaces, Lax–Milgram ⟹ existence+uniqueness of weak solutions for **linear** elliptic PDEs in one abstract stroke, replacing the explicit-formula approach of Ch 2–3 (which only worked for $\Delta$) with an FA argument that works for any bounded-coercive $L$. Dirichlet principle: for self-adjoint operators, weak solution ⟺ minimizer of an energy functional.
7. **Ch 8** — generalize past linearity: Direct Method (coercivity + reflexivity + convexity⟹weak lsc) gives existence for **convex nonlinear** problems (Euler–Lagrange equations of convex energies) that Lax–Milgram can't reach.
8. **Ch 9** — practical computation: finite elements (Galerkin in finite-dim subspaces of $H_0^1$).
9. **Ch 10** — what does $u\in H^1$ actually buy in classical terms? Sobolev embeddings.
10. **Ch 11–12** — payoff: weak solutions are actually smooth (as smooth as data allows). Regularity theory.

**One-liner:** *"Ch 2's Fourier transform builds the fundamental solution; Ch 3 uses it for explicit representation formulas (Green's function) — but this only works for $\Delta$. From Ch 5 on, explicit formulas run out, so the course pivots to weakening the solution concept and getting existence cheaply via FA (Lax–Milgram, then Direct Method for nonlinear/convex problems); it then proves regularity theorems that upgrade these weak solutions back to classical ones."*

**Variational connection (Dirichlet principle):**
Weak form $a(u,v)=\int fv\ \forall v$ comes from $E(u)=\tfrac12 a(u,u)-\langle f,u\rangle$ **iff $a$ is symmetric** (self-adjoint operator). $u$ minimizes $E$ ⟺ $u$ is a critical point of $E$ ⟺ Gateaux derivative vanishes ⟺ weak formulation holds. Classical instance ($-\Delta u=f$) = **Dirichlet principle**; Ch 8 generalizes it to convex nonlinear energies.

**Lax–Milgram vs. Direct Method:** Lax–Milgram needs *bilinearity* → only linear PDEs. Direct Method only needs convexity+coercivity → covers nonlinear-but-convex PDEs (p-Laplacian etc.) that arise as Euler–Lagrange equations of convex functionals. Lax–Milgram = special case of Direct Method for quadratic convex functionals.

---

## Ch 1–2: Classification, Distributions, Fourier

**Ellipticity.** Principal part matrix $A(x)=(a_{ij}(x))$, symmetric.
- Elliptic at $x$: $\sum a_{ij}(x)\xi_i\xi_j>0\ \forall \xi\ne0$.
- Elliptic on $\Omega$: elliptic at every point.
- **Uniformly elliptic**: $\exists\lambda>0$ (indep. of $x$) with $\sum a_{ij}(x)\xi_i\xi_j\ge\lambda|\xi|^2$ for all $x,\xi$. — This is the version actually used in theorems (max principles, Lax-Milgram coercivity).

**Distributions.** Test functions $C_c^\infty(\Omega)$: compactly supported ⟹ boundary terms vanish in IBP. A distribution = continuous linear functional on test functions. Regular distribution: $T_u(\varphi)=\int u\varphi$ for locally integrable $u$.

**Distributional derivative:** $D^\alpha T(\varphi):=(-1)^{|\alpha|}T(D^\alpha\varphi)$. For classical $u$: matches IBP, so $T_u' = T_{u'}$.

**Weak derivative:** $u$ is weakly differentiable if its distributional derivative is itself a regular distribution (associated to a locally integrable function $v$), i.e. $\int v\varphi = -\int u\varphi'\ \forall\varphi$.

**Fourier transform:** $\mathcal F(\partial^\alpha f)(\xi)=(i\xi)^\alpha\hat f(\xi)$ — turns differentiation into multiplication. Only works on $\mathbb R^n$ (no boundary conditions). Used to **derive** the fundamental solution: $-\Delta\Phi=\delta \Rightarrow |\xi|^2\hat\Phi=1 \Rightarrow$ invert via convolution theorem.

---

## Ch 3: Laplace Equation — Core Theory

**Fundamental solution** $\Phi:\mathbb R^n\setminus\{0\}\to\mathbb R$, locally integrable, $-\Delta\Phi=\delta$ distributionally.
$$\Phi(x)=\begin{cases}-\frac{1}{2\pi}\ln|x| & n=2\\ \frac{1}{n(n-2)\omega_n}|x|^{2-n} & n\ge3\end{cases}$$
**Derivation (know this):** radial ansatz $\Phi=\phi(r)$ ⟹ ODE $\phi''+\frac{n-1}{r}\phi'=0$ ⟹ $\phi(r)=c_1+c_2 r^{2-n}$ (or $\log$); fix $c_1=0$ (decay); fix $c_2$ by punching hole $B_\varepsilon(0)$, divergence theorem, forcing integral $=1$ as $\varepsilon\to0$.

**Green's function:** $G(x,y)=\Phi(x-y)-\varphi_y(x)$, where corrector $\varphi_y$ is **harmonic in $\Omega$** and **matches $\Phi(\cdot-y)$ on $\partial\Omega$** ⟹ $G(\cdot,y)=0$ on $\partial\Omega$. Symmetric: $G(x,y)=G(y,x)$. Needed because $\Phi$ alone has no reason to vanish on $\partial\Omega$; subtracting the harmonic corrector fixes the boundary condition without changing the singularity. Method of images: place mirror singularity outside $\Omega$ (half-space: reflection; ball: inversion $\tilde x = R^2x/|x|^2$).

**Mean Value Property.** For $\overline{B_r(x)}\subset\Omega$:
$$u(x)=\frac{1}{n\omega_n r^{n-1}}\int_{\partial B_r(x)} u\,dS = \frac{1}{\omega_n r^n}\int_{B_r(x)} u\,dy$$
**Iff theorem:** $u\in C(\Omega)$ is harmonic **iff** MVP holds for *every* ball $\overline{B_r(x)}\subset\Omega$. Nontrivial: hypothesis is mere *continuity*, conclusion includes smoothness ($C^\infty$) — proved via mollification ($u*\eta_\varepsilon=u$ using MVP).

**Weak Max Principle** ($u\in C^2(\Omega)\cap C(\overline\Omega)$, $\Delta u\ge0$ subharmonic, $\Omega$ bounded):
$$\max_{\overline\Omega}u=\max_{\partial\Omega}u$$
Proof idea: $\varepsilon|x|^2$-perturbation trick to force strict inequality, then $\varepsilon\to0$.

**Strong Max Principle** ($\Omega$ connected!): interior max ⟹ $u\equiv$ const on that component. Proof idea: MVP forces $u\equiv M$ on any ball around the max point; connectedness propagates this to all of $\Omega$.

**Uniqueness for Poisson problem:** apply weak max principle to $w=u_1-u_2$ and $-w$.

**Liouville:** bounded harmonic on all of $\mathbb R^n$ ⟹ constant (Cauchy estimate on gradient, send $r\to\infty$).

---

## Ch 4: Perron's Method

- **Subharmonic:** $\Delta u\ge0$ (comparison-principle definition for non-$C^2$ functions too).
- **Perron solution:** $u(x):=\sup\{v(x): v \text{ subharmonic}, v|_{\partial\Omega}\le g\}$.
- Harmonicity of $u$ inside $\Omega$: via harmonic lifts (replace $v$ by harmonic function on small balls, still subharmonic candidate).
- **Boundary regularity via barriers:** need barrier function $w_{x_0}$ at boundary point $\xi=x_0$: superharmonic, $w(\xi)=0$, $w>0$ elsewhere near $\xi$ (relative to $\Omega$) — clamps $u\to g(x_0)$. Existence of barrier needs e.g. exterior sphere condition ⟹ **regular point**.

---

## Ch 5: General Elliptic Operators

$$Lu = -\sum a_{ij}\partial_i\partial_j u + \sum b_i\partial_i u + cu \quad \text{(note leading minus sign!)}$$

**Weak max principle:** needs $c\ge0$. Bound: $\max_{\overline\Omega} u \le \max(\max_{\partial\Omega}u,\ 0)$ — the extra "$,0$" is *because* of the $c\ge0$ requirement.

**Core mechanism (know deeply):** interior max ⟹ $Du=0$, $D^2u\le0$ ⟹ combined with (uniform) ellipticity this makes the second-order part of $Lu$ $\le 0$; with $c\ge0$ and $u(x_0)\ge$ (relevant sign), get a sign contradiction against $Lu\le0$ assumption.

**Strong max principle:** needs connectedness — ensures $\{u<M\}$'s boundary touches $\{u=M\}$ inside $\Omega$.

**Hopf's Lemma.** Hypotheses:
- $Lu\le0$ in $\Omega$ (with minus-sign convention), $u\in C^2(\Omega)$, $C^1$ near $x_0$.
- $x_0\in\partial\Omega$: **strict** boundary max, $u(x_0)>u(x)\ \forall x\in\Omega$.
- **Interior ball condition**: $\exists$ ball $B\subset\Omega$ with $x_0\in\partial B$.
- Operator uniformly elliptic, coefficients bounded, $c\ge0$, and $u(x_0)\ge0$.

Conclusion: $\dfrac{\partial u}{\partial\nu}(x_0)>0$ (strict outward normal derivative).

Proof idea: barrier $v(x)=e^{-\alpha|x-x_c|^2}-e^{-\alpha\rho^2}$ on the interior ball, comparison via weak max principle. Used to prove the **strong max principle**: assume interior max not attained everywhere, use connectedness to find boundary point of $\{u<M\}$ inside $\Omega$, fit interior ball, apply Hopf ⟹ strictly positive normal derivative — but gradient must vanish at an interior max of the set, contradiction.

---

## Ch 6–7: Sobolev Spaces, Weak Solutions, Lax–Milgram

**Problem:** $-\Delta u=f$ in $\Omega$, $u=0$ on $\partial\Omega$, $f\in L^2$.

**Weak formulation** (multiply by test fn, IBP, boundary term vanishes by compact support):
$$\int_\Omega \nabla u\cdot\nabla v\,dx = \int_\Omega fv\,dx \quad \forall v\in H_0^1(\Omega)$$

**Sobolev space:** $H^1(\Omega)=\{u\in L^2:\nabla u\in L^2\}$, Hilbert space.

**$H_0^1(\Omega) := \overline{C_c^\infty(\Omega)}^{\|\cdot\|_{H^1}}$** — closure, NOT literally compactly-supported $H^1$ functions (limits of compactly-supported functions need not stay compactly supported). Correct characterization: functions with **trace zero** on $\partial\Omega$. Closed subspace of $H^1$ ⟹ itself Hilbert.

**Lax–Milgram.** $H$ Hilbert, $a(\cdot,\cdot)$ bilinear form, $L$ linear functional. If:
- $a$ **bounded**: $|a(u,v)|\le C\|u\|\|v\|$
- $a$ **coercive**: $a(u,u)\ge\alpha\|u\|^2$
- $L$ bounded: $|L(v)|\le C\|v\|$

then $\exists!\ u\in H$ with $a(u,v)=L(v)\ \forall v$. (Generalizes Riesz representation — Riesz is the symmetric case $a=\langle\cdot,\cdot\rangle$.)

**Applied to Poisson:** $a(u,v)=\int\nabla u\cdot\nabla v$; boundedness via Cauchy-Schwarz; coercivity via **Poincaré inequality** (needs $\Omega$ bounded) — coercivity is essentially uniform ellipticity in disguise.

**Trace theorem:** density of smooth fns in Sobolev spaces + boundary $L^p$-norm bounded by Sobolev norm ⟹ restriction-to-boundary map extends by continuity (Cauchy sequence argument) to all of $H^1$.

---

## Ch 8: Convex Variational Problems

**Setup:** $S(u)=\int_\Omega f(x,Du)\,dx$, minimize over $H_0^1(\Omega)$.

**Theorem:** if $f(x,\cdot)$ convex + coercive ($f(x,v)\ge-\gamma(x)+\kappa|v|^2$, $\gamma\in L^1$) + measurable, then $S$ attains its minimum.

**Direct Method (4 steps — know this):**
1. Minimizing sequence $u_n$, $S(u_n)\to m=\inf S$.
2. **Coercivity** ⟹ $\{u_n\}$ bounded in $H_0^1$.
3. **Reflexivity** of $H_0^1$ ⟹ weakly convergent subsequence $u_n\rightharpoonup u$.
4. **Weak lsc** (from convexity) ⟹ $S(u)\le\liminf S(u_n)=m$ ⟹ $S(u)=m$.

**Why convexity ⟹ weak lsc:** sublevel sets $\{S\le c\}$ convex + strongly closed ⟹ weakly closed (Hahn–Banach separation) ⟹ weak lsc by definition. Intuition: convex functionals can't "hide" energy in oscillations that weak convergence lets pass undetected (contrast: $-\|u\|^2$ fails lsc — rewards spreading).

**Uniqueness:** strict convexity ⟹ unique minimizer via **midpoint trick**: $u_1\ne u_2$ both minimizers ⟹ $S(\frac{u_1+u_2}2)<\frac12 S(u_1)+\frac12S(u_2)=m$, contradiction.

**Example:** p-Dirichlet energy $F(u)=\int\frac1p|\nabla u|^p$ — convex (convex fn $t\mapsto\frac1p|t|^p$ composed with linear $\nabla$), coercive in $H_0^{1,p}$. E–L equation: p-Laplacian.

**From PDE to functional:** weak form $\int a(x,Du)\cdot Dv = \int fv$ is variational (comes from some $S$) **iff** $a(x,\cdot)$ is a gradient field: $a=D_v f$ for some potential $f$. Not all elliptic operators are variational this way (analogous to not all matrices being symmetric).

**Why Direct Method > Lax–Milgram:** Lax–Milgram needs *bilinearity* (only linear PDEs); Direct Method only needs convexity+coercivity, covering genuinely nonlinear PDEs (p-Laplacian etc.) as long as they're Euler–Lagrange equations of convex functionals.

---

## Ch 9: Finite Elements *(low priority — light pass only)*

Discretize $H_0^1$ into finite-dim subspaces $V_h$ (piecewise polynomial basis functions), solve the Galerkin problem $a(u_h,v_h)=L(v_h)\ \forall v_h\in V_h$ — reduces to a linear system. Practical/computational counterpart to the abstract existence theory of Ch 6–8.

---

## Ch 10: Embedding Theorems

**Big picture:** $u\in H^1$ (or $W^{k,p}$) — what classical regularity/integrability follows? Governed by comparing $k$ (or $1$) against $n/p$.

**Gagliardo–Nirenberg–Sobolev** ($p<n$): $\|u\|_{L^{p^*}}\le C\|Du\|_{L^p}$, Sobolev conjugate $p^*=\frac{np}{n-p}$ — found via scaling argument ($u_\lambda(x)=u(\lambda x)$) to make inequality scale-invariant. Holds on all $\mathbb R^n$. Gives embedding $W^{1,p}(\mathbb R^n)\hookrightarrow L^{p^*}(\mathbb R^n)$.
*Proof idea:* FTC bounds $u$ by integral of each partial derivative; multiply the $n$ bounds, apply Hölder.

**Poincaré inequality:** like G-N but on **bounded** domains, $u$ compactly supported (or $H_0^1$); constant depends on domain; exponent $p$ **not** constrained by $n$ (unlike G-N).

**Morrey's inequality** ($p>n$): $u\in W^{1,p}(\mathbb R^n)$ has a continuous representative, Hölder continuous with exponent $\gamma=1-n/p$:
$$\|u\|_{C^{0,\gamma}}\le C(n,p)\|u\|_{W^{1,p}}$$
*Proof idea:* Hölder's inequality ⟹ geometric series in radii $r^{1-n/p}$, converges **only because** $p>n$; Poincaré controls oscillation on a ball by the gradient.

**Rellich–Kondrachov (compactness):** for bounded $\Omega$, the embedding $H^1(\Omega)\hookrightarrow L^q(\Omega)$ is **compact** for $q<p^*$ (strict!) — bounded sequences in $H^1$ have subsequences converging **strongly** in $L^q$. Key tool for upgrading weak to strong convergence (e.g., in variational/regularity arguments). Proof idea: mollify to apply Arzelà–Ascoli, control mollification error via Hölder (needs strict $q<p^*$).

*Note: $H_0^1$ is NOT "compactly supported $H^1$ functions" — it's the closure of $C_c^\infty$ under $H^1$-norm; limits need not retain compact support. Correct characterization: trace-zero on $\partial\Omega$.*

---

## Ch 11–12: Regularity Theory *(weakest area — statement + intuition level only)*

**Motivation:** existence of weak solutions ($H^1$) is cheap via Lax-Milgram/Direct Method, but says nothing about smoothness. Regularity theory shows weak solutions are actually as smooth as the data allows — closing the loop back to classical solutions.

**Key tools/topics to know at statement level:**
- **Cacciopoli inequality** — energy estimate: controls $\|\nabla u\|_{L^2}$ on a smaller ball by $\|u\|_{L^2}$ on a larger ball (no derivatives of $u$ needed on the RHS) — the basic energy estimate regularity bootstrapping relies on.
- **Difference quotients** — technique to show weak derivatives exist/are bounded by estimating $\frac{u(x+he_i)-u(x)}{h}$ in $L^2$, avoiding differentiating the equation directly; used to prove interior $H^2$ regularity.
- **Interior $H^2$ regularity → boundary regularity → higher regularity ($H^k$, $C^\infty$)**: bootstrapping — more regular data ⟹ more regular solution, iterated.
- **De Giorgi–Nash–Moser theory**: for elliptic equations in *divergence form* with only **bounded measurable** (not necessarily continuous) coefficients, weak solutions are still **Hölder continuous**. This is the deep result circumventing the classical Schauder theory's need for continuous coefficients.
- **Moser iteration**: technique (iterated Caccioppoli + Sobolev embedding, bootstrapping $L^p$ exponents) proving boundedness/continuity of solutions.
- **Harnack inequality** (Moser): for nonneg. solutions, $\sup_{B_r} u \le C \inf_{B_r} u$ — quantitative strengthening of strong max principle idea, robust even with rough coefficients.

**Big-picture framing for exam:** "Regularity theory is the payoff of the whole course — after cheaply getting existence of weak ($H^1$) solutions via functional analysis, De Giorgi–Nash–Moser theory shows these weak solutions are automatically Hölder continuous even for very rough (merely bounded, measurable) coefficients — recovering meaningful classical behavior without needing smooth coefficients."

*(Budget most remaining study time here — go for statement + one-sentence intuition per tool, not full proofs.)*

---

## Quick Cross-Reference: Sign/Hypothesis Gotchas
- $L$ has **leading minus sign**: $Lu=-\sum a_{ij}\partial_{ij}u+\dots$
- Weak/strong max principle for general $L$ needs **$c\ge0$**; bound becomes $\max(\max_{\partial\Omega}u,0)$.
- Strong max principle needs **connectedness**.
- Hopf needs **interior ball condition** + **strict** boundary max + $u(x_0)\ge0$ (general operator case).
- $H_0^1$ = closure of $C_c^\infty$, **not** literally compact support.
- Rellich–Kondrachov needs **strict** $q<p^*$.
- Direct Method needs convexity (weak lsc) + coercivity + reflexivity — no bilinearity required, unlike Lax–Milgram.