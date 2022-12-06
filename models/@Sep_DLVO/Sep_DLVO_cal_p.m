function [ obj ] = DLVO_cal_p( obj )
%CAL_DLVO_P Summary of this function goes here
%   Detailed explanation goes here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% preperation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load physconst
T_C = obj.pr.T_C.val ;
T_K = Tc2k(T_C) ;
eps_r = cal_eps_r(T_C) ;
R = obj.pr.R.val ;
n_s_mM = obj.pr.n.val ;
n_H_mM = 10^(-obj.pr.pH.val+3) ;
n_tot_mM = n_s_mM+n_H_mM ;
n_tot = n_tot_mM*Na ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% manual
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
try
    a = obj.fp.a.mval*1e-9 ;
    ld = obj.fp.ld.mval*1e-9 ;
    C = obj.fp.C.mval ;

    atanh_arg = sqrt(a*ld/(R*pi*eps_0*eps_r))*(e/(8*k_B*T_K)) ;
    psi_V = 4*k_B*T_K/e*atanh(atanh_arg) ; %Equation 4.52 Israelschvili book's
    sigma_C = sqrt(8*eps_0*eps_r*k_B*T_K*n_tot)*sinh(e*psi_V/(2*k_B*T_K)) ; %Graham equation for monovalents ions Eq. 14.30 Isrealschbili book's

    obj.p.psi.mval = psi_V*1000 ;
    obj.p.sigma.mval = (sigma_C/e)*1e-18 ;
    obj.p.A.mval = C*1e-18/(R*1e9)*6 ;
catch
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% auto
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
try
    a = obj.fp.a.aval*1e-9 ;
    ld = obj.fp.ld.aval*1e-9 ;
    C = obj.fp.C.aval ;

    atanh_arg = sqrt(a*ld/(R*pi*eps_0*eps_r))*(e/(8*k_B*T_K)) ;
    psi_V = 4*k_B*T_K/e*atanh(atanh_arg) ; %Equation 4.52 Israelschvili book's
    sigma_C = sqrt(8*eps_0*eps_r*k_B*T_K*n_tot)*sinh(e*psi_V/(2*k_B*T_K)) ; %Graham equation for monovalents ions Eq. 14.30 Isrealschbili book's

    obj.p.psi.aval = psi_V*1000 ;
    obj.p.sigma.aval = (sigma_C/e)*1e-18 ;
    obj.p.A.aval = C*1e-18/(R*1e9)*6 ;
catch
end
