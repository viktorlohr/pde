# PDE notes - conceptual overview

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

The Laplacian is the **divergence of** the **gradient**. It **measures how much** the **value** of a function at   a specific point **deviates from** the **avarage** value of its immediate **neighbours**.

>[!NOTE]
> A function $u$ statisfying the **Laplace Equation** $\Delta u = 0$ is called **harmonic**.

Intuitively, the **Laplacian behaves like** the **second order derivative** in one dimension. If a point is **higher** than its neighbours, then the Laplacian will be **negative** (right curvature) and vice versa.

>[!NOTE]
> An equation of the form $\Delta u = f$ is called **Poisson Equation.**

### Boundary Conditions
A PDE on its own has infinitely many solutions. 
**Boundary conditions** are used to **"pin down" unique solutions**.
Two of the most important boundary conditions are
>[!NOTE]
> - **Dirichlet** Boundary Conditions: Our **solution** shall **coincide** **with** a **function** **on the boundary** of the domain $\Omega$, so 
  $u(x) = g(x)$ on the boundary $\partial\Omega$.
> - **Neumann** Boundary Conditions: We **fix** the **normal outer derivative** (the slope pointing out of the domain) 
  $\frac{\partial u}{\partial\nu} = g(x)$ for all $x\in\partial\Omega.$ 

### Heat Equation
The *Heat Equation* is of the form $u_t = \Delta u$, where $u_t$ is the rate of temperature change. The rate of temperature change will eventually be zero. Therefore, **for large $t$** the equation **becomes** the **Laplace Equation**.

If a point is hotter than its surroundings, meaning $\Delta u(p) < 0$, then heat will flow away from it.


## Schwartz Space and Distributions

### The Core Problem
Classical derivatives require point-by-point differentiability. If a function has a sharp corner or a jump discontinuity, its classical derivative fails to exist at that point. To solve PDEs with realistic, rough behaviors, we must stop evaluating functions point-by-point and instead study how they behave *on average* when **integrated against smooth test functions**.

### Test Functions vs. Schwartz Space
To make integration by parts perfectly rigorous, we need "nice" test functions $\phi.$ The 
**Space of Test Functions $C_c^\infty(\Omega)$** consists of **smooth** (infinitely differentiable) functions with **compact support**. 

>[!TIP]
> Remember that compact support means that **boundary terms** **vanish**, i.e. $\int_{\partial\Omega}\phi = 0$.

The **Schwartz Space** $\mathcal{S}$ consists of **rapidly decreasing functions** that decay to zero faster than any polynomial can grow. They have "**almost compact support**". A standard example is the Gaussian bell curve $e^{-x^2}$. Boundary term vanish here also.

### Distributions (Generalized Functions)
In physical reality we often find possible "rough" solutions to PDEs that are actually not differentiable in the classical sense.
Instead of looking at a rough function $u$ directly, we view it as a **Distribution** $T_u$. A distribution is a continuous, linear functional that acts on a smooth test function $\phi$ and outputs a single real number via integration:

$$\langle T_u, \phi \rangle = \int_{\Omega} u(x)\phi(x) \, dx.$$

### The Distributional Derivative
>[!TIP]
> **Idea**: **We define derivatives via Integration by parts**.
> For differentiable $u$, we integrate $u' \phi$ by parts. 
> Because a test function $\phi$ has compact support, the boundary term vanishes and we are left with $\int u'\phi = -\int u \phi'.$ 
> Now lets say $u$ is *not* differentiable but some function **$v$ satisfies** 
> 
> $$\int v\phi = -\int u\phi'.$$ 
>
> Then we say that $v$ is a **distributional derivative** of $u$.

We define the derivative of a distribution $T$ according to the above idea using the symmetry of integration by parts:

$$\langle D^\alpha T, \phi \rangle = (-1)^{|\alpha|} \langle T, D^\alpha \phi \rangle.$$

Because $\phi$ belongs to $C_c^\infty$ or $\mathcal{S}$, its derivative $D^\alpha\phi$ is guaranteed to exist and be perfectly smooth. So we are now able to **"differentiate rough functions."**

### Weak Derivative
> [!NOTE]
> A function is **weakly differentiable** if it is distributionally differentiable and its **distributional derivative** is **integrable**.







## Weak Solutions and Sobolev-Spaces
### Trace Theorem
>[!NOTE]
> The **Trace Theorem** **solves** the problem of not being able to **evaluate** an equivalence class of functions **on** the **boundary** of a domain in a well-defined manner.

Since smooth functions are dense in the Sobolev Space, we can approximate a Sobolev function by smooth functions. 
One can show that the $L^p$-norm of these functions on the boundary is bounded by the Sobolev-Norm. Therefore the sequence of smooth functions, restricted to the boundary (restriction is well-defined for smooth functions), is a Cauchy-Sequence which has a limit in the Banach-Space $L^p$ on the boundary. We define $T^u$ to be that limit.

>[!TIP]
> We used the densitiy of smooth functions to find a well-defined restriction on the boundary.

### Gagliardo-Nirenberg Inequality
The derivatives control the slopes of the function. By bounding the $L^p$ norm of the gradient, we restrict how fast the function can grow or spike. This makes it "more integrable", i.e. an element of even higher order $L^q$ space.

>[!NOTE]
> A main application of this inequality is the ability to *embed Sobolev functions* in higher order $L^q$ spaces.



