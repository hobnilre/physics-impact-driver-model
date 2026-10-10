---
title: "Modeling a Single Rotary Impact"
subtitle: "Synthesized coefficients, an unknown hammer component, and COP"
author: "Hob Nilre & Bo C. Herlin"
date: "2026-10-05"
abstract: |
  A rotary hammer strikes an anvil against a tightened joint. We synthesize
  third- and fourth-derivative coefficients and assign their torque to an
  unknown component inside the hammer. Signed torque–speed integrals give
  the component's supplied or absorbed work and apparent coefficients of
  performance. A separate order comparison shows how a fourth-order scalar
  equation recovers both modes of an ordinary two-inertia collision.
  In calculated impacts with 28.8 J of incoming kinetic energy, the ordinary
  linear model delivers 2.43 J net to the anvil; a stated fourth-order
  hammer model delivers 2.91 J. Doubling its fourth-order weight gives
  35.39 J and an apparent anvil COP of 1.229, accompanied by a growing
  engaged mode. Rebound, joint work and contact release complete the
  ordinary energy account; the unknown component's remaining account
  is a question for measurement.
keywords:
  - rotary impact
  - coefficient synthesis
  - higher-order ordinary differential equations
  - unknown hammer component
  - signed work
  - apparent coefficient of performance
---

\begingroup\scriptsize
\noindent PDF created: \pdfbuildtimestamp\par
\noindent Latest on GitHub: \url{https://github.com/hobnilre/physics-impact-driver-model}\par
\endgroup

# One blow

The interval of interest begins when a rotating hammer meets an anvil and
ends when they separate. The tightened fastener undergoes no gross turning,
but the anvil, socket and joint can twist. That motion determines how much
work reaches the joint and how much returns to the hammer.

We add third- and fourth-derivative torque terms constructed using
[*ODE Coefficient Synthesis* (Nilre and Herlin, 2026a)][synthesis]. Following
[*Energy Ledgers for Forced Harmonic ODEs* (Nilre and Herlin, 2026b)][energy],
we assume that these terms belong to an unknown component inside the hammer.
Its signed power determines whether it supplies or absorbs work. Its physical
identity, capacity and preparation remain open parts of the hypothesis.

Let $\theta_h,\theta_a$ be hammer and anvil angles measured from engagement,
$\omega_h=\dot\theta_h$, $\omega_a=\dot\theta_a$, and
$\delta=\theta_h-\theta_a$ the contact deformation. The resolved inertias are
$J_h,J_a>0$. Positive contact torque $\tau_c$ opposes forward hammer motion
and drives the anvil. During contact,
\begin{equation}
\begin{aligned}
J_h\ddot\theta_h+\tau_c+\tau_X&=\tau_d,\\
J_a\ddot\theta_a&=\tau_c-\tau_j,\\
\tau_j&=k_j\theta_a+c_j\omega_a,\\
\tau_X&=B_3\theta_h^{(3)}+B_4\theta_h^{(4)}.
\end{aligned}
\label{eq:model}
\end{equation}
Here $\tau_d$ is externally applied hammer torque. The socket and tightened
joint are represented together by $k_j,c_j>0$, with the joint reference
fixed. The unknown torque acts at the hammer coordinate, so its power uses
$\omega_h$. Figure \ref{fig:ports} locates these accounts.

![Schematic of the single-impact model. Contact transfers work at two different angular velocities. The unknown component is inside the hammer boundary; positive $P_X$ enters its account. The joint reference is fixed.](figures/impact-ports.pdf){#fig:ports width=100%}

\FloatBarrier

For the reference comparison, $\tau_d=0$, both angles start at zero,
$\omega_h(0)=600\ \mathrm{rad\,s^{-1}}$, and $\omega_a(0)=0$. Elastic stores
are initially zero in this incremental model. The motor's earlier run-up
is represented by the incoming hammer kinetic energy.

# Coefficients and contact

For a positive rotational reference triple $(J_*,c_*,k_*)$, the synthesis
family is
\begin{equation}
A_{r,n}=J_*^{n-1+r}c_*^{2-n-2r}k_*^r,
\qquad r\in\mathbb Z,\quad n\geq0.
\label{eq:family}
\end{equation}
The derivative index is $n$; the integer $r$ selects a dimensionally
admissible monomial. The companion's staircase
$r_n=1-\lceil n/2\rceil$ gives
$A_0=k_*$, $A_1=c_*$, $A_2=J_*$,
$A_3=J_*c_*/k_*$ and $A_4=J_*^2/k_*$
([Nilre and Herlin, 2026a][synthesis], Sections 1--4).
We set
\begin{equation}
B_3=w_3\frac{J_*c_*}{k_*},\qquad
B_4=w_4\frac{J_*^2}{k_*}.
\label{eq:weights}
\end{equation}
The dimensionless weights specify the proposed model. In the examples,
$(J_*,c_*,k_*)=(J_h,c_c,k_c)$ sets reference scales; the resolved hammer
inertia still appears only once in \eqref{eq:model}.

The ordinary linear contact is
\begin{equation}
\tau_c=k_c\delta+c_c\dot\delta.
\label{eq:linear}
\end{equation}
Switched spring–damper contact is used in impact-wrench modeling
([ter Braack and Margolis, 2026][wrench]). We use it until its first
positive-to-negative torque zero, then set $\tau_c=0$. This avoids extending
the contact into tension. The residual spring store at release is accounted
for below.

A nonlinear comparison uses the deformation-dependent damping form of
[Hunt and Crossley (1975)][hc]:
\begin{equation}
\tau_c=H\delta^{3/2}(1+\alpha\dot\delta),\qquad \delta\geq0.
\label{eq:nonlinear}
\end{equation}
This is a local rotary approximation to a Hertz-type contact at a constant
lever arm $R$: displacement $R\delta$ and torque $R F$ give
$H=K R^{5/2}$ from a normal stiffness coefficient $K$.
It represents that assumed contact geometry. Choose
$H=k_c/\sqrt{\delta_r}$ and $\alpha=c_c/(k_c\delta_r)$, with
$\delta_r=0.040\ \mathrm{rad}$. Elastic torque and the damping slope then
match \eqref{eq:linear} at $\delta_r$. Separation is the first returning
zero of $\delta$; $1+\alpha\dot\delta$ stays positive in all reported runs.

The ordinary comparisons set $B_3=B_4=0$. The proposed third-order hammer
sets $(w_3,w_4)=(1/2,0)$, and the proposed fourth-order hammer uses
$(1/2,1/10)$, both with \eqref{eq:linear}. A coefficient sensitivity doubles
$w_4$ to $1/5$. These are declared illustrative weights, with no fit to
measurements or target COP. The coupled third- and fourth-order models
have five and six motion states respectively.

Extra order requires extra initial data. For the linear-contact examples,
\begin{equation}
\ddot\theta_h(0)=-\frac{c_c\omega_h(0)}{J_h},\qquad
\theta_h^{(3)}(0)=0\quad\text{for fourth order}.
\label{eq:initial}
\end{equation}
These choices start the unknown torque at zero; the governing equation
sets the next derivative. At separation, body angles and velocities remain
continuous, and the contact-activated higher-order law ends. Endpoint
derivatives in its work integral are taken immediately before release.
The unknown component's post-contact state belongs to its remaining account.

The added terms have both coefficients and preparation conditions. Specifying
incoming speed alone does not specify the higher-order blow.

# What fourth order recovers

Before interpreting an unknown contribution, it is useful to establish why
fourth order appears in a rotary collision at all. Set $\tau_X=\tau_d=0$
and use the linear contact. Eliminating the anvil coordinate from the two
ordinary equations gives the exact engaged equation
\begin{equation}
\begin{aligned}
J_hJ_a\theta_h^{(4)}
&+[J_h(c_c+c_j)+J_ac_c]\theta_h^{(3)}\\
&+[J_h(k_c+k_j)+J_ak_c+c_cc_j]\ddot\theta_h\\
&+(c_ck_j+c_jk_c)\dot\theta_h+k_ck_j\theta_h=0.
\end{aligned}
\label{eq:elimination}
\end{equation}
Dividing \eqref{eq:elimination} by $k_*$ gives torque-equation units; its
coefficients can then be expressed as weighted members of \eqref{eq:family}.
Its extra initial data are fixed by the eliminated anvil state. This scalar
representation and the proposed hammer component in \eqref{eq:model} have
different physical assignments: the latter adds a new torque to the
resolved two-body equations.

For the parameters in Table \ref{tab:parameters}, the ordinary reference has
poles $-159.414\pm5947.760\,\mathrm i$ and
$-21.836\pm1992.947\,\mathrm i$, in $\mathrm{s^{-1}}$.
It therefore has two oscillatory modes. We fit stable scalar second- and
third-order equations to its hammer angle, contact torque and hammer-side
power on the complete contact interval. Each signal's residual is normalized
by that reference signal's peak absolute value and weighted equally. The
second-order fit has one complex pair; the third adds a real pole. Both
retain initial angle and speed, and the third retains initial acceleration.

| Scalar order | Torque NRMSE | Hammer-power NRMSE |
|-------------:|-------------:|------------------:|
| 2, fitted | 30.53% | 25.67% |
| 3, fitted | 30.42% | 25.61% |
| 4, exact elimination | $<10^{-10}\%$ | $<10^{-10}\%$ |

: Errors against the ordinary synthetic reference on the fitting interval.

Fourth order retains the second oscillatory mode and recovers the torque
and power pulse. Adding only a third derivative barely helps these fitted
models. This establishes the order advantage for the stated reference;
the unknown hammer hypothesis is evaluated by its own predictions below.

# Signed work and apparent COP

The contact has two power ports. Define, over the complete contact interval
$[0,T]$,
\begin{equation}
\begin{aligned}
W_{hc}&=\int_0^T\tau_c\omega_h\,dt,&
W_{ca}&=\int_0^T\tau_c\omega_a\,dt,\\
W_j&=\int_0^T\tau_j\omega_a\,dt,&
W_X&=\int_0^T\tau_X\omega_h\,dt.
\end{aligned}
\label{eq:ports}
\end{equation}
Positive $W_X$ means the unknown component receives net work; negative
$W_X$ means it supplies net work. Forward and returned contact work are
both retained. This is the signed-account convention of
[Nilre and Herlin (2026b)][energy], Sections 2, 4 and 5.

For constant $B_3,B_4$, write
$v=\dot\theta_h$, $a=\ddot\theta_h$ and $j=\theta_h^{(3)}$.
Integration by parts gives the exact identities
\begin{equation}
\begin{aligned}
W_3&=B_3[va]_0^T-B_3\int_0^T a^2\,dt,\\
W_4&=B_4[vj-\tfrac12a^2]_0^T,\qquad W_X=W_3+W_4.
\end{aligned}
\label{eq:higher-work}
\end{equation}
The third-order term includes an endpoint transfer and a signed integral;
the fourth-order work is entirely an endpoint difference. Neither sign
can be inferred from the coefficient alone. The fourth-order endpoint
expression identifies the transfer without specifying a positive physical
store or a replenishment mechanism.

Let $K_h=J_h\omega_h^2/2$, $K_a=J_a\omega_a^2/2$ and
$U_j=k_j\theta_a^2/2$. For linear contact,
$U_c=k_c\delta^2/2$ and
$D_c=\int_0^T c_c\dot\delta^2\,dt$.
For \eqref{eq:nonlinear}, replace these by
$U_c=2H\delta^{5/2}/5$ and
$D_c=\int_0^T H\alpha\delta^{3/2}\dot\delta^2\,dt$.
In both cases $D_j=\int_0^T c_j\omega_a^2\,dt$. Multiplying the component
laws by their velocities gives
\begin{equation}
\begin{aligned}
\Delta K_h&=W_d-W_{hc}-W_X,& W_d&=\int_0^T\tau_d\omega_h\,dt,\\
W_{hc}-W_{ca}&=\Delta U_c+D_c,\qquad&
W_{ca}&=\Delta K_a+W_j,\\
W_j&=\Delta U_j+D_j.
\end{aligned}
\label{eq:ledger}
\end{equation}
These balances follow directly from the declared torque laws.

The force-zero release rule can leave $U_c(T^-)>0$. Removing that contact
spring assigns $Q_{\rm rel}=U_c(T^-)$ to a release account, with its physical
destination unspecified. There is no body impulse at this event. The
post-release ledger, with $K_0=J_h\omega_h(0)^2/2$ and the stated zero
initial anvil and elastic energies, is
\begin{equation}
K_0+W_d-W_X=K_h(T)+K_a(T)+W_j+D_c+Q_{\rm rel}.
\label{eq:total}
\end{equation}
Thus the endpoint contact store is counted once, as the release transfer.
For the nonlinear zero-deformation release, $Q_{\rm rel}=0$.

Following the energy companion, exclude the unknown account from ordinary
counted input. With $I=K_0+W_d>0$, report two apparent COPs:
\begin{equation}
\boxed{\mathrm{COP}_{a}=\frac{W_{ca}}{I},\qquad
\mathrm{COP}_{j}=\frac{W_j}{I}.}
\label{eq:cop}
\end{equation}
The first counts net work received by the anvil. The second counts work
delivered to the modeled joint resistance and spring, including recoverable
elastic storage. Their difference is $\Delta K_a/I$. In a real fastening
assessment, permanent tightening and the energy cost of preparing and
replenishing the hammer would also have to be measured.

Anvil receipt and joint work answer different questions. The signed account
also keeps work that returns during rebound from being counted as retained
output.

# Calculated impacts

All numerical values below are model calculations. The parameters are
illustrative and common to the comparisons except for the explicitly stated
contact law or higher-order weight.

| Quantity | Value |
|:------------------------------------------|-------------------------:|
| Hammer inertia $J_h$ | $1.6\times10^{-4}\ \mathrm{kg\,m^2}$ |
| Anvil inertia $J_a$ | $1.0\times10^{-4}\ \mathrm{kg\,m^2}$ |
| Contact stiffness $k_c$ | $1500\ \mathrm{N\,m\,rad^{-1}}$ |
| Contact damping $c_c$ | $0.010\ \mathrm{N\,m\,s\,rad^{-1}}$ |
| Joint stiffness $k_j$ | $1500\ \mathrm{N\,m\,rad^{-1}}$ |
| Joint damping $c_j$ | $0.020\ \mathrm{N\,m\,s\,rad^{-1}}$ |
| Incoming hammer speed | $600\ \mathrm{rad\,s^{-1}}$ |
| Counted input $I=K_0$ | $28.8\ \mathrm J$ |

: Common parameters.\label{tab:parameters}

For the proposed models, $B_3=5.33333\times10^{-10}\ \mathrm{N\,m\,s^3\,rad^{-1}}$.
The nominal fourth-order coefficient is
$B_4=1.70667\times10^{-12}\ \mathrm{N\,m\,s^4\,rad^{-1}}$.
The comparison with $w_4=1/5$ doubles this value and changes no other input.
Table \ref{tab:pulses} gives pulse and outgoing-motion results;
Figure \ref{fig:pulses} shows their time dependence.

| Model | $T$ (ms) | Peak $\tau_c$ (N m) | $\omega_h(T)$ | $\omega_a(T)$ |
|:-----------------------|----------:|---------------------:|---------------:|---------------:|
| Ordinary linear | 1.5742 | 184.41 | $-560.17$ | $-54.11$ |
| Ordinary nonlinear | 1.3804 | 270.66 | $-522.92$ | $-104.90$ |
| Third-order hammer | 1.5740 | 185.33 | $-565.45$ | $-52.92$ |
| Fourth, $w_4=1/10$ | 1.4796 | 233.14 | $-775.44$ | $6.15$ |
| Fourth, $w_4=1/5$ | 0.7979 | 218.31 | $-358.25$ | $-55.69$ |

: Complete-contact pulse results; outgoing speeds are in rad/s.\label{tab:pulses}

![Calculated torque, hammer speed and cumulative anvil work for the common incoming state. Each curve stops at its own first separation. The horizontal work line is the counted input, 28.8 J. Returned work is retained in the falling portions of the lower curves.](figures/impact-comparison.pdf){#fig:pulses width=100%}

\FloatBarrier

| Model | $W_{ca}$ (J) | $W_j$ (J) | $W_X$ (J) | $\mathrm{COP}_{a}$ | $\mathrm{COP}_{j}$ |
|:-----------------------|------------:|----------:|----------:|------------------:|------------------:|
| Ordinary linear | 2.4284 | 2.2820 | 0 | 0.08432 | 0.07924 |
| Ordinary nonlinear | 4.4938 | 3.9436 | 0 | 0.15603 | 0.13693 |
| Third-order hammer | 2.4487 | 2.3086 | $-0.5114$ | 0.08502 | 0.08016 |
| Fourth, $w_4=1/10$ | 2.9145 | 2.9126 | $-24.8868$ | 0.10120 | 0.10113 |
| Fourth, $w_4=1/5$ | 35.3945 | 35.2395 | $-18.1210$ | 1.22898 | 1.22359 |

: Signed interval work and apparent COP. Negative $W_X$ is supplied work.

The ordinary linear contact sends $26.4708\ \mathrm J$ forward to the anvil
and receives $24.0424\ \mathrm J$ back. Its net receipt is therefore only
$2.4284\ \mathrm J$. In the nominal fourth-order case, the corresponding
amounts are $29.3476$ and $26.4330\ \mathrm J$. The unknown component supplies
$24.8868\ \mathrm J$, but the departing hammer retains
$48.1048\ \mathrm J$, compared with $25.1034\ \mathrm J$ in the ordinary case.

A large supplied-work contribution need not produce a large joint output.
Here much of that work appears in the stronger hammer rebound.

For $w_4=1/5$, the unknown account supplies $18.1210\ \mathrm J$, and both
apparent COPs exceed one. The complete ledger is, to the displayed precision,
\begin{equation}
\underbrace{28.8000+18.1210}_{\text{ordinary input and supplied work}}
=\underbrace{10.2673}_{K_h}
+\underbrace{0.1550}_{K_a}
+\underbrace{35.2395}_{W_j}
+\underbrace{1.2561}_{D_c}
+\underbrace{0.0031}_{Q_{\rm rel}}
\quad\mathrm J.
\label{eq:numerical-ledger}
\end{equation}
Its joint work consists of $33.6402\ \mathrm J$ of elastic storage and
$1.5993\ \mathrm J$ of resistance work. The higher-order contributions are
$W_3=-0.7819\ \mathrm J$ and $W_4=-17.3390\ \mathrm J$.
Counting the supplied work as an additional input would give
$W_{ca}/(I-W_X)=0.7543$; the apparent ratio in \eqref{eq:cop} keeps the
unknown account separate.

The linear, nonlinear, third-order and nominal fourth-order release
transfers are respectively $0.00854$, $0$, $0.00876$ and $0.02036\ \mathrm J$.
Independent integrations and the endpoint identities in \eqref{eq:higher-work}
check the accounts. Across the five examples, tighter calculations using a
different integration method change COP by less than $10^{-10}$ and peak
torque by less than $10^{-6}\ \mathrm{N\,m}$; the total balance residual
is below $10^{-8}\ \mathrm J$.

# Boundary, preparation and measurement

The calculations retain each model's coefficients when incoming speed is
changed to $400$ and $800\ \mathrm{rad\,s^{-1}}$. For the linear-contact
models, motion scales with incoming speed, work with its square, and apparent
COP stays unchanged. The nonlinear contact gives anvil COPs of $0.12495$
and $0.18297$ at these speeds. These are predictions at changed conditions,
without refitting.

The joint boundary matters even when the hammer coefficients are fixed.
With $k_j=1000\ \mathrm{N\,m\,rad^{-1}}$, the nominal fourth-order model
separates at $0.6939\ \mathrm{ms}$ and gives
$\mathrm{COP}_a=1.03358$, $\mathrm{COP}_j=0.87038$ and
$W_X=-2.9530\ \mathrm J$. At $k_j=2200$, its anvil COP is $0.07263$.
The changed boundary alters the return motion and which unloading zero ends
the contact. The ordinary nonlinear model is also sensitive: its anvil COPs
at those two stiffnesses are $0.92374$ and $0.08413$.

For fourth order, change only the prepared initial jerk to
$\theta_h^{(3)}(0)=\pm\omega_h(0)/t_c^2$, where
$t_c=\sqrt{J_h/k_c}$. The nominal model's anvil COP becomes $0.07467$ for the
negative choice and $0.13741$ for the positive choice, compared with $0.10120$
at zero jerk. The extra initial condition has an observable consequence and
must be identified alongside the weights.

The nominal fourth-order engaged linear system has all poles in the left
half-plane, with largest real part $-17.51\ \mathrm{s^{-1}}$.
The softer-joint case above also has decaying modes. Doubling $w_4$ to $1/5$
introduces a growing mode with real part $1095.19\ \mathrm{s^{-1}}$.
Its calculated blow ends after $0.7979\ \mathrm{ms}$, before any assumption
about later continuation is made. That growth is part of this parameter
choice's prediction. Changing only $w_4$ to $1/20$ instead gives anvil COP
$0.08611$ and decaying engaged modes.

Synchronized contact torque and hammer/anvil angular velocities would test
these pulse and work predictions. The hammer residual
$\tau_X=\tau_d-J_h\ddot\theta_h-\tau_c$ gives its inferred torque; integrating
its product with $\omega_h$ tests the unknown account. Joint torque and anvil
speed distinguish anvil receipt from joint work. Initial acceleration and jerk,
separation timing, and independent changes of speed and joint stiffness are
needed to distinguish the proposed weights from an unobserved preparation
state. Derivatives should be inferred jointly from a motion model over a
measured bandwidth; repeated differentiation of noisy samples can otherwise
dominate the inferred higher-order torque.

These calculations resolve roughly $0.6$--$1.7\ \mathrm{ms}$ contacts over the
stated finite parameter tests. Hardware accuracy and bandwidth remain to be
established by those measurements. The useful comparison is whether one identified
coefficient set predicts the pulse, rebound and signed work at independent
impact conditions.

# Conclusion

Synthesized third- and fourth-order coefficients give a concrete model of an
unknown hammer contribution during one rotary impact. The ordinary two-inertia
reference also explains why a fourth-order scalar description can outperform
second- and third-order reductions: it retains both oscillatory modes.

The unknown component has a separate, computable work account. In the examples,
its supplied work can strengthen hammer rebound, increase anvil receipt, or
produce apparent COP above one. The outcome depends on the joint boundary,
weights and prepared higher-order state. Signed contact and joint integrals,
endpoint stores and release transfers identify where the ordinary accounted
work goes. Measuring those ports and the hammer residual would test the
predicted transfer and determine what physical account must accompany it.

# References {-}

1. H. Nilre and B. C. Herlin (2026a). [*ODE Coefficient Synthesis: The coefficient lattice and its staircase*][synthesis].
2. H. Nilre and B. C. Herlin (2026b). [*Energy Ledgers for Forced Harmonic ODEs: Kirchhoff power balance and an unknown component with X = LRC*][energy].
3. T. ter Braack and D. L. Margolis (2026). [“Modeling of an Impact Wrench for Use in Reducing Hand–Arm Vibrations”][wrench]. *Machines* **14**(2), 213. doi:10.3390/machines14020213.
4. K. H. Hunt and F. R. E. Crossley (1975). [“Coefficient of Restitution Interpreted as Damping in Vibroimpact”][hc]. *Journal of Applied Mechanics* **42**(2), 440--445. doi:10.1115/1.3423596.

[synthesis]: https://github.com/hobnilre/physics-ode-coefficient-synthesis/blob/main/ode-coefficient-synthesis.md
[energy]: https://github.com/hobnilre/physics-ode-energy/blob/main/physics-ode-energy.md
[wrench]: https://doi.org/10.3390/machines14020213
[hc]: https://doi.org/10.1115/1.3423596
