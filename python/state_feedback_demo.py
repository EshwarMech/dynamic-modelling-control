"""
State-Feedback Control Demo

Dynamic Modelling & Control Portfolio

Control law:

    u = -Kx

The controller uses state feedback to modify the
closed-loop dynamics of the system.
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


# Desired closed-loop poles

desired_poles = [-2, -3]


# Calculate state-feedback gain

K = signal.place_poles(
    A,
    B,
    desired_poles
).gain_matrix


# Closed-loop system

A_closed = A - B @ K

closed_loop_system = signal.StateSpace(
    A_closed,
    B,
    C,
    D
)


# Simulation

time = np.linspace(0, 10, 1000)

initial_state = np.array([1, 0])

input_signal = np.zeros_like(time)


time, output, states = signal.lsim(
    closed_loop_system,
    U=input_signal,
    T=time,
    X0=initial_state
)


# Plot response

plt.figure()

plt.plot(
    time,
    states[:, 0],
    label="State-feedback"
)

plt.xlabel("Time (s)")
plt.ylabel("Position")

plt.title("State-Feedback Controlled Response")

plt.grid(True)

plt.legend()

plt.show()


# Display gain

print("State-feedback gain K:")
print(K)
