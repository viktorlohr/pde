# PDE notes - conceptual overview
- [PDE notes - conceptual overview](#pde-notes---conceptual-overview)
  - [Introduction](#introduction)
    - [Laplacian](#laplacian)
    - [Boundary Conditions](#boundary-conditions)
    - [Heat Equation](#heat-equation)
  - [Schwartz Space and Distributions](#schwartz-space-and-distributions)
    - [Test Functions and Schwartz Space](#test-functions-and-schwartz-space)
    - [Distributions](#distributions)
    - [Tempered Distributions](#tempered-distributions)
    - [Regular Distributions](#regular-distributions)
    - [The Distributional Derivative](#the-distributional-derivative)
    - [Weak Derivatives](#weak-derivatives)
    - [Other Operations on Distributions](#other-operations-on-distributions)
    - [Fourier Transform](#fourier-transform)
    - [Qualitative Aspects](#qualitative-aspects)
  - [Fundamental Solutions and Green's Functions](#fundamental-solutions-and-greens-functions)
    - [Motivation](#motivation)
    - [The Fundamental Solution](#the-fundamental-solution)
  - [Weak Solutions and Sobolev-Spaces](#weak-solutions-and-sobolev-spaces)
    - [Trace Theorem](#trace-theorem)
    - [Gagliardo-Nirenberg Inequality](#gagliardo-nirenberg-inequality)

>[!CAUTION]
> This document is by no means meant to be a rigorous script. It should merely serve as an overview.

## Introduction

An ordinary differential equation involves
derivatives with respect to *only one* variable.

>[!NOTE]
> A **partial differential equation** (PDE) is a differential equation containing **multiple variables**.

The *Order* of a PDE is the highest order of 
the derivatives contained in it. We will focus 
**mostly** on **second order** PDEs.
  - A **first-order** PDE typically tracks things like **velocity**. 
  - A **second-order** PDE typically tracks things like **acceleration** or **curvature**.

### Laplacian
>[!NOTE]
> The **Laplace Operator** $\Delta$ is defined as the sum over all **unmixed second partial derivatives** of a function. 

The Laplacian is the **divergence of** the **gradient**. It **measures how much** the **value** of a function at   a specific point **deviates from** the **average** value of its immediate **neighbours**.

>[!NOTE]
> A function $u$ satisfying the **Laplace Equation** $\Delta u = 0$ is called **harmonic**.

Intuitively, the **Laplacian behaves like** the **second order derivative** in one dimension. If a point is **higher** than its neighbours, then the Laplacian will be **negative** (downward curvature) and vice versa.

>[!NOTE]
> An equation of the form $\Delta u = f$ is called **Poisson Equation.**

### Boundary Conditions
A PDE on its own has infinitely many solutions. 
**Boundary conditions** are used to **"pin down" unique solutions**.
Two of the most important boundary conditions are
>[!NOTE]
> - **Dirichlet** Boundary Conditions: Our **solution** shall **coincide** **with** a **function** **on the boundary** of the domain $\Omega$, so 
  $u(x) = g(x)$ on the boundary $\partial\Omega$.
> - **Neumann** Boundary Conditions: We **fix** the **normal outward derivative** (the slope pointing out of the domain) 
  $\frac{\partial u}{\partial\nu} = g(x)$ for all $x\in\partial\Omega.$ 

### Heat Equation
The *Heat Equation* is of the form $u_t = \Delta u$, where $u_t$ is the rate of temperature change. The rate of temperature change will eventually be zero. Therefore, **for large $t$** the equation **becomes** the **Laplace Equation**.

If a point is hotter than its surroundings, meaning $\Delta u(p) < 0$, then heat will flow away from it.


## Schwartz Space and Distributions

Classical derivatives require point-by-point differentiability. If a function has a sharp corner or a jump discontinuity, its classical derivative fails to exist at that point. To solve PDEs with realistic, rough behaviors, we must stop evaluating functions point-by-point and instead study how they behave *on average* when **integrated against smooth test functions**.

### Test Functions and Schwartz Space
The **Space of Test Functions $C_c^\infty(\Omega)$** consists of **smooth** (infinitely differentiable) functions with **compact support**. 

>[!TIP]
> Remember that compact support means that **boundary terms vanish during integration by parts**. 
> Because the support of $\phi$ is fully contained within $\Omega$, the function $\phi$ (and all its derivatives) are identically zero on and near the boundary $\partial\Omega$. Thus, all boundary evaluations drop out completely.

The **Schwartz Space** $\mathcal{S}$ consists of **rapidly decreasing functions** that decay to zero faster than any polynomial can grow. They have "**almost compact support**". A standard example is the Gaussian bell curve $e^{-x^2}$. Boundary term vanish here also.

### Distributions
In physical reality we often find possible "rough" solutions to PDEs that are actually not differentiable in the classical sense.
Instead of looking at a rough function $u$ directly, we view it as a **Distribution** $T_u$. A **distribution** is a continuous, linear **functional** that **acts on** a smooth **test function** $\phi$ and outputs a single real number.

### Tempered Distributions
The dual space of the Schwartz space $\mathcal{S}$ is denoted by $\mathcal{S}'$. An element of this dual space is called a **tempered distribution**.

>[!NOTE]
> Because $\mathcal{S}$ contains functions that do not have compact support, $\mathcal{S}'$ is a *smaller* (more restrictive) space of distributions than the general space $\mathcal{D}'(\mathbb{R}^n)$ (which is the dual of $C_c^\infty$).

### Regular Distributions
>[!NOTE]
> For a **locally** **integrable** function $u$, the ***associated distribution*** is the linear functional
> $$T_u\colon \phi\mapsto\int u\phi,$$
> where $\phi$ is &ndash; as always &ndash; a test function. A distribution that arises from such an association is called **regular**.

There are distributions which are *not* locally integrable. The most famous example is the **Dirac-Delta Distribution**. It evaluates a test function at a single point:
$$\delta\colon \phi\mapsto \phi(0).$$

>[!NOTE]
> The Dirac-Delta Distribution represents a **point mass** or an **instantaneous** impulse. It is concentrated at a **single point**.
> 

### The Distributional Derivative
>[!TIP]
> **Idea**: **We define derivatives via Integration by parts**.
> For differentiable $u$, we integrate $u' \phi$ by parts. 
> Because a test function $\phi$ has compact support, the boundary term vanishes and we are left with $\int u'\phi = -\int u \phi'.$ 
> Now lets say $u$ is *not* differentiable but some function **$v$ satisfies**
> $$\int v\phi = -\int u\phi'.$$ 
> Then we say that $v$ is a **distributional derivative** of $u$. 


We define the $\alpha$-th derivative $D^{\alpha}T$ of a distribution $T$ by

$$D^\alpha T\colon\phi\mapsto (-1)^{|\alpha|} T(D^\alpha \phi)$$

Because $\phi$ belongs to $C_c^\infty$ or $\mathcal{S}$, its derivative $D^\alpha\phi$ is guaranteed to exist. We are now able to **"differentiate rough functions."**

>[!IMPORTANT]
> In one dimension the definition becomes
> $$T'\colon\phi\mapsto - T\phi'.$$
> When $T=T_u$ is an associated distribution to a classically differentiable function $u$, the formula becomes *exactly* the integration by parts equation we discussed above and $T_u' = T_{u'}$, i.e. the **derivative** **of** the **associated** **distribution** **is** exactly the **distribution** **associated** **with** the **derivative**: 
> $$T_u'\phi = - T_u \phi' = - \int u \phi' = \int u' \phi = T_{u'}\phi.$$

Let's try to find a distributional derivative of the Dirac-Delta. We just follow the definition:
$$\delta'\phi = -\delta\phi' = -\phi'(0).$$
So the distributional derivative of the Dirac-Delta is a linear functional that evaluates a test function's *derivative* at a point and negates it.


### Weak Derivatives
> [!NOTE]
> A function is **weakly differentiable** if it is distributionally differentiable and its **distributional derivative** is associated with a locally **integrable** function.

Let's try to find a weak derivative of the absolute value function $u\colon x\mapsto \vert x |$. In order to do that we need to find a fitting candidate first. The obvious one would be the Signum Function

$$v\colon x\mapsto\begin{cases}
  -1 &x < 0 \\
  +1 &x > 0.
\end{cases}$$

(Note that it does not matter if we do not define it at zero since $\{0\}$ is a set of measure zero)

Let's see if it fits the definition:

$$T_v\phi = \int v\phi
= \int_{-\infty}^0 v\phi + \int_0^{\infty} v\phi 
= \int_{-\infty}^0 -\phi + \int_0^{\infty} \phi. $$

Integrating $x\phi$ by parts, this is equal to

$$-[x\phi]_{-\infty}^{0} + \int_{-\infty}^0 x\phi' + [x\phi]_0^{\infty} - \int_0^{\infty} x \phi'.$$

The boundary terms vanish because test functions tend to zero as $x\rightarrow\infty$, and $\phi(0)$ gets multiplied with zero. For negative $x$ we have $x= -\vert x\vert$. Therefore, the equation concludes to
$$T_v\phi = - \int_{-\infty}^0 |x|\phi' - \int_0^{\infty} |x|\phi' = - \int |x|\phi' = - T_u \phi'.$$

By definition this means that $T_v = T_u'.$ 

### Other Operations on Distributions
One can check that 
- $(\psi T)\phi := T(\psi\cdot \phi)$ and
- $(\psi\ast T)\phi := T(\psi(-\_ ) \ast \phi)$

are well-defined. Remember that "$\ast$" is *convolution* 
$f\ast g := \int f(y)(\_-y)dy.$ 

>[!WARNING]
> For *distributions* $T$ and $S$, operations like $T\cdot S$ or $T\ast S$ are ***not*** well-defined!


### Fourier Transform
The **Fourier Transform** **maps** a function **from** the **spatial** domain **into** the **frequency** **domain**. It **decomposes** a **signal** **into** its constituent **pure** **tones**. For solving PDEs, its core value lies in its ability to **turn** **differentiation** **into multiplication**.

>[!TIP]
> The power of the Fourier Transform lies in **swapping differentiation with multiplication** which is due to the elementary fact that
> $$\frac{d}{dx}e^{ax} = ae^{ax}.$$
> This allows us to "get rid of" differentials and replace them with nice multiplication.

For a function $f \in \mathcal{S}$, the **Fourier Transform** $\mathcal{F}f$ (or $\hat{f}$) and its **Inverse Fourier Transform** $\overline{\mathcal{F}}\hat{f}$ are defined as:
$$\mathcal{F}f(p) = \frac{1}{(2\pi)^{\frac{n}{2}}}\int_{\mathbb{R}^n} e^{-ipx}f(x)\,d^nx,$$

$$\quad \overline{\mathcal{F}}\hat{f}(x) = \frac{1}{(2\pi)^{\frac{n}{2}}}\int_{\mathbb{R}^n} e^{+ipx}\hat{f}(p)\,d^np.$$

>[!NOTE]
> Notice the $-i$ vs. the $+i$ in the exponents. Also, in higher dimensions $px$ is  scalar multiplication of *vectors* $p$ and $x$.

The Fourier transform is a **continuous, linear bijection** **on** the **Schwartz Space** $\mathcal{S}$. This means shifting to frequency space preserves the "nice" decay and smoothness properties of our test functions.

Differentiating a function in space corresponds to multiplying by the frequency variable:
$$\mathcal{F}(D^\alpha f)(p) = (ip)^\alpha \mathcal{F}f(p).$$

>[!TIP]
> For example this allows us to turn the Poisson equation $\Delta u = f$ into an algebraic equation $-\|p\|^2\hat{u}(p) = \hat{f}(p),$ which allows us to solve directly for $\hat{u}$.
ns

For a *tempered* distribution $T \in \mathcal{S}'$, its **Fourier Transform** $\mathcal{F}T$ is defined by:
$$\mathcal{F}T(\phi) := T(\mathcal{F}\phi).$$

### Qualitative Aspects
- **Smoothing vs. Decay**: The smoothness of a function determines the decay rate of its transform at infinity. If $f$ is smooth, its Fourier transform $\hat{f}$ drops off rapidly. If a function is sharply concentrated in space, its transform is highly spread out (Heisenberg Uncertainty Principle).
- **Plancherel Isometry**: The Fourier transform preserves the $L^2$-norm.
- **Convolution Theorem**: Convolution in space simplifies to point-wise multiplication in frequency: $\mathcal{F}(f * g) = (2\pi)^{\frac{n}{2}} \hat{f} \cdot \hat{g}$.
- **Transform of the Dirac-Delta**: A point mass in space transforms into a uniform constant in frequency: $\mathcal{F}\delta = (2\pi)^{-\frac{n}{2}}$. This means that an instantaneous impulse contains all frequencies in equal measure.


## Fundamental Solutions and Green's Functions

### Motivation
The **Fourier Transform** is powerful, but it **only works** when our domain is the **entire**, unbounded **space $\mathbb{R}^n$**. 
To solve Laplace Equations on bounded domains, we **calculate** the response to a single, **isolated point mass** at the origin ($-\Delta\Phi = \delta$). The resulting spatial function is called the **Fundamental Solution**. This function becomes our new building block allowing us to construct solutions &ndash; so called  **Green's Functions**.

### The Fundamental Solution

> [!NOTE]
> A **Fundamental Solution** of the Laplace Equation is a locally integrable function $\Phi \colon \mathbb{R}^n \setminus \{0\} \to \mathbb{R}$ that satisfies the equation 
> $$-\Delta \Phi = \delta.$$
> in the sense of distributions. This means that for every test function $\phi$, we have:
> $$T_\Phi(-\Delta\phi) = \int_{\mathbb{R}^n} \Phi (-\Delta \phi) = \phi(0).$$

Via the Fourier Transform one can calculate that

$$
\Phi(x) = \begin{cases} 
-\frac{1}{2\pi} \ln\|x\| & \text{if } n = 2, \\ 
\frac{1}{n(n-2)\omega_n} \frac{1}{\|x\|^{n-2}} & \text{if } n \geq 3,
\end{cases}
$$

where $\omega_n$ denotes the volume of the $n$-dimensional unit ball in $\mathbb{R}^n.$

>[!TIP]
> Since the Fundamental Solution has a singularity at the origin, proving the equality involves **"punching a hole"** $B_\varepsilon(0)$ in the origin and considering the limit of the integral as $\varepsilon\rightarrow 0.$ This, together with **integration by parts**,  are considered **standard tricks.**



## Weak Solutions and Sobolev-Spaces
### Trace Theorem
>[!NOTE]
> The **Trace Theorem** **solves** the problem of not being able to **evaluate** an equivalence class of functions **on** the **boundary** of a domain in a well-defined manner.

Since smooth functions are dense in the Sobolev Space, we can approximate a Sobolev function by smooth functions. 
One can show that the $L^p$-norm of these functions on the boundary is bounded by the Sobolev-Norm. Therefore the sequence of smooth functions, restricted to the boundary (restriction is well-defined for smooth functions), is a Cauchy-Sequence which has a limit in the Banach-Space $L^p$ on the boundary. We define $T^u$ to be that limit.

>[!TIP]
> We used the densitiy of smooth functions in Sobolev Spaces to find a well-defined restriction on the boundary.

### Gagliardo-Nirenberg Inequality
The derivatives control the slopes of the function. By bounding the $L^p$ norm of the gradient, we restrict how fast the function can grow or spike. This makes it "more integrable", i.e. an element of even higher order $L^q$ space. test

>[!NOTE]
> A main application of this inequality is the ability to *embed Sobolev functions* in higher order $L^q$ spaces.





