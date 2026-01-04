# Dynamic Liquid Cooling Loop Simulation
This project models a dynamic thermal control system for electronics cooling using MATLAB and Simulink that can be used in data centers, electric vehicles, and industrial systems. I implemented the lumped-capacity energy balance and effectiveness-NTU heat exchanger model to predict cooling performance under real-world variable loads, referencing the Lienhard & Lienhard 6th Edition Heat Transfer textbook. 

# Simulink Model
<img width="975" height="249" alt="image" src="https://github.com/user-attachments/assets/3771d496-e2fa-4998-bded-1152f6321b8c" />

# Methodology
**Energy balance (lumped capacity)**: To calculate this, I used the lumped‑capacitance energy balance on a control volume of fluid, which is **M·Cp(dT_fluid/dt)=(Q_in - Q_out)**. This helped to model the coolant as a single thermal mass with time-dependent temperature governed by energy balance.
- M= total mass of the fluid in the control volume (kg)
- Cp= specific heat at constant pressure (J·kg⁻¹·K⁻¹)
- T_fluid= fluid temperature inside the lump (°C or K)
- t= time (s)
- Q_in - Q_out= rates of heat transfer into and out of the lump (W)
  
**Effectiveness-NTU Heat Exchanger Design**: I calculated the radiator heat rejection using effectiveness-NTU methodology, eliminating the need for outlet temperature iteration. The NTU formula used was **NTU= U.A/Cmin**. On this project, however, the liquid side is the limiting stream, so Cmin=M.Cp. Afterwards, I calculated the Effectiveness of the exchanger and the heat transfer rate. Effectiveness= 1-e^(-NTU). Q_out= Effectiveness.M.Cp(T_fluid-T_ambient)
- U – overall heat‑transfer coefficient (W·m⁻²·K⁻¹)
- A – heat‑transfer area (m²)
- M= total mass of the fluid in the control volume (kg)
- Cp= specific heat at constant pressure (J·kg⁻¹·K⁻¹)

I built the MATLAB/Simulink model integrating pump dynamics, load transients, and feedback control logic. After which, I conducted a parametric study on flow rate, ambient temperature, and heat load to identify optimization opportunities, working with 3 scenarios (base model, pump failure and efficiency improvements).

# Files
- **setup_cooling_loop.m**: This is the MATLAB initialization script defining system parameters
- **CoolingLoopModel.slx**: This is the Simulink model implementing the differential equations

# How to Run
- Open MATLAB and navigate to this folder
- Run: `setup_cooling_loop`
- Open `CoolingLoopModel.slx` in Simulink
- Set Stop Time to 3600 s
- Click Run and open the Scope to view T_fluid vs. time
- Test the other 2 scenarios as described in the Full Technical Report.

# Key Findings
- The cooling loop reached steady-state within 8–12 minutes under 1 kW load; system time constant was ~4–5 minutes, validating lumped-capacity assumptions. Moreover, the liquid cooling reduced peak temperature by 35–42% compared to air cooling, proving criticality for high-power systems.
<img width="975" height="350" alt="image" src="https://github.com/user-attachments/assets/4299cc96-dc2d-4e65-ad8d-e76ffa6b2d8c" />

- When testing a pump failure scenario, the flow was reduced from 0.2 to 0.01 kg/s, which caused uncontrolled temperature rise, exceeding safe thresholds in <6 minutes, highlighting redundancy needs. However, when efficiency improvements by doubling radiator effectiveness, this reduced steady-state temp by about 8°C but increased pump power requirements (P ∝ ṁ³); optimal sizing will require cost-benefit analysis.
- Observed rapid load spikes (0 → 1500 W in 5 sec), which caused only 4°C peak overshoot before settling, proving liquid loops handle transients better than passive systems.
- Applicable to data centers, EVs, and industrial thermal management

## References
- Lienhard, J.H. & Lienhard, J.H. IV. *A Heat Transfer Textbook*. 6th Edition (2024).
