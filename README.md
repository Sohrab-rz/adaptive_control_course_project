# Adaptive Control and Switching Systems — Course Projects

**Author:** Sohrab Rezaei  
Email: srezaei2@jhu.edu
---

## Table of Contents

1. [Project 1 – Course Project 1](#project-1)  
   1.1 Implementation  
     1.1.1 Rohrs' Counterexample Simulation  
     1.1.2 Dead-Zone Method  
     1.1.3 σ‑Modification Method  
     1.1.4 Control-Parameter Bounding Method  
     1.1.5 Effect of PE Input Signal  
   1.2 Results  
     1.2.1 Rohrs' Counterexample Results  
     1.2.2 Dead-Zone Results  
     1.2.3 σ‑Modification Results  
     1.2.4 Control-Parameter Bounding Results  
     1.2.5 Effect of PE Signal Results  

2. [Project 2– Course Project 3](#project-2)  
   2.1 Problem Definition  
   2.2 Simulation  
   2.3 PID Tuning Method  
   2.4 Results  

---

## Project 1 

### 1.1 Implementation

#### 1.1.1 Rohrs' Counterexample Simulation

We first implemented the original system of Rohrs' counterexample and simulated the conditions specified. The block diagram includes the reference model, the main plant, the adpatation block, and the controller — each described individually.

**Block Diagram:**  
![Figure 1 – Overall Rohrs Counterexample Diagram](figures/figure1.png)

**Reference Model:**  
![Figure 2 – Reference Model Block](figures/figure2.png)

**System Model:**  
![Figure 3 – Plant Model Block](figures/figure3.png)

**adpatation Block:**  
![Figure 4 – Adaptation Block Diagram](figures/figure4.png)

**Controller Block:**  
![Figure 5 – Controller Block](figures/figure5.png)

With the full system diagram in place, we tested performance under different conditions; results are detailed below.

---

#### 1.1.2 Dead‑Zone Method

Similar system structure, but the adpatation block incorporates dead‑zone logic. After signal normalization, the dead‑zone is applied as shown:

![Figure 6 – Adaptation Block with Dead‑Zone](figures/figure6.png)

---

#### 1.1.3 σ‑Modification Method

In this variant, the adpatation block includes σ‑Modification: an adaptation decay term is introduced governed by σ, and the adaptation law is modified accordingly:

![Figure 7 – Adaptation Block with σ‑Modification](figures/figure7.png)

---

#### 1.1.4 Control‑Parameter Bounding

We restricted adaptation parameters within limits:  
- \( K_r \in [0, 0.5] \)  
- \( K_y \in [-3, 0] \)

The adpatation block enforces these bounds:

![Figure 8 – Bounded Parameter adpatation Block](figures/figure8.png)

---

#### 1.1.5 Effect of PE Input Signal

The same system structure is used with input noise added to ensure persistent excitation (PE):

![Figure 9 – PE Input Signal Diagram](figures/figure9.png)

---

### 1.2 Results

#### 1.2.1 Rohrs' Counterexample Results

- **Square wave input, without noise**: response stable and acceptable.  
   <p align="center">
    <img src="figures/figure10a.png" width="70%" />
    <img src="figures/figure10b.png" width="70%" />
  </p>  
  *Figure 10: Reference tracking, control signal, and parameters.*
  
- **Square wave input, with output noise**: still stable.  
   <p align="center">
    <img src="figures/figure11a.png" width="70%" />
    <img src="figures/figure11b.png" width="70%" />
  </p>  
  *Figure 11: Reference tracking, control signal, and parameters.*

- **Long-time step input, no noise**: stable response.  
   <p align="center">
    <img src="figures/figure12a.png" width="70%" />
    <img src="figures/figure12b.png" width="70%" />
  </p>  
  *Figure 12: Reference tracking, control signal, and parameters.*
  
- **Long-time step input, with noise**: instability due to parameter drift observed.  
   <p align="center">
    <img src="figures/figure13a.png" width="70%" />
    <img src="figures/figure13b.png" width="70%" />
  </p>  
  *Figure 13: Reference tracking, control signal, and parameters.*
- **Sinusoidal input at 8 rad/s**: system exhibits parameter explosion as expected.  
   <p align="center">
    <img src="figures/figure14a.png" width="70%" />
    <img src="figures/figure14b.png" width="70%" />
  </p>  
  *Figure 14: Reference tracking, control signal, and parameters.*
- **Sinusoidal input at 16.1 rad/s**: system becomes unstable.  
   <p align="center">
    <img src="figures/figure15a.png" width="70%" />
    <img src="figures/figure15b.png" width="70%" />
  </p>  
  *Figure 15: Reference tracking, control signal, and parameters.*
---

#### 1.2.2 Dead‑Zone Results

- Square wave response stable and acceptable.  
  ![Figure 16](figures/figure16.png)

- Square wave with noise remains stable.  
  ![Figure 17](figures/figure17.png)

- Sinusoid at 16.1 rad/s: stable but with phase/gain degradation — a trade‑off.  
  ![Figure 18](figures/figure18.png)

- Robust against output noise.  
  ![Figure 19](figures/figure19.png)

---

#### 1.2.3 σ‑Modification Results

- At 16.1 rad/s sinusoid, system remains stable but with reduced performance—phase/gain error.  
  ![Figure 20](figures/figure20.png)

---

#### 1.2.4 Control‑Parameter Bounding Results

- Response to 16.1 rad/s sinusoid is stable.  
  ![Figure 21](figures/figure21.png)

- Among all methods, square wave performance is best here. Bounding limits prevent over-aggressive adaptation.  
  ![Figure 22](figures/figure22.png)

---

#### 1.2.5 Effect of PE Signal Results

- PE input prevents instability, but response remains suboptimal, and parameter drift ("explosion") may still occur.  
  ![Figure 23](figures/figure23.png)

---
## References

This project is based on the following references:

- Rohrs, C., et al. "Robustness of continuous-time adaptive control algorithms in the presence of unmodeled dynamics." *IEEE Transactions on Automatic Control*, vol. 30, no. 9, 2003, pp. 881-889.

- Åström, K. Johan. "Adaptive feedback control." *Proceedings of the IEEE*, vol. 75, no. 2, 1987, pp. 185-217.

- Daniel Liberzon, *Switching in Systems and Control*, vol. 190, Springer, 2003.

---
## Project 2 

### 2.1 Problem Definition
A nonlinear RC circuit where the capacitance depends on voltage is considered. The system is linearized at 9 operating points between 10 V and 12 V in 0.25 V increments. For each linearized model, a PID controller is designed to ensure adequate closed-loop performance around that specific operating point. During operation, switching logic selects the appropriate controller based on model error.

---


### 2.2 Simulation Setup

**Overall Simulink architecture:**  
![Figure 25 – Full System Block Diagram](figures/figure25.png)

**Linearized model bank:**  
![Figure 26 – Model Bank](figures/figure26.png)

**Switching Logic Block Diagram:**  
![Figure 27 – Switching Logic Overview](figures/figure27.png)  
![Figure 28 – Controller Selection Logic](figures/figure28.png)

**Controller Bank:**  
![Figure 29 – Switching Controller Bank with Dwell Time](figures/figure29.png)

**Controlled Plant Block:**  
![Figure 30 – Controlled System Block](figures/figure30.png)

---

### 2.3 PID Coefficient Tuning

Using MATLAB’s PID Tuner, coefficients were obtained for each linearized operating point:

| PID Set | Kp      | Ki       | Kd        |
|---------|---------|----------|-----------|
| PID 1   | 35.6203 | 442.5115 | 0.0333428 |
| PID 2   | 35.6203 | 431.5869 | 0.0341868 |
| PID 3   | 35.6203 | 420.9384 | 0.0350516 |
| PID 4   | 35.6203 | 410.6729 | 0.0359376 |
| PID 5   | 35.6203 | 400.8988 | 0.0368455 |
| PID 6   | 35.6203 | 391.7145 | 0.0377757 |
| PID 7   | 35.6203 | 383.2078 | 0.0387288 |
| PID 8   | 35.6203 | 375.4557 | 0.0397053 |
| PID 9   | 35.6203 | 362.7143 | 0.0406782 |

---

### 2.4 Results

The system demonstrates effective control under various input types and noise conditions.

**MMPID without noise:**  
![Figure 31](figures/figure31.png)

**MMPID with noise:**  
![Figure 32](figures/figure32.png)

**Square wave, no noise:**  
![Figure 33](figures/figure33.png)

**Square wave, with noise:**  
![Figure 34](figures/figure34.png)

**Step input, no noise:**  
![Figure 35](figures/figure35.png)

**Step input, with noise:**  
![Figure 36](figures/figure36.png)

--
