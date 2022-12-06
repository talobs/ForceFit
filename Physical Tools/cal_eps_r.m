function [ eps_r ] = cal_eps_r( T_C )
%CAL_EPS_R Summary of this function goes here
%   Detailed explanation goes here

eps_r = 87.740 - 0.4008*T_C + 9.398e-4*T_C^2 - 1.410e-6*T_C^3 ; % Malmberg, C. G., and A. A. Maryott. "Dielectric constant of water from 00 to 1000 C." Journal of research of the National Bureau of Standards 56.1 (1956): 1-8.

end

