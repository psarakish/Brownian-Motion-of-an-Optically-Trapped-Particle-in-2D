# Brownian Motion Simulation using Langevin Dynamics

This project simulates the 2D trajectory of a Brownian particle in an optical trap using Langevin dynamics. The simulation models the effects of viscous drag, stochastic thermal noise, and the restoring optical force, solving Langevin’s stochastic differential equation via a finite difference approach.

## 🧪 Overview

- Simulates passive and active Brownian motion in a viscous fluid
- Models an optically trapped particle subject to:
  - Drag force
  - Thermal (stochastic) noise
  - Optical restoring force
- Implements Langevin’s equation in two dimensions
- Outputs particle trajectories over time

## ⚙️ Parameters

- Particle radius: `R = 1e-6 m`
- Temperature: `T = 300 K`
- Fluid viscosity: `η = 0.001 Pa·s`
- Trap stiffness: `kx = ky = 1e-6 N/m`
- Initial position: `(x, y) = (0, 0)`
- Time step: `Δt = 1e-2 s`
- Number of time steps: `N = 1000`
- Simulation domain: `L = 20 µm` (for bounded environment)

