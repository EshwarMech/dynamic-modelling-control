"""
State-Space Modelling Demo

Dynamic Modelling & Control Portfolio

This script demonstrates a simple continuous-time
state-space model and its response to an initial condition.
"""

import numpy as np
import matplotlib.pyplot as plt
from scipy import signal


# System matrices

A = np.array([
    [0, 1],
    [-2, -0.5]
])

B = np.array([
    [0],
    [1]
])

C = np.array([
    [1, 0]
])

D = np.array([
    [0]
])


# Create state-space system

system = signal.StateSpace(A, B, C, D)


# Simulation time

time = np.linspace(0, 10, 1000)


# Initial condition

initial_state = np.array([1, 0])


# Zero input

input_signal = np.zeros_like(time)


# Simulate response

time, output, states = signal.lsim(
    system,
    U=input_signal,
    T=time,
    X0=initial_state
)


# Plot position

plt.figure()

plt.plot(time, states[:, 0])

plt.xlabel("Time (s)")
plt.ylabel("Position")

plt.title("State-Space System Response")

plt.grid(True)

plt.show()
