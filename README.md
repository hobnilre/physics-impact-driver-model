# A Higher-Order ODE Model for a Rotary Impact Driver

*Comparison with established models and assessment of performance*

Hob Nilre & Bo C. Herlin

Read the [article](physics-impact-driver-model.md) or the
[PDF](physics-impact-driver-model.pdf).

## What this article adds, and why it matters

Can higher derivatives improve the model of one hammer–anvil blow against a
tightened fastener? This article compares rigid restitution, switched linear
contact, a Hunt–Crossley-type nonlinear contact and a contact with resolved
linear memory, while keeping the output joint separate.

It derives exact fourth- and fifth-order observation equations and a cubic
contact approximation with an explicit remainder. Illustrative numerical
comparisons assess torque pulses, rebound, body motion, signed work and
frequency-response magnitude and phase. A broader assessment covers contact
orders one through eight, multiple relaxation times and a flexible output
boundary. The cubic retains the passive reference's five states and four contact
parameters while losing global passivity and sometimes stability. Accuracy
requirements change the comparison: first-order and cubic contacts pass in 70
and 64 of 108 configurations at a common normalized tolerance of 0.05, but in
43 and 49 at 0.01. These exploratory counts include stability failures. A stable
adverse case shows why a good frequency approximation can still predict a
different end to a blow.

When the relaxation components are known, the passive state realization is the
preferred simulation form. Derivative coefficients remain useful for finite-band
interpretation and exact observation equations. Separate socket or bit compliance
and dynamics can substantially change first-contact joint response and retained
energy; the reported work excludes later output ringing. Exact second-order stability
and coefficient-interpretation conditions, a bounded sensitivity exercise, and
explicit scalar initialization clarify the limits. Hardware contact ranking and
measured accuracy improvement remain unevaluated.

The coefficient notation is defined locally, with a reference to
[Third- and Higher-Order ODEs](https://github.com/hobnilre/physics-ode-3rd-deg/blob/main/third-and-higher-order-odes.md).

## Build

Run `make pdf` to build `physics-impact-driver-model.pdf`. Install GNU Make,
GNU Coreutils, Pandoc, XeLaTeX and TeX Gyre fonts, with the LaTeX packages used
by the preambles and the standalone TikZ/PGFPlots figures.

All publication build inputs are local. The default scratch directory is
ignored `build/`; `BUILD_DIR=/absolute/path` selects another location.
`make clean` removes scratch files and retains the article PDF and figure assets.
Figure sources contain the plotted illustrative results needed for the build.

The first-version date is pinned in the manuscript and `ARTICLE_DATE` in the
Makefile. The build prints the PDF creation time in UTC above the repository link.
Article-specific LaTeX belongs in `preamble-local.tex`. Shared typography is
installed in `article-style.yaml`, `preamble.tex` and `figures/figure-style.tex`.
