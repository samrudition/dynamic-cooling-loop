% --- Project 1: Dynamic Liquid Cooling Loop Parameters ---
clear; clc;

% 1. Fluid Properties (Water-Glycol Mix)
rho = 1060;       % Density (kg/m^3)
Cp  = 3500;       % Specific Heat (J/kg*K)
Vol = 0.005;      % Volume of loop (5 Liters = 0.005 m^3)
Mass = rho * Vol; % Total Thermal Mass (Lienhard Ch 5)

% 2. Heat Exchanger Properties (Radiator)
% U = Overall Heat Transfer Coeff, A = Surface Area
% A good car radiator might have UA around 50-100 W/K per unit flow
UA_rated = 150;   % W/K (Thermal Conductance)

% 3. Operating Conditions
T_ambient = 25;   % Ambient Air Temp (deg C)
T_init    = 25;   % Initial Fluid Temp (deg C)
Flow_Rate = 0.2;  % Nominal Mass Flow Rate (kg/s)
