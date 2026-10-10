# Modeling a Single Rotary Impact

*Synthesized coefficients, an unknown hammer component, and COP*

Hob Nilre & Bo C. Herlin

[Read the article](physics-impact-driver-model.pdf) · [Manuscript](physics-impact-driver-model.md)

## What this article adds, and why it matters

The article models one hammer–anvil collision against a tightened joint. It
constructs third- and fourth-derivative torque coefficients and treats their
contribution as an unknown component inside the hammer. Ordinary linear and
nonlinear contacts provide comparisons. Signed torque–speed integrals give
anvil receipt, joint work, the unknown component's work and apparent COP.

A separate order comparison explains why fourth order recovers collision
features missed by lower-order scalar models. Worked impacts show how supplied
work can strengthen rebound or reach the joint, including a stated case with
apparent COP above one. Boundary conditions, prepared higher-order states,
contact release and a growing mode are included in the interpretation.

The construction and energy convention follow two companion articles:

- [ODE Coefficient Synthesis](https://github.com/hobnilre/physics-ode-coefficient-synthesis)
- [Energy Ledgers for Forced Harmonic ODEs](https://github.com/hobnilre/physics-ode-energy)

## Build the PDF

Install GNU Make, Pandoc, XeLaTeX with TikZ/PGFPlots, and TeX Gyre fonts. Then run:

```sh
make pdf
```

Figures are built from the included TeX sources. Intermediate files go in the
ignored `build/` directory; no private research or external project is required.
Use `make -B pdf` to force a rebuild and `make clean` to remove intermediates.
The first-version date is 2026-10-05. The PDF creation timestamp records the
actual rebuild time.

<!-- article-tools:translations:start -->
## Translations

- Svenska: [PDF](sv/physics-impact-driver-model-sv.pdf) · [Markdown](sv/physics-impact-driver-model-sv.md)

<!-- article-tools:translations:end -->
