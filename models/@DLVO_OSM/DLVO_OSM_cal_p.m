function [ obj ] = DLVO_cal_p( obj )
%CAL_DLVO_P Summary of this function goes here
%   Detailed explanation goes here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% preperation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load physconst
T_C = obj.pr.T_C.val ;
T_K = Tc2k(T_C) ;
eps_r = cal_eps_r_OSM(T_C, obj.pr.osm.val, obj.pr.osm_n.val ) ;
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
    d_a = obj.fp.a.aval_error*1e-9 ;
    ld = obj.fp.ld.aval*1e-9 ;
    d_ld = obj.fp.ld.aval_error*1e-9 ;
    C = obj.fp.C.aval ;

    atanh_arg = sqrt(a*ld/(R*pi*eps_0*eps_r))*(e/(8*k_B*T_K)) ;
    atanh_arg_error = 0.5*atanh_arg*sqrt((d_a/a)^2 + (d_ld/ld)^2) ;
    psi_V = 4*k_B*T_K/e*atanh(atanh_arg) ; %Equation 4.52 Israelschvili book's
    psi_V_error = 4*k_B*T_K/e*(1-atanh_arg^2)^-1*atanh_arg_error ;
    sigma_C = sqrt(8*eps_0*eps_r*k_B*T_K*n_tot)*sinh(e*psi_V/(2*k_B*T_K)) ; %Graham equation for monovalents ions Eq. 14.30 Isrealschbili book's
    sigma_C_error = sqrt(2*e^2*eps_0*eps_r*n_tot/(k_B*T_K))*cosh(e*psi_V/(2*k_B*T_K))*psi_V_error ;

    obj.p.psi.aval = psi_V*1000 ;
    obj.p.psi.aval_error = psi_V_error*1000 ;
    obj.p.sigma.aval = (sigma_C/e)*1e-18 ;
    obj.p.sigma.aval_error = (sigma_C_error/e)*1e-18 ;
    obj.p.A.aval = C*1e-18/(R*1e9)*6 ;
catch
end
