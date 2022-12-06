function [ ld ] = cal_ld( n_mM, T_C )
%CAL_LD Summary of this function goes here
%   Detailed explanation goes here
load physconst
eps_r = cal_eps_r(T_C) ;
T_K = Tc2k(T_C) ;
n = n_mM*Na ;
ld = sqrt(k_B*T_K*eps_0*eps_r/(2*e^2*n))*1e9 ;

end

