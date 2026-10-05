---
title: "A Higher-Order ODE Model for a Rotary Impact Driver"
subtitle: "Comparison with established models and assessment of performance"
author: "Hob Nilre & Bo C. Herlin"
date: "2026-10-05"
abstract: |
  We develop and assess a higher-order representation of one hammer–anvil blow against a tightened, compliant joint. A weighted derivative contact law is distinguished from an exact scalar equation obtained by eliminating component states. A spring–damper assembly gives an exact fourth-order observation equation; a passive contact with one relaxation state gives a fifth-order equation and a controlled derivative expansion. Both exact reductions retain the physical forcing, compatible initial data and release law. In an illustrative numerical comparison, a cubic contact expansion improves magnitude and phase over a declared low-frequency band, but does not uniformly improve torque peak, rebound or transferred work over a calibrated linear contact. Across 108 additional passive configurations, the cubic is stable in 75, and Taylor contacts of orders four through eight are unstable in every configuration. Signed port-work integrals and endpoint stores expose differences hidden by pulse matching. A separate flexible-output example shows why retaining socket or bit dynamics can matter more than increasing contact order. Independent component ratios, physical realization and initialization govern the useful representation; predictive accuracy for an actual tool remains to be measured.
keywords:
  - rotary impact driver
  - higher-order ordinary differential equations
  - unilateral contact
  - model comparison
  - signed work
---

\begingroup\scriptsize
\noindent PDF created: \pdfbuildtimestamp\par
\noindent Latest on GitHub: \url{https://github.com/hobnilre/physics-impact-driver-model}\par
\endgroup

# Purpose and scope

A rotary impact driver transfers a short angular impulse from a rotating hammer to an anvil. Once the fastener is tight, the output can still twist elastically, and its reaction changes the collision. A model intended to predict the torque pulse must therefore describe both the contact and the boundary against which the anvil moves. Resolved hammer mechanisms already combine contact, body motion and joint behavior; their geometry also distinguishes full engagement from partial engagement [Wettstein, Grauberger and Matthiesen (2021)][wettstein]. A higher derivative does not specify those changes of engagement.

The proposal considered here is a weighted expansion of contact torque in successive derivatives of relative angular deformation. Such terms can approximate linear memory over a limited frequency band. They can also arise in an exact scalar equation for an observed coordinate after other component states have been eliminated. These two uses of higher order have different meanings: the first changes or approximates a constitutive response; the second preserves a specified assembly.

The principal question is whether the additional terms improve predictions of one blow: contact-torque peak, duration, rebound, hammer and anvil motion, signed work, and frequency-response magnitude and phase. We compare rigid restitution, a switched linear spring–damper, a Hunt–Crossley-type contact and a resolved passive contact with one internal state. All use the same body allocation, joint boundary and incoming physical state. The evaluation is an illustrative constitutive-model comparison. Its reference trajectories are calculated from declared component laws, rather than measured from a tool. Parameter burden and preparation information are part of the comparison.

# The physical comparison unit
\label{sec:boundary}

## Bodies, deformation and input

The hammer has inertia $J_h>0$, angle $\theta_h$ and angular rate $\omega_h=\dot\theta_h$. The anvil has inertia $J_a>0$, angle $\theta_a$ and rate $\omega_a=\dot\theta_a$. A driver bit is assumed rigidly attached to the anvil, so its rigidly co-rotating inertia belongs in $J_a$. For an impact wrench, the same convention includes a rigid socket. Separately resolved bit or socket twist, or an independently moving socket mass, would require another component law or state. It cannot also be included as rigid inertia.

The joint law represents the incremental torsional response of the tightened fastener, interfaces and workpiece about a prepared equilibrium. Its displacement is $\theta_a$, with zero at that equilibrium. Preload may affect its parameters, but preload evolution and gross tightening rotation are outside this model. The numerical comparisons use a stationary outer support and the linear boundary
\begin{equation}
 \tau_j=k_j\theta_a+c_j\omega_a,\qquad k_j>0,\quad c_j>0.
 \label{eq:joint}
\end{equation}
Joint deformation is distinct from the local hammer–anvil deformation. Choose the active-contact angle origin to absorb the face clearance, giving
\begin{equation}
 \delta=\theta_h-\theta_a,\qquad v=\dot\delta=\omega_h-\omega_a.
 \label{eq:deformation}
\end{equation}
A positive contact torque $\tau_c$ slows the hammer and drives the anvil. With applied hammer torque $u$, the free-body equations are
\begin{equation}
 J_h\dot\omega_h=u-\tau_c,\qquad
 J_a\dot\omega_a=\tau_c-\tau_j.
 \label{eq:bodies}
\end{equation}
The physical input is $u$, even when its derivatives appear after elimination. During the illustrative blow $u=0$; the incoming kinetic state supplies the motion. Retaining $u$ in the derivations makes the forcing and the scope of the reduction explicit.

![Schematic allocation of bodies, contact and tightened-joint boundary. The contact deformation is $\delta$; the joint displacement is $\theta_a$. The optional relaxation branch belongs to the contact, while rigid bit inertia belongs to $J_a$.](figures/system.pdf){#fig:system width=100%}

\FloatBarrier

## Engagement, preparation and release

Contact begins at $t_0=0$ with $\delta=0$ and $v>0$. The common incoming body state in the comparisons is
\begin{equation}
 \theta_h(0)=\theta_a(0)=0,\qquad
 \omega_h(0)=\Omega>0,\qquad \omega_a(0)=0.
 \label{eq:incoming}
\end{equation}
Any internal contact state must also be specified. The contact is active on $0<t<t_1$ while its candidate torque is compressive. Release occurs at the first descending zero of that torque, or a descending zero of deformation, whichever comes first after engagement. The models below make these guards explicit. Body positions and velocities are continuous at finite-duration engagement and release; contact acceleration may jump. After release, $\tau_c=0$ and the joint state persists. We evaluate the first active interval only.

A linear damper can give a finite torque immediately at engagement, even though $\delta=0$. It can also make torque reach zero while $\delta$ remains positive during unloading. The deformation coordinate is then the active penalty deformation, rather than a complete description of the geometry of released faces. Ending the interaction at this guard is a declared model choice. Any spring or internal store removed at release requires an event transfer in the work account. A model of the actual separating faces must identify where that energy goes.

The familiar half-cycle continuation of a damped linear spring to zero deformation can predict tensile force shortly before release, a difficulty explicitly discussed by [Hunt and Crossley (1975)][hunt]. We therefore impose compressive contact and locate the release guard, rather than extending the contact law through negative torque. A gate $\chi_c$, equal to one on the active interval and zero outside it, denotes this hybrid choice. Differentiation and state elimination are performed inside each smooth interval; differentiating the gate would introduce event distributions and would require a separate analysis.

# Established baselines
\label{sec:baselines}

## Instantaneous restitution

An instantaneous model replaces the finite collision by a jump. Let $I=\int\tau_c\,\mathrm dt$ be its angular contact impulse and let
$\mu=J_hJ_a/(J_h+J_a)$ be the reduced body inertia. A finite spring–damper joint supplies no impulse in a zero-duration event. Integrating \eqref{eq:bodies} through that event and prescribing $v^+=-e v^-$ yields
\begin{equation}
 I=\mu(1+e)v^-,\qquad
 \omega_h^+=\omega_h^--I/J_h,\qquad
 \omega_a^+=\omega_a^-+I/J_a,
 \quad 0\le e\le1.
 \label{eq:rigid}
\end{equation}
Angles and the joint spring store stay continuous. This is the elementary direct-impact restitution idealization discussed in the rigid-impact framework of [Stronge (2018)][stronge]. An impulse applied at an offset contact face produces the corresponding angular impulse about the shaft; no unresolved free couple is being introduced.

The model predicts an outgoing velocity jump and an event loss. It supplies no resolved finite-duration torque peak or pulse shape. A compliant joint can move after the jump, but its finite-duration reaction during a real collision is absent. Making the anvil perfectly constrained instead would change the physical boundary and the impulse equations; it is a different comparison.

## Switched linear spring–damper

The linear finite-duration baseline is
\begin{equation}
 \tau_c=\chi_c(k_L\delta+c_Lv),\qquad k_L,c_L>0,
 \label{eq:linear}
\end{equation}
with the joint \eqref{eq:joint} and the release law in Section \ref{sec:boundary}. Linear impact springs and dampers are used in an established lumped model of an impact wrench [ter Braack and Margolis (2026)][braack]. That work concerns a wider tool model; the present comparison isolates a blow and uses its own declared parameters and release law. A detailed resolved hammer mechanism also requires geometric states and contact transitions [Wettstein, Grauberger and Matthiesen (2021)][wettstein].

This baseline resolves the pulse, both body motions and the boundary reaction with two contact parameters. Those parameters may be identified from measurements, but a contact fit alone need not distinguish contact losses from joint losses. Here the joint is fixed independently before fitting the nominal contact pulse.

## Nonlinear normal contact mapped to torque

For a locally fixed effective lever arm $\ell>0$, take the normal indentation as $x=\ell\delta$ and normal approach speed as $\dot x=\ell v$. Virtual work gives $\tau_c=\ell F_n$. A normal Hunt–Crossley form $F_n=\kappa_n x^n(1+\alpha_n\dot x)$ therefore gives
\begin{equation}
 \tau_c=\chi_c\kappa\delta^n(1+\alpha v),\qquad
 \kappa=\kappa_n\ell^{n+1},\quad \alpha=\alpha_n\ell,
 \quad n=3/2.
 \label{eq:nonlinear}
\end{equation}
The deformation-dependent damping term follows the law introduced by [Hunt and Crossley (1975)][hunt]. The exponent $3/2$ is appropriate to their Hertzian sphere–plane example. Applying it to rotary faces assumes a locally equivalent smooth normal contact and constant lever arm; flat conforming faces, changing edge engagement, plasticity and sliding need their own geometry and law.

We use \eqref{eq:nonlinear} only while $\delta>0$ and $1+\alpha v>0$, and release at the first descending zero of either factor. This prevents tensile continuation. [Carvalho and Martins (2019)][carvalho] show why external forcing and post-restitution conditions matter to adhesion and restitution in this model family. We specify $\alpha$ as a positive constitutive parameter and compute rebound as an output; no approximate conversion from a prescribed $e$ is assumed.

The nonlinear contact predicts a speed-dependent pulse and rebound using two fitted parameters when $n$ is fixed. The geometry information implicit in $n$ and $\ell$ is additional physical information, even when absorbed into $\kappa$ and $\alpha$.

# A weighted higher-order contact law
\label{sec:weighted}

Let $D=\mathrm d/\mathrm dt$ and $k\ge0$ denote derivative order, with $D^0\delta=\delta$. Choose a positive reference triple $(J_*,c_*,k_*)$ with inertia, damping and torsional-stiffness dimensions. The monomial family $A_{r,k}$ and its interpretation are developed in [Nilre and Herlin (2026)][third]. We define the rotational specialization locally:
\begin{equation}
 A^c_{r,k}=J_*^{k-1+r}c_*^{2-k-2r}k_*^r,
 \qquad [A^c_{r,k}]=[k_*]\,\mathrm{time}^{k}.
 \label{eq:family}
\end{equation}
Here $r$ is the exponent of the stiffness reference. For integer $r$ the expression is a Laurent monomial; real $r$ is also dimensionally admissible on positive references. To derive the formula, a candidate $J_*^a c_*^b k_*^d$ must obey $a+b+d=1$ and $2a+b=k$. Setting $d=r$ gives \eqref{eq:family}. Dimensional validity leaves $r$ and the dimensionless weights undetermined.

For a finite chosen set $\mathcal R_k$, define effective coefficients and the proposed contact law by
\begin{equation}
 B_k=\sum_{r\in\mathcal R_k}w_{r,k}A^c_{r,k},\qquad
 \tau_c=\chi_c\sum_{k=0}^{N} B_kD^k\delta.
 \label{eq:weighted}
\end{equation}
The weights may be signed. They require component laws, a declared approximation, or identification. A convenient optional choice is $r_k=1-\lceil k/2\rceil$, giving

| $k$ | $A^c_{r_k,k}$ | Meaning of the coefficient scale |
| ---: | :----------------------- | :--------------------------------------------- |
| 0 | $k_*$ | torsional stiffness |
| 1 | $c_*$ | torsional damping |
| 2 | $J_*$ | inertia dimensions |
| 3 | $J_*c_*/k_*$ | third-derivative torque coefficient |
| 4 | $J_*^2/k_*$ | fourth-derivative torque coefficient |
| 5 | $J_*^2c_*/k_*^2$ | fifth-derivative torque coefficient |

: An admissible coefficient convention. The scales do not specify physical components or their weights.

In particular, $J_*$ is a reference coordinate, not an additional resolved body. The hammer and anvil inertia already appear in \eqref{eq:bodies}. Setting $B_2$ equal to either body inertia as another contact inertia would need a separate mechanism and allocation. A negative $B_2$ can arise from a relaxation expansion below without representing a negative physical mass.

At one fixed triple, all allowed $r$ for a given $k$ multiply the same derivative. Only their sum $B_k$ is observable in that law. Using
$S=c_*^2/J_*$, $t_*=J_*/c_*$ and $\rho=c_*^2/(J_*k_*)$ gives $A^c_{r,k}=S t_*^k\rho^{-r}$: varying $r$ at fixed $\rho$ changes a constant scale, rather than introducing a new frequency dependence. Individual weights require independently changing component information or a structural restriction. A fitted list of weights at one triple cannot identify a unique mechanism.

The joint may have a separate rational response or expansion
$\tau_j=\sum_{k=0}^{M}G_kD^k\theta_a$ with its own references and states. The comparisons retain \eqref{eq:joint}; increasing contact order is not allowed to absorb a changed boundary silently. Integration terms with negative derivative order would need initialized integration constants and are unnecessary for the present blow.

# Exact observation equations and a controlled approximation
\label{sec:reduction}

## The spring–damper assembly gives a fourth-order equation

Put $K_c(s)=k_c+c_cs$ and $K_j(s)=k_j+c_js$, where $s$ is an operator variable and $k_c,c_c$ denote a specified linear contact. The active body equations give a two-coordinate matrix with diagonal entries $J_hD^2+K_c(D)$ and $J_aD^2+K_c(D)+K_j(D)$, and off-diagonal entries $-K_c(D)$. Eliminating $\theta_a$ by commuting the constant-coefficient operators gives
\begin{align}
 P(D)\theta_h&=N(D)u,\qquad
 N(s)=J_as^2+(c_c+c_j)s+k_c+k_j,\nonumber\\
 P(s)&=J_hJ_as^4+[J_h(c_c+c_j)+J_ac_c]s^3\nonumber\\
 &\quad+[J_h(k_c+k_j)+J_ak_c+c_cc_j]s^2\nonumber\\
 &\quad+(c_ck_j+c_jk_c)s+k_ck_j.
 \label{eq:quartic}
\end{align}
This is the determinant identity
$P=(J_hs^2+K_c)(J_as^2+K_c+K_j)-K_c^2$, derived from the body and component laws. It agrees with the impact construction in [Nilre and Herlin (2026)][third]. It is a fourth-order equation for hammer observation, even though the contact law itself has only stiffness and damping.

For the incoming state \eqref{eq:incoming}, let $u_0=u(0)$ and $\dot u_0=\dot u(0)$. Compatible scalar initial data are
\begin{align}
 \theta_h(0)&=0,\qquad \dot\theta_h(0)=\Omega,\nonumber\\
 \ddot\theta_h(0)&=(u_0-c_c\Omega)/J_h,\nonumber\\
 \delta''(0)&=u_0/J_h-c_c\Omega/\mu,\nonumber\\
 \theta_h'''(0)&=[\dot u_0-k_c\Omega-c_c\delta''(0)]/J_h.
 \label{eq:quartic-initial}
\end{align}
Four arbitrary derivatives would describe a different preparation. The scalar law is used only with data obtained from the component state, and switching is applied to that state at release. Forward substitution then reproduces the same hammer trajectory. Reconstructing hidden variables from hammer observations alone can have exceptional unobservable parameter choices; retaining the original state for events avoids assuming a general inverse.

With zero physical initial states, the hammer mobility and anvil displacement response are
\begin{equation}
 H_h(s)=\frac{sN(s)}{P(s)},\qquad
 \frac{\theta_a(s)}{u(s)}=\frac{K_c(s)}{P(s)}.
 \label{eq:transfer}
\end{equation}
Dropping $N$ changes the driven system. The exact fourth-order reduction carries the same six component parameters and the same physical preparation as the resolved baseline. It provides an equivalent representation, with no independent accuracy gain.

The complete parameter dependence also answers whether further choices of $r$ can reveal a missing contribution in this particular assembly. Define
$h=J_h/J_a$, $\beta=k_c/k_j$, $\rho_j=c_j^2/(J_a k_j)$,
$\eta=c_j/c_c$, $t_j=J_a/c_j$ and $S_j=c_j^2/J_a$.
These are four independent dimensionless ratios and two reference scales.
With $x=t/t_j$, $q=\theta_h/Y$ and $U=u/(S_jY)$ for an angle scale $Y>0$,
the normalized equation is
\begin{align}
 \sum_{k=0}^{4}p_k\frac{\mathrm d^kq}{\mathrm dx^k}
 &=\frac{1}{h}\left[\frac{\mathrm d^2}{\mathrm dx^2}
 +(1+\eta^{-1})\frac{\mathrm d}{\mathrm dx}
 +\frac{\beta+1}{\rho_j}\right]U,\nonumber\\
 (p_0,p_1,p_2,p_3,p_4)
 &=\left(\frac{\beta}{h\rho_j^2},
 \frac{\beta+\eta^{-1}}{h\rho_j},
 \frac{\beta+1+\beta/h}{\rho_j}+\frac{1}{h\eta},
 1+\frac{1+1/h}{\eta},1\right).
 \label{eq:complete-parameters}
\end{align}
Direct substitution into \eqref{eq:quartic} proves the identity for all positive component parameters. This is a complete coefficient map for the stated linear topology. It includes the damping product $c_cc_j$ even when that contribution is small.

An ordinary mixture $S_jt_j^k\sum_r w_{r,k}\rho_j^{-r}$ with constant weights supplies only one ratio. At fixed $\rho_j$ it cannot distinguish independent changes of $h$, $\beta$ or $\eta$ after scaling; allowing any further real $r$ leaves that limitation. Multiplication by $\eta^s$ supplies a second coordinate, but still cannot represent arbitrary inertia and contact changes with universal constant weights. Component laws can supply the remaining dependence as in \eqref{eq:complete-parameters}. Changing the common equation scale also changes coefficient labels and weights, so apparent new support must be checked against the same physical operator. Further derivatives of this exact four-state system obey its recurrence; they do not establish additional physics. Additional physical states or nonlinear component laws would change the question.

For a concrete transferable representation, multiply the physical monic
equation by $\gamma=\mu^2/k_c$ and use the joint reference triple
$(J_a,c_j,k_j)$ in \eqref{eq:family}, denoting its coefficients $A^j_{r,k}$.
Define $\xi=c_c^2/(J_a k_c)$ and $g=h/(1+h)^2$. Then
$B_k=\sum_{r,s}w_{r,s,k}A^j_{r,k}\eta^s$ reproduces every coefficient of
\eqref{eq:quartic} with the following derived weights:

| $k$ | $(r,s)$ contributions | Weights in the same order |
| ---: | :------------------------------ | :------------------------------ |
| 0 | $(1,0)$ | $g$ |
| 1 | $(0,0),(1,1)$ | $g,\ g\xi$ |
| 2 | $(0,0),(0,1),(1,2)$ | $h/(1+h),\ g\xi,\ hg\xi$ |
| 3 | $(0,1),(0,2)$ | $h\xi/(1+h),\ hg\xi$ |
| 4 | $(0,2)$ | $hg\xi$ |

: Exact component-dependent weights for the engaged linear assembly, under the declared common equation scale and joint references.

The identities follow by substituting the reference monomials and
$\mu=J_hJ_a/(J_h+J_a)$. They hold for all positive component values,
without fitting. The coordinates $(h,\xi,\rho_j,\eta)$ are independent,
with $\beta=\rho_j/(\xi\eta^2)$. Constant weights are appropriate only
on a parameter family where their component ratios stay fixed. This
completes the representation for the specified topology; the weights
contain the physics that dimensions alone leave undetermined.

## One passive internal contact state

A minimal example of missing linear memory is a spring $k_0>0$, a damper $c_0>0$, and a Maxwell branch, consisting of a spring $k_m>0$ in series with a damper $k_m T$, with relaxation time $T>0$. All act across $\delta$. Let $z$ be the branch torque. Its component equations are
\begin{equation}
 \tau_c=k_0\delta+c_0v+z,\qquad
 T\dot z+z=k_m T v.
 \label{eq:memory}
\end{equation}
The spring deflection in that branch is $z/k_m$, and the series damper deflection rate is $z/(k_mT)$. Adding their rates gives $v$, which derives the second equation. The branch adds a contact preparation $z(0)$; here $z(0)=0$. It introduces no additional hammer or anvil inertia.

On a zero-state smooth interval, the contact dynamic stiffness is
\begin{equation}
 K(s)=k_0+c_0s+\frac{k_mTs}{1+Ts}.
 \label{eq:rational}
\end{equation}
Its state interpretation will supply a positive store in Section \ref{sec:work}. It is a specified synthetic reference for the comparison, rather than a claim that a commercial steel contact obeys one Maxwell relaxation.

For exact elimination define
\begin{align}
 Q(s)&=1+Ts,\qquad F(s)=(k_0+c_0s)Q(s)+k_mTs,\nonumber\\
 N_S(s)&=Q(s)[J_as^2+K_j(s)]+F(s),\nonumber\\
 P_S(s)&=J_hJ_as^4Q(s)+J_hs^2K_j(s)Q(s)\nonumber\\
 &\quad+F(s)[(J_h+J_a)s^2+K_j(s)].
 \label{eq:fifth-pair}
\end{align}
Then $P_S(D)\theta_h=N_S(D)u$ is fifth order: its leading coefficient is $J_hJ_aT>0$. The forcing has degree three. Multiplying the two-body determinant with $K=F/Q$ by $Q$ produces \eqref{eq:fifth-pair}; the quadratic contact products cancel, leaving one relaxation factor. Initial derivatives through order four follow by repeatedly differentiating \eqref{eq:bodies} and \eqref{eq:memory} from the five physical state values and the input derivatives. This initialized scalar equation reproduces the resolved reference exactly. It does not add predictive information to it.

## Derivative expansion and its remainder

Expanding the single rational branch about $s=0$ gives the proposed family a concrete meaning. For $N\ge1$, define
\begin{align}
 K_N(s)&=k_0+c_0s+k_m\sum_{j=1}^{N}(-1)^{j-1}(Ts)^j,\nonumber\\
 K(s)-K_N(s)&=\frac{k_m(-1)^N(Ts)^{N+1}}{1+Ts}.
 \label{eq:remainder}
\end{align}
The finite remainder is an exact algebraic identity. The infinite geometric expansion converges for $\lvert Ts\rvert<1$. Its cubic truncation has
\begin{equation}
 (B_0,B_1,B_2,B_3)=(k_0,c_0+k_mT,-k_mT^2,k_mT^3).
 \label{eq:cubic-coefficients}
\end{equation}
For the staircase convention in Section \ref{sec:weighted}, its weights are
$w_0=k_0/k_*$, $w_1=(c_0+k_mT)/c_*$,
$w_2=-k_mT^2/J_*$ and $w_3=k_mT^3k_* /(J_*c_*)$.
These weights are derived from four contact parameters. Identifying four unrelated derivative coefficients would instead require an empirical fit and a check of realization.

On a fixed active interval the cubic contact coupled to the bodies can be advanced as
\begin{align}
 B_3\delta'''+(\mu+B_2)\delta''+B_1\delta'+B_0\delta
 &=a_hu+a_a\tau_j,\nonumber\\
 \theta_a''&=\frac{u-\tau_j}{J_h+J_a}-a_h\delta'',\qquad
 a_h=\frac{J_a}{J_h+J_a},\quad a_a=\frac{J_h}{J_h+J_a}.
 \label{eq:cubic-dynamics}
\end{align}
The initial values are $\delta=0$, $\delta'=\Omega$,
$\delta''=-c_0\Omega/\mu$, $\theta_a=\theta_a'=0$ for $u=0$ and $z(0)=0$. This matches the reference's initial contact torque $c_0\Omega$. Contact torque is reconstructed from
$\tau_c=a_hu+a_a\tau_j-\mu\delta''$ and the common release guard is applied. The added scalar derivative requires its initial value; it cannot be chosen independently of preparation while claiming the same incoming contact state.

Frequency agreement alone does not control engagement. For a smooth prescribed $\delta(t)$, write
$z_N=k_m\sum_{j=1}^N(-1)^{j-1}T^jD^j\delta$ and $e_N=z-z_N$. Direct substitution gives
\begin{equation}
 e_N(t)=e_N(0)e^{-t/T}
   +k_m(-1)^NT^N\int_0^t e^{-(t-\xi)/T}D^{N+1}\delta(\xi)\,\mathrm d\xi.
 \label{eq:initial-layer}
\end{equation}
Thus an unmatched branch preparation creates a decaying initial layer even when the low-frequency remainder is small. A contact switch also contains frequency content above any finite comparison band. Equation \eqref{eq:initial-layer} explains why a good sinusoidal expansion can still bias a finite pulse and rebound.

# Signed work, stability and release
\label{sec:work}

## Physical port account

Over the active interval, define the signed works
\begin{align}
 W_h&=\int_0^{t_1}\tau_c\omega_h\,\mathrm dt,&
 W_a&=\int_0^{t_1}\tau_c\omega_a\,\mathrm dt,\nonumber\\
 W_c&=\int_0^{t_1}\tau_c v\,\mathrm dt,&
 W_j&=\int_0^{t_1}\tau_j\omega_a\,\mathrm dt.
 \label{eq:port-work}
\end{align}
Positive $W_h$ is extraction from the hammer, $W_a$ is receipt by the anvil, $W_c$ is receipt by the contact, and $W_j$ is receipt by the joint. Negative contributions during rebound remain in each integral. The contact identity and body ledgers follow directly from the kinematics and free bodies:
\begin{equation}
 W_h=W_a+W_c,\qquad
 \Delta E_h=W_u-W_h,\qquad
 \Delta E_a=W_a-W_j,
 \label{eq:body-ledger}
\end{equation}
where $E_h=J_h\omega_h^2/2$, $E_a=J_a\omega_a^2/2$ and
$W_u=\int_0^{t_1}u\omega_h\,\mathrm dt$.
A fixed-anvil calculation has $W_a=W_j=0$; it cannot establish the work delivered at a moving output.

For \eqref{eq:memory}, the nonnegative contact and joint stores and losses are
\begin{align}
 E_c&=\tfrac12 k_0\delta^2+\frac{z^2}{2k_m},&
 E_j&=\tfrac12 k_j\theta_a^2,\nonumber\\
 D_c&=\int_0^{t_1}\left(c_0v^2+\frac{z^2}{k_mT}\right)\mathrm dt,&
 D_j&=\int_0^{t_1}c_j\omega_a^2\,\mathrm dt.
 \label{eq:stores}
\end{align}
Differentiating the stores using the component laws gives $W_c=\Delta E_c+D_c$ and $W_j=\Delta E_j+D_j$. Consequently
\begin{equation}
 \Delta(E_h+E_a+E_c+E_j)=W_u-D_c-D_j.
 \label{eq:balance}
\end{equation}
This establishes passivity on a fixed smooth contact interval in the store/supply sense of [Willems (1972)][willems]. The energy identity is derived here from the component laws. It does not choose derivative weights.

For positive component parameters the continuously engaged reference is asymptotically stable at zero input. The total store is positive definite in the five state coordinates. Its rate can vanish only with $v=\omega_a=z=0$, hence $\omega_h=0$. An invariant trajectory in this set also requires both accelerations to vanish, giving $\delta=\theta_a=0$. The only invariant zero-loss state is the equilibrium. This argument concerns the active linear system; the finite collision ends at its event guard.

For the linear baseline $E_c=k_L\delta^2/2$ and $D_c=\int c_Lv^2\,\mathrm dt$. For \eqref{eq:nonlinear}, before release,
\begin{equation}
 E_c=\frac{\kappa\delta^{n+1}}{n+1},\qquad
 D_c=\int_0^{t_1}\kappa\alpha\delta^n v^2\,\mathrm dt.
 \label{eq:nonlinear-store}
\end{equation}
Differentiation gives the same contact ledger. Positive $\alpha$ yields a nonnegative loss rate while the admissible factors remain positive.

## Events and instantaneous work

If a finite-contact law is removed at release and its store reset to zero, define the release transfer $R_c=E_c(t_1^-)$ for the unstrained initial contacts used here. Body and joint stores stay continuous. The total retained-system account across the event is
\begin{equation}
 E(t_1^+)-E(0)=W_u-D_c-D_j-R_c.
 \label{eq:release}
\end{equation}
$R_c$ records energy leaving the retained model for omitted release dynamics. Its destination, such as distributed elastic motion or dissipation, is not identified by a torque-zero rule. Preserving the internal store and modeling separated relaxation would be another event law. Ignoring $R_c$ while deleting that store would create an accounting deficit.

For the instantaneous baseline, the discontinuous body speeds require event work rather than an ordinary torque–speed trace. Using midpoint speeds through the impulse gives
\begin{align}
 W_h^{\rm imp}&=I(\omega_h^-+\omega_h^+)/2,\nonumber\\
 W_a^{\rm imp}&=I(\omega_a^-+\omega_a^+)/2,\nonumber\\
 W_h^{\rm imp}-W_a^{\rm imp}&=\tfrac12\mu(1-e^2)(v^-)^2.
 \label{eq:impulse-work}
\end{align}
These expressions follow by evaluating both endpoint kinetic stores from \eqref{eq:rigid}. A peak torque multiplied by a duration would supply neither this event account nor the signed work of a finite pulse.

## A derivative truncation need not be passive

For a cubic law, integration by parts gives the exact formal identity
\begin{align}
 W_c={}&\left[\tfrac12B_0\delta^2+\tfrac12B_2v^2
                   +B_3\delta''v\right]_0^{t_1}\nonumber\\
       &+B_1\int_0^{t_1}v^2\,\mathrm dt
        -B_3\int_0^{t_1}(\delta'')^2\,\mathrm dt.
 \label{eq:cubic-work}
\end{align}
The boundary expression is indefinite when $B_2<0$ or the mixed term is present. For the reference-derived cubic, $B_3>0$ also gives a negative acceleration-squared contribution. The individual derivative terms therefore do not have an assigned nonnegative physical store or loss interpretation. We report their actual port integrals and body ledgers, without equating the formal expression to a realizable contact energy.

The contact impedance is torque per relative angular rate: $Z_3(s)=K_3(s)/s$. For a sinusoid of frequency $\omega>0$,
\begin{equation}
 \operatorname{Re}Z_3(i\omega)=B_1-B_3\omega^2.
 \label{eq:nonpassive}
\end{equation}
A negative value gives negative mean contact receipt under sustained sinusoidal rate, so this cubic cannot be passive at all frequencies. The rational contact \eqref{eq:rational} has a passive component realization. A polynomial approximation can be useful inside a restricted band without inheriting that property globally.

Stability of the coupled derivative model is a separate check. Its characteristic polynomial is
\begin{equation}
 P_N(s)=J_hJ_as^4+J_hs^2K_j(s)
                +K_N(s)[(J_h+J_a)s^2+K_j(s)].
 \label{eq:truncated-characteristic}
\end{equation}
For $N=4$, the leading term is $-(J_h+J_a)k_mT^4s^6$, while $P_4(0)=k_0k_j>0$. By continuity there is a positive real root. This fourth-order Taylor contact is unstable for every positive parameter set in this assembly. Increasing Taylor order has improved the frequency remainder and simultaneously introduced an inadmissible time-domain mode. A stable rational realization avoids that particular artifact.

# Numerical assessment
\label{sec:assessment}

## Parameters, calibration and evaluation conditions

We nondimensionalize with inertia $J_0>0$, stiffness $K_0>0$, incoming-speed scale $\Omega_0>0$ and time $t_s=\sqrt{J_0/K_0}$. Angle, torque and work scales are $\Omega_0t_s$, $K_0\Omega_0t_s$ and $J_0\Omega_0^2$. Damping coefficients scale by $J_0/t_s$ and relaxation times by $t_s$. All numerical values below use these dimensionless variables. A possible illustrative unit assignment is $J_0=10^{-4}\,\mathrm{kg\,m^2}$, $K_0=10^4\,\mathrm{N\,m/rad}$ and $\Omega_0=100\,\mathrm{rad/s}$; the time, torque and work scales then are $0.1$ ms, $100$ N m and $1$ J. These are unit choices for an example, rather than estimates from a commercial tool.

The resolved reference parameters are
\begin{equation}
 J_h=2,\quad J_a=1,\quad k_0=1,\quad c_0=3/50,\quad
 k_m=3/5,\quad T=1/5,\quad k_j=4,\quad c_j=2/25.
 \label{eq:parameters}
\end{equation}
For the optional reference triple $J_*=J_0$, $c_*=$ the dimensional $c_0$, $k_*=K_0$, the cubic weights are $(1,3,-3/125,2/25)$. The reference inertia here supplies units only. The initial reference store $z(0)$ is zero. The initial total energy at $\Omega=1$ is exactly one work unit.

The nominal condition is $\Omega=1$ with \eqref{eq:parameters}. The linear and nonlinear baselines each identify two positive contact parameters from the reference's nominal torque peak and duration. Equal logarithmic errors in these two observables define the fitting objective. Approximate fitted values are
\begin{equation}
 (k_L,c_L)\simeq(1.02404436,0.15477825),\qquad
 (\kappa,\alpha)\simeq(0.72861582,1.68219246).
 \label{eq:fitted}
\end{equation}
The rigid baseline sets $e$ equal to the reference's nominal outgoing relative-speed ratio. The cubic coefficients are calculated from \eqref{eq:cubic-coefficients} without fitting a trajectory. It consequently uses four known contact component parameters and their preparation, whereas each fitted finite-duration baseline has two effective parameters. This difference in information prevents interpreting a better cubic result as an equal-budget identification advantage.

Model-order assessment uses the exact contact response at the separate frequencies $\omega T=0.075,0.15,0.25$, together with the stability check \eqref{eq:truncated-characteristic}. Among Taylor orders one through four, the cubic has the smallest response error among the stable candidates for this configuration. The fourth-order candidate is rejected by its positive real root. Frequency results at $\omega T=0.12,0.18,0.30$ are then evaluated without coefficient changes; $0.50$ and $1.00$ examine extrapolation.

The finite-pulse evaluations change one physical quantity at a time after nominal calibration. Cases II and III change $\Omega$ to $1/2$ and $2$. Cases IV and V change $k_j$ to $2$ and $8$, keeping contact fixed. Cases VI and VII multiply $k_0$ and $k_m$ by $\lambda=3/4$ and $5/4$, keeping $c_0,T$ fixed. This last change scales the Maxwell spring and its series damper together. The cubic recomputes its coefficients from those independently given component values. The alternative models use an explicit transfer rule: $k_L$ or $\kappa$ scales by $\lambda$, while $c_L$ or $\alpha$ stays fixed. That rule is an additional hypothesis for those models and does not reproduce the Maxwell branch's change of damping. No changed-condition trajectory is refitted.

## Numerical checks and their scope

The active state equations and signed work integrals were integrated with an explicit embedded Runge–Kutta method of order eight, relative tolerance $2\times10^{-10}$, absolute tolerance $2\times10^{-12}$ and maximum step $t_s/80$. Release was located as a terminal root of the guard. Torque maxima were located from the continuous trajectory, including the engagement endpoint. A repeat with maximum time step halved and local error tolerances reduced by a factor of sixteen changed every reported peak, duration, outgoing body speed and port work by less than $2.6\times10^{-9}$ relative to its refined value. For these unforced blows, define the normalized physical residual as $[E(t_1^-)-E(0)+D_c+D_j]/E(0)$. Its largest absolute value across reference, linear and nonlinear evaluations was $1.1\times10^{-10}$. Rounded table precision is much coarser than these changes.

These are numerical consistency estimates, rather than rigorous global error bounds. The cubic was checked against both body ledgers and the signed contact identity; it has no separately assigned positive physical contact store. The exact algebraic fourth- and fifth-order reductions were checked by direct expansion. A separate initialized, smoothly forced fifth-order calculation agreed with the resolved hammer angle to within $2\times10^{-10}$ angle units. Equivalence follows from the elimination with compatible preparation; the numerical check exercises that construction.

The coefficients and frequency responses are evaluated directly from their declared expressions, with no numerical differentiation of observations. All evaluated cubic assembly roots have negative real part; the least negative real part over the parameter changes is approximately $-0.0190$. This is a finite-configuration stability observation. The nominal fourth-order truncation has a positive real root approximately $28.711/t_s$, in agreement with the analytical sign argument. No material or measurement uncertainty is estimated because no measurements enter this comparison.

## Pulse, rebound and body motion

The nominal reference has torque peak approximately $1.167662$, duration $4.778857$, and outgoing relative-speed ratio
$e_{\rm out}=-v(t_1)/\Omega\simeq0.640040$. Table \ref{tab:nominal} records the nominal observables. The two fitted contacts match the nominal peak and duration but leave rebound and the individual body speeds unconstrained.

| Model | Peak torque | Duration | $\omega_h(t_1)/\Omega$ | $\omega_a(t_1)/\Omega$ | $e_{\rm out}$ |
| :-------------------- | ---------: | --------: | -----------: | -----------: | ---------: |
| Resolved reference | 1.167662 | 4.778857 | -0.853337 | -0.213297 | 0.640040 |
| Exact fifth-order reduction | same | same | same | same | same |
| Fitted linear | 1.167662 | 4.778857 | -0.864593 | -0.205524 | 0.659069 |
| Cubic contact | 1.160324 | 4.785696 | -0.844652 | -0.222663 | 0.621989 |
| Fitted nonlinear | 1.167662 | 4.778857 | -0.597522 | -0.003060 | 0.594462 |
| Rigid event | unresolved | zero-duration event | 0.453320 | 1.093360 | 0.640040 |

: Nominal numerical model outputs; the rigid velocities are immediately after its event. Exact-reduction entries denote mathematical equivalence, not independent fitted outcomes. \label{tab:nominal}

The rigid event matches the chosen relative-speed ratio but gives markedly different individual speeds. A finite contact interval permits a substantial joint reaction and therefore changes total body angular momentum. The instantaneous event omits that interval. Its result cannot be repaired by interpreting an unresolved torque peak as a fitted pulse.

![Nominal contact-torque pulses and body speeds. Curves are numerical solutions of illustrative constitutive models. The linear and nonlinear contacts are fitted to the reference peak and duration only. The body-speed panel compares the resolved reference with the cubic approximation; each trace ends at its own release event.](figures/pulses.pdf){#fig:pulses width=100%}

\FloatBarrier

For the independent changes, let $\epsilon_p=100(p/p_R-1)$ and
$\epsilon_t=100(t_1/t_{1R}-1)$, where subscript $R$ denotes the reference in the same condition. Table \ref{tab:changes} gives these percentage errors. Speed scaling is exact for the reference, linear and cubic homogeneous equations with the declared initialization and guards: torque and body speeds scale with $\Omega$, work with $\Omega^2$, and duration stays fixed. The nonlinear law has a different amplitude dependence.

| Case and change | Linear $\epsilon_p/\epsilon_t$ | Cubic $\epsilon_p/\epsilon_t$ | Nonlinear $\epsilon_p/\epsilon_t$ |
| :------------------------------------ | -----------------------: | -----------------------: | --------------------------: |
| I: nominal | $0.00/0.00$ | $-0.63/0.14$ | $0.00/0.00$ |
| II: $\Omega=1/2$ | $0.00/0.00$ | $-0.63/0.14$ | $-7.89/31.61$ |
| III: $\Omega=2$ | $0.00/0.00$ | $-0.63/0.14$ | $7.97/-20.15$ |
| IV: $k_j=2$ | $-1.07/0.20$ | $-0.44/-0.07$ | $-1.17/9.14$ |
| V: $k_j=8$ | $-0.00/-0.32$ | $-0.99/-0.14$ | $4.93/21.50$ |
| VI: $\lambda=3/4$ | $-0.36/-0.85$ | $-0.64/0.07$ | $3.22/-3.61$ |
| VII: $\lambda=5/4$ | $-0.08/0.56$ | $-0.57/0.02$ | $-1.63/4.11$ |

: Percentage errors in peak and duration against the same-condition synthetic reference. Only condition I supplies pulse calibration. In V the linear peak error rounds to zero from a small negative value. \label{tab:changes}

The cubic improves duration transfer under the changed joint and contact values here. It improves peak over the linear baseline in IV, while the linear baseline has the smaller peak error in V–VII. Its nominal rebound error is approximately $-0.01805$ in absolute ratio, comparable with the linear error $+0.01903$. Under the changed conditions, the ratios are

| Case | Reference $e_{\rm out}$ | Linear | Cubic | Nonlinear |
| :--- | ---------------------: | -----: | -----: | --------: |
| II | 0.64004 | 0.65907 | 0.62199 | 0.69516 |
| III | 0.64004 | 0.65907 | 0.62199 | 0.29723 |
| IV | 0.70963 | 0.71693 | 0.69107 | 0.59446 |
| V | 0.77077 | 0.76958 | 0.77466 | 0.49815 |
| VI | 0.60697 | 0.61156 | 0.60764 | 0.59446 |
| VII | 0.69731 | 0.72301 | 0.66965 | 0.59446 |

: Outgoing relative-speed ratios computed at each model's release guard. Each comparison uses the same incoming body speed and boundary.

The nonlinear model's behavior follows its different constitutive hypothesis and, in several conditions, release at the velocity factor $1+\alpha v=0$ while the contact store remains nonzero. Its weak performance against this linear-memory reference does not rank nonlinear contact laws for a real tool. If the real contact has amplitude-dependent geometry or damping, the linear reference itself may be inadequate.

## Work distinguishes matching pulses

Table \ref{tab:works} integrates all four signed ports on each nominal model's own active interval. The reference's hammer extraction is approximately $0.271816$ work units, whereas the fitted nonlinear contact gives $0.642967$ despite matching peak and duration. Its different body speeds account for this difference.

| Model | $W_h$ | $W_a$ | $W_c$ | $W_j$ |
| :-------------------- | ------: | ------: | ------: | ------: |
| Resolved reference | 0.271816 | 0.045904 | 0.225912 | 0.023156 |
| Fitted linear | 0.252479 | 0.042916 | 0.209563 | 0.021796 |
| Cubic contact | 0.286563 | 0.045275 | 0.241288 | 0.020485 |
| Fitted nonlinear | 0.642967 | 0.022323 | 0.620644 | 0.022318 |

: Signed numerical port works. The exact fifth-order equation has the reference's work when its physical states and ports are reconstructed. Cubic entries are port works, not a decomposition into positive contact stores. \label{tab:works}

For the reference, the endpoint and loss account is
\begin{align}
 E_h(t_1)+E_a(t_1)&\simeq0.750932,& E_j(t_1)&\simeq0.010776,\nonumber\\
 E_c(t_1^-)&\simeq0.012812,& D_c&\simeq0.213100,\nonumber\\
 D_j&\simeq0.012380,& E(0)&=1.
 \label{eq:numerical-ledger}
\end{align}
Before release, the stores and losses sum to the initial energy within the reported integration residual. Across release, $R_c\simeq0.012812$ must remain in \eqref{eq:release}. For the linear and nonlinear contacts their release transfers are approximately $0.005081$ and $0.082995$. Their physical destination is not resolved by this benchmark. Matching a torque pulse does not identify that destination or establish the delivered work.

The cubic hammer-work error is approximately $+5.43\%$ and its joint-work error $-11.53\%$ at the nominal condition. Its good peak and duration approximation has therefore not yielded comparably small work errors. Each changed condition was also checked through its signed port integrals and endpoint body stores; the finite-configuration assessment does not establish a general energy-error bound for the truncation.

## Magnitude, phase and applicable band

Frequency response here means the smooth, continuously engaged linear system, or small perturbations about a sufficiently compressed bias to keep the contact active. It does not mean a Fourier transform of a gated nonlinear blow. With $K$ from \eqref{eq:rational}, the zero-state hammer mobility is
\begin{equation}
 H_h(s)=s\frac{J_as^2+K(s)+K_j(s)}
 {J_hJ_as^4+J_hs^2K_j(s)+K(s)[(J_h+J_a)s^2+K_j(s)]}.
 \label{eq:memory-mobility}
\end{equation}
Replacing $K$ by $K_N$ or $k_L+c_Ls$ defines the corresponding response. Relative contact error and phase error are
$\lvert K_N-K\rvert/\lvert K\rvert$ and $\arg(K_N/K)$. Relative magnitude error is $\lvert K_N\rvert/\lvert K\rvert-1$; phase and magnitude are evaluated separately rather than merged into a pulse-fit score.

Writing $x=\omega T$, the cubic remainder and the positive real part of the reference stiffness give
\begin{equation}
 \frac{\lvert K(i\omega)-K_3(i\omega)\rvert}{\lvert K(i\omega)\rvert}
 =\frac{k_m x^4}{\sqrt{1+x^2}\,\lvert K(i\omega)\rvert}
 \le\frac{k_m}{k_0}x^4.
 \label{eq:band-bound}
\end{equation}
For \eqref{eq:parameters} and $0\le x\le0.30$, the bound is $0.00486$, or $0.486\%$. It bounds the contact complex error on that band, with no claim about a switched pulse. The actual endpoint error is approximately $0.431\%$.

| $x=\omega T$ | Linear contact magnitude error (%) | Cubic contact magnitude error (%) | Linear contact phase (deg) | Cubic contact phase (deg) |
| -----------: | ---------------------------------: | --------------------------------: | ------------------------: | -----------------------: |
| 0.12 | 1.387 | 0.0119 | -0.873 | -0.0016 |
| 0.18 | 0.230 | 0.0568 | -1.102 | -0.0112 |
| 0.30 | -2.784 | 0.3721 | -0.889 | -0.1244 |
| 0.50 | -7.694 | 1.9931 | 1.501 | -1.1384 |
| 1.00 | -10.351 | 13.6962 | 12.304 | -14.1555 |

: Numerical evaluation of declared frequency responses. The last two frequencies lie outside the selected $x\le0.30$ band.

The first-order Taylor contact $k_0+(c_0+k_mT)s$, which is distinct from the pulse-fitted linear contact, has complex errors approximately $0.846\%$, $1.856\%$ and $4.789\%$ at $x=0.12,0.18,0.30$. The corresponding cubic errors are $0.0122\%$, $0.0601\%$ and $0.4310\%$. This isolates the effect of retaining two more terms of the same component-derived expansion.

![Contact response errors and hammer-mobility phase errors against the resolved reference. Curves evaluate the declared rational and polynomial laws; they represent illustrative model responses. The shaded region is the selected contact-approximation band. The first-order Taylor contact is included separately from the pulse-fitted linear baseline.](figures/frequency.pdf){#fig:frequency width=100%}

\FloatBarrier

Contact error can be amplified near an assembly resonance. At $x=0.12$, the fitted linear contact's hammer-mobility phase error is approximately $7.406^\circ$, while the cubic error is $0.0352^\circ$. At $x=0.30$, the cubic hammer-mobility magnitude error is approximately $0.0432\%$ and its phase error $-0.0102^\circ$. These values illustrate why both the component and assembled response should be evaluated. A small mobility error far above a body resonance can also hide a poor contact approximation; at $x=1$ the cubic contact complex error has grown to approximately $29.63\%$.

With \eqref{eq:parameters}, \eqref{eq:nonpassive} becomes negative for
$x>\sqrt{3/2}$. Moreover the Taylor series reaches its convergence boundary at $x=1$. Neither limit is a hardware bandwidth. Under the optional unit assignment, $x\le0.30$ corresponds to frequencies up to approximately $2.39$ kHz for this illustrative contact. An actual driver requires identification of its relaxation times, other modes, geometry and sensor bandwidth before that conversion has physical significance.

## A broader domain of contact approximations

To check whether the nominal cubic result persists, consider 108 additional dimensionless passive configurations, with $J_a=k_0=1$, $c_j=0.08$, $\Omega=1$ and zero initial memory. Independently let
$J_h\in\{0.5,2,8\}$, $k_j\in\{0.5,2,8\}$,
$c_0\in\{0.02,0.12\}$, $k_m\in\{0.2,1.2\}$ and
$T\in\{0.05,0.2,0.8\}$.
All derivative coefficients come from these known components. The first-order comparator is $K_1=k_0+(c_0+k_mT)s$, so this assessment uses the same supplied component information without fitting any pulse. Each model uses its own descending torque-zero release. The second-order equation determines its initial acceleration; the cubic uses the physical reference acceleration. Their different engagement layers remain part of the comparison.

The assembled first-, second- and third-order Taylor contacts are stable in respectively 108, 96 and 75 configurations. None of the contacts of orders four through eight is stable in this domain. Independent time scaling reproduces all 864 root classifications, with maximum normalized polynomial residual $7.59\times10^{-14}$. The fourth-order instability has the general proof given above; the higher-order counts are finite numerical observations. They do not establish a theorem for every contact or assembly.

On the common 75 stable configurations, the following errors compare each first-blow prediction with its passive state reference:

| Observable | First order | Second order | Third order |
| :----------------------- | -------------: | -------------: | -------------: |
| Contact peak | 0.544 (16.05) | 0.378 (11.45) | 0.349 (12.14) |
| Duration | 0.096 (10.64) | 0.049 (14.72) | 0.030 (65.12) |
| Hammer-port work | 0.608 (10.72) | 0.716 (13.49) | 0.697 (72.71) |
| Joint-port work | 2.394 (38.83) | 1.987 (43.40) | 1.338 (191.58) |

: Median absolute relative error in percent, with maximum in parentheses, over the same 75 configurations. Counts and errors describe this chosen domain, not a distribution of commercial tools.

The cubic improves contact peak, duration, hammer work and joint work over first order in respectively 65, 58, 28 and 68 of these 75 configurations. Thus a smaller median duration or joint-work error coexists with substantial adverse cases. A small reference work can magnify a relative error; the signed nominal absolute works in Section~\ref{sec:assessment} give a complementary scale. Stability and low-band contact accuracy alone do not control an event-ended pulse or its signed work. No positive contact store is assigned to the second- or third-order truncation.

More than one memory introduces further independent time scales. For
$K=k_0+c_0s+\sum_\ell g_\ell T_\ell s/(1+T_\ell s)$,
the derivative coefficients contain moments $m_k=\sum_\ell g_\ell T_\ell^k$.
The positive two-memory example $(g_1,T_1)=(1/2,1)$,
$(g_2,T_2)=(1/2,3)$ has $m_1=2$, $m_2=5$, $m_3=14$.
A single memory $(g,T)=(4/5,5/2)$ has the same first two moments but
$m_3=25/2$. Matching coefficients through second order therefore does not
identify the memory spectrum. In 27 additional two-memory configurations
with total strength $0.6$, fast time $\{0.05,0.2,0.8\}$,
time ratio $\{2,5,20\}$ and fast-branch strength share $\{0.1,0.5,0.9\}$,
only nine assembled cubic contacts are stable. Their resolved positive
branch models retain a physical passive realization. A different $r$ at
fixed references cannot supply the missing relaxation poles.

The added passive reference calculations close their normalized component energy balances within $2.22\times10^{-13}$. Representative refinements change reported observables by at most $6.26\times10^{-10}$ after normalization by $\max(1,|\text{value}|)$. Adverse cases are refined separately. These are numerical consistency checks; the component laws and configurations remain illustrative assumptions.

# Identification, parameter burden and physical limits
\label{sec:limits}

A rigid event needs one empirical restitution parameter and the incoming body state. A linear contact needs two contact parameters and four body states. The fixed-exponent nonlinear contact also needs two parameters, with its geometry assumption. The passive relaxation reference needs four contact parameters and an internal preparation in addition to the body states. Its exact fifth-order equation carries the same burden. The derived cubic also uses all four contact parameters and a compatible acceleration; fitting its coefficients independently would add conditioning and realization questions. All models require separate joint information.

Measuring only hammer motion makes contact and boundary attribution difficult. Equations \eqref{eq:bodies} show the useful distinction: with known $J_h$ and $u$, hammer acceleration gives $\tau_c$, while synchronized anvil acceleration gives
$\tau_j=\tau_c-J_a\dot\omega_a$. Joint torque and motion can then be identified separately from contact deformation and relative speed. A fixed-anvil experiment suppresses the boundary motion columns and cannot identify the same moving-joint response. Sensor transfer functions, inertia uncertainty and time synchronization would enter any measured assessment.

Derivative identification is particularly sensitive to noise. An angular error
$\epsilon\sin(\omega_nt)$ contributes a $k$th-derivative error of amplitude $\epsilon\omega_n^k$, and a torque-term error of amplitude $\lvert B_k\rvert\epsilon\omega_n^k$. The cubic term therefore amplifies high-frequency angle noise as the cube of frequency. Model-based state estimation or regularized differentiation must declare its effective bandwidth and bias. Adding a term because its absolute instantaneous power contribution is large can select differentiated noise or hide cancellation; order selection must instead assess independent predictions, initialization and stability.

Calibration should use one set of blows or measured response conditions. Order selection should use separate conditions, including stability and passivity checks. Final evaluation should change speed and independently characterized joint/contact properties with the retained parameters or a declared parameter law. The present numerical comparison separates nominal pulse calibration, frequency-order assessment and changed-condition evaluation. Its finite conditions and known synthetic reference do not provide statistical evidence about the range of an actual tool.

A decisive physical assessment would record synchronized hammer and anvil motion and contact or reconstructed torque for single blows against independently characterized tightened joints. Incoming speed would change without silently changing the contact fit; joint preload or attachment would change only with their effective stiffness, loss and slip characterized. Signed torque–rate integrals, outgoing body states and release motion would distinguish similar peak-and-duration fits. Measurement uncertainty would need to include calibration, alignment, sensor dynamics, inertias and differentiation. No such measured comparison is completed here.

There are further limits. The nominal contact reference contains one linear relaxation; a real blow can involve multiple modes, distributed waves, plastic deformation, variable face geometry, friction and microslip. A finite linear derivative law cannot represent those mechanisms globally. A nonlinear law should be assessed against nonlinear evidence, rather than judged solely by agreement with a linear-memory reference. The calibrated speed range is $\Omega/\Omega_0\in\{1/2,1,2\}$, the nominal joint-stiffness range is $k_j/K_0\in\{2,4,8\}$, and its contact-stiffness multipliers are $\{3/4,1,5/4\}$. The additional passive configurations broaden the mathematical comparison, but do not establish an actual tool's operating range, interior behavior or other preparation states.

Finally, the release transfer is known as a model store but its physical destination is unresolved. Run-up, repeated blows, hammer lift and engagement changes need additional hybrid states and inputs. A tightening sequence also needs preload-dependent boundary evolution. Extending derivative order alone supplies none of that information.

# Tool subsystems with a stronger case for higher order

## Flexible bit or socket and the output joint

The main comparison treats the attachment as rigid with the anvil. If a bit, socket or extension has a relevant torsional mode, it should instead receive a separate inertia $J_s>0$, angle $\theta_b$ and connection
$K_s(s)=k_s+c_ss$ to the anvil. Here $J_a$ excludes $J_s$.
Keep the contact deformation $\theta_h-\theta_a$ and joint torque
$\tau_j=k_j\theta_b+c_j\dot\theta_b$ distinct. The output equations are
\begin{equation}
 J_a\ddot\theta_a=\tau_c-\tau_s,\qquad
 J_s\ddot\theta_b=\tau_s-\tau_j,\qquad
 \tau_s=k_s(\theta_a-\theta_b)+c_s(\dot\theta_a-\dot\theta_b).
 \label{eq:flexible-output}
\end{equation}
For zero initial states, eliminating $\theta_b$ gives the rational boundary
\begin{equation}
 \tau_s(s)=K_b(s)\theta_a(s),\qquad
 K_b(s)=\frac{K_s(s)[J_ss^2+K_j(s)]}{J_ss^2+K_s(s)+K_j(s)}.
 \label{eq:rational-boundary}
\end{equation}
Nonzero output preparation requires the corresponding initial-state contribution. The boundary denominator exposes an internal mode. Its omission cannot be repaired by relabelling an existing coefficient of the contact law.

For a linear contact, put $A_a=J_as^2+K_c+K_s$ and
$A_b=J_ss^2+K_s+K_j$. The full observation equation is
\begin{equation}
 P_6(D)\theta_h=N_4(D)u,\quad
 N_4=A_aA_b-K_s^2,\quad
 P_6=(J_hs^2+K_c)N_4-K_c^2A_b.
 \label{eq:sixth-order}
\end{equation}
It is generally sixth order, with six compatible initial derivatives obtained from the component states. The rigid limit is $K_b\to J_ss^2+K_j$ as $k_s\to\infty$ on a finite frequency band. Only then are the anvil and attachment inertias combined as $J_a+J_s$.

The physical storage now adds
$J_s\dot\theta_b^2/2+k_s(\theta_a-\theta_b)^2/2$, and the joint store uses $\theta_b$. The exact balance is
\begin{equation}
 \dot E=u\omega_h-c_c(\omega_h-\omega_a)^2
 -c_s(\omega_a-\omega_b)^2-c_j\omega_b^2.
 \label{eq:flexible-energy}
\end{equation}
At separation only the removed contact store belongs to the unresolved release transfer. Socket and joint stores remain. The relevant joint work is now $\int\tau_j\omega_b\,\mathrm dt$.

A comparison with equal supplied component information uses
$J_h=2$, $J_a=k_c=1$, $c_s=0.04$, $c_j=0.08$,
$J_s\in\{0.05,0.2,1\}$, $k_s\in\{0.25,1,4,16\}$,
$k_j\in\{0.5,2,8\}$ and $c_c\in\{0.03,0.15\}$.
All 72 configurations start with zero angles, hammer speed one and stationary output bodies. Each finite model releases at its own descending contact-torque zero. The comparator combines $J_a+J_s$ rigidly and preserves the same contact and joint laws; no parameters are fitted. Median absolute relative rigid-model errors are $8.15\%$ in contact peak, $10.96\%$ in joint peak, $14.08\%$ in contact duration and $31.03\%$ in joint work. Joint peaks and work here refer to each model's first contact interval, excluding later output ringing.

For $J_s=0.2$, $k_s=1$, $k_j=2$, $c_c=0.03$, Figure~\ref{fig:subsystems} illustrates the boundary response and joint torque. The rigid contact peak differs by only $-3.16\%$, while its joint peak differs by $+40.59\%$ and duration by $-19.41\%$. The flexible connection retains $0.04964$ work units at separation, compared with $0.000280$ in the removed contact spring. Contact-pulse agreement can therefore conceal both a different output pulse and substantial retained output storage.

![A separate flexible output boundary exposes a resonance and changes joint torque, even when the contact peak is similar. Parameters are those of the declared illustration. Torque curves end at each model's separation; both axes use the dimensionless units of the comparison.](figures/subsystems.pdf){#fig:subsystems width=100%}

This is a conditional numerical case for retaining the boundary mode or its exact higher-order representation. It is strongest when the mode affects the required magnitude, phase or port response. It supplies no hardware accuracy gain over the same resolved component model. A rigid output remains a useful approximation where independently measured boundary response supports it. Moreover, [Kretschmer et al. (2026)][friction] found no significant socket-length effect on thread friction and only a small bearing-friction effect at high preload in their tested joints. A transmission benefit cannot be promoted as an established improvement in friction or achieved preload.

## Motor and battery during hammer preparation

Run-up or the interval between blows can require electrical memory separately from the contact. The publisher description of [Öztürk and Yılmaz (2026)][motor] reports an experimentally evaluated battery, motor, transmission and hammer model. [Benazet et al. (2025)][control], in the explicitly cited preprint version, model and control the nonlinear mechanism between impacts. These works motivate separate preparation and impact models; neither validates the present derivative contact coefficients.

For a fixed averaged DC operating mode, an illustrative component model is
\begin{align}
 L\dot i&=V-Ri-k_e\omega-\sum_{\ell=1}^n v_\ell,\nonumber\\
 C_\ell\dot v_\ell&=i-v_\ell/R_\ell,\qquad
 J\dot\omega=k_ti-b\omega-\tau_L.
 \label{eq:motor-state}
\end{align}
Here $R$ includes series electrical loss, $\tau_L$ is the torque at the declared mechanical load port, and each positive $R_\ell,C_\ell$ represents a polarization branch. All quantities refer to one declared shaft; reflected gearing must transform inertia, torque and speed consistently. With zero initial states,
\begin{equation}
 Z_e(s)=Ls+R+\sum_\ell\frac{R_\ell}{1+sR_\ell C_\ell},\qquad
 [Z_e(s)(Js+b)+k_ek_t]\omega=k_tV-Z_e(s)\tau_L.
 \label{eq:motor-elimination}
\end{equation}
Clearing the branch denominators generally gives order $n+2$ for speed and $n+3$ for angle. Voltage and load-torque forcing operators differ. Distinct branch times and observable coupling are required for that minimal-order interpretation; coincident or hidden modes can reduce it.

For $k_e=k_t$ in compatible SI units, the independently derived component balance is
$\dot E=Vi-Ri^2-b\omega^2-\tau_L\omega-\sum v_\ell^2/R_\ell$,
with $E=Li^2/2+J\omega^2/2+\sum C_\ell v_\ell^2/2$.
This gives a physical interpretation to the retained memory. The higher-order representation can be useful when electrical and mechanical transients both matter for the incoming state. It is an analytical candidate here, rather than a completed tool comparison. Commutation, saturation, controller limits, battery temperature and hammer engagement need their own modes or parameter dependence. A constant-coefficient scalar equation alone does not predict the next collision.

## What the available measurements establish

[Kretschmer, Döllken and Matthiesen (2025)][jointdata] provide a public dataset of M10–M20 impact tightening with different power levels and sockets. Its primary description documents preload, thread torque and bearing torque; the associated [article][friction] states 1 MHz acquisition and 100 kHz filtering. These are valuable joint measurements. Their documented scope does not supply a synchronized hammer/anvil incoming state and angular contact-port record for the comparison in Section~\ref{sec:limits}. The raw dataset is not fitted here, and published joint torque is not substituted for hammer–anvil contact torque. Direct contact ranking, rebound and signed contact-port work consequently remain unevaluated on hardware.

# Conclusion

A weighted higher-order contact law can represent an approximation to eliminated linear contact memory. Its coefficients can be derived from specified components or identified, but their dimensions do not select their values, mechanisms or preparation. Exact fourth- and fifth-order observation equations retain the assembly's behavior when forcing operators, initial derivatives and events are preserved; they establish equivalence rather than an accuracy improvement.

For the illustrative relaxation contact, the cubic expansion improves low-frequency contact magnitude and phase and selected duration-transfer predictions. It leaves noticeable rebound and work errors and does not consistently improve peak torque over a two-parameter calibrated linear contact. Its contact complex error is bounded by $0.486\%$ on the declared $\omega T\le0.30$ band, while the finite pulse still contains an engagement layer and higher-frequency content. The fourth-order Taylor contact is unstable, and the cubic fails a global passivity condition. The rational state model retains the passive realization and exact preparation.

The nonlinear baseline shows that matching nominal peak and duration can conceal large differences in body motion and signed work, particularly after a speed change. That result concerns the chosen linear-memory reference. Broader passive configurations also expose cubic instability and substantial adverse pulse errors despite improved low-band approximation. Further $r$ choices cannot replace missing independent component ratios or relaxation states.

The strongest added numerical case concerns the flexible output boundary, where preserving a separate mode changes joint torque and retained storage while leaving the contact peak relatively close. Motor and battery preparation provide a further analytical application of exact higher order. Establishing predictive performance for an impact driver still requires independent single-blow measurements, a separately characterized joint, quantified uncertainty and an identified release mechanism. Those remain the physical evaluation needed to determine whether the additional terms improve a real tool model.

# References {-}

1. Nilre, H., and Herlin, B. C. (2026). *Third- and Higher-Order ODEs: Coefficient synthesis, identification, and physical realization*. Public article, first version 26 September 2026; version at revision `4bdb25c`. [Verified manuscript][third].
2. Wettstein, A., Grauberger, P., and Matthiesen, S. (2021). Modeling dynamic mechanical system behavior using sequence modeling of embodiment function relations: case study on a hammer mechanism. *SN Applied Sciences*, **3**, article 128. [doi:10.1007/s42452-021-04149-8][wettstein].
3. ter Braack, T., and Margolis, D. L. (2026). Modeling of an Impact Wrench for Use in Reducing Hand–Arm Vibrations. *Machines*, **14**(2), article 213. [doi:10.3390/machines14020213][braack].
4. Stronge, W. J. (2018). *Impact Mechanics*, 2nd edition. Cambridge University Press. Chapter 1, Introduction to Analysis of Low-Speed Impact, pp. 1–20. [doi:10.1017/9781139050227.003][stronge].
5. Hunt, K. H., and Crossley, F. R. E. (1975). Coefficient of Restitution Interpreted as Damping in Vibroimpact. *Journal of Applied Mechanics*, **42**(2), 440–445. [doi:10.1115/1.3423596][hunt].
6. Carvalho, A. S., and Martins, J. M. (2019). Exact restitution and generalizations for the Hunt–Crossley contact model. *Mechanism and Machine Theory*, **139**, 174–194. [Publisher version][carvalho].
7. Willems, J. C. (1972). Dissipative dynamical systems part I: General theory. *Archive for Rational Mechanics and Analysis*, **45**(5), 321–351. [doi:10.1007/BF00276493][willems].
8. Kretschmer, T., Doellken, M., Haberkern, P., Frank, N., Leitenberger, F., Albers, A., and Matthiesen, S. (2026). Frictional behavior of bolted joints during impact tightening. *Discover Applied Sciences*, **8**, article 152. [doi:10.1007/s42452-026-08273-1][friction].
9. Kretschmer, T., Döllken, M., and Matthiesen, S. (2025). *Measurement data of impact tightening process of M10–20 bolted joints*. Karlsruhe Institute of Technology, published 19 November 2025. Dataset. [doi:10.35097/yjdmucmycjkbm09g][jointdata].
10. Öztürk, B., and Yılmaz, S. (2026). Dynamic modeling and analysis of a battery-powered screwdriver equipped with a hammer mechanism. *Mechatronics*, **116**, article 103483. [doi:10.1016/j.mechatronics.2026.103483][motor].
11. Benazet, M., Ricca, F., Bralla, D., Zeilinger, M. N., and Carron, A. (2025). Learning-based Approximate Model Predictive Control for an Impact Wrench Tool. Preprint, arXiv:2512.16624v1, 18 December 2025. [Version consulted][control].

[third]: https://github.com/hobnilre/physics-ode-3rd-deg/blob/4bdb25cbf6057a848bf9fba09c98db7c5ddc9e9a/third-and-higher-order-odes.md
[wettstein]: https://doi.org/10.1007/s42452-021-04149-8
[braack]: https://doi.org/10.3390/machines14020213
[stronge]: https://doi.org/10.1017/9781139050227.003
[hunt]: https://doi.org/10.1115/1.3423596
[carvalho]: https://doi.org/10.1016/j.mechmachtheory.2019.03.028
[willems]: https://doi.org/10.1007/BF00276493
[friction]: https://doi.org/10.1007/s42452-026-08273-1
[jointdata]: https://doi.org/10.35097/yjdmucmycjkbm09g
[motor]: https://doi.org/10.1016/j.mechatronics.2026.103483
[control]: https://arxiv.org/abs/2512.16624v1
