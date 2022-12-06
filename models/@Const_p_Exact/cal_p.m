function [ obj ] = cal_p(obj)
%% preperation

load physconst
T_C = obj.pr.T_C.val ;
T_K = Tc2k(T_C) ;
epss = epssF(T_C) ;
R = obj.pr.R.val ;
n_s_mM = obj.pr.n.val ;
n_H_mM = 10^(-obj.pr.pH.val+3) ;
n_tot_mM = n_s_mM+n_H_mM ;
n_tot = n_tot_mM*Na ;
obj.kappa = sqrt(2*e^2*n_tot/(epss*k_B*T_K)) ;

%% manual

if ~isempty(obj.fp.kScale.mval)
    mKappa = obj.kappa*obj.fp.kScale.mval ;
    obj.p.cd.mval = epss*obj.kappa;
    obj.p.ld.mval = mKappa^-1*1e9 ;

    if ~isempty(obj.fp.p.mval)
        obj.p.ci.mval = obj.p.cd.mval*(obj.fp.p.mval^-1 - 1) ;
    end

    if ~isempty(obj.fp.psiInf.mval)
        obj.p.psiInf.mval = obj.fp.psiInf.mval*1e3 ;
        obj.p.sigma.mval = sqrt(8*epss*k_B*T_K*n_tot)*sinh(e*obj.fp.psiInf.mval/(2*k_B*T_K))/e*1e-15 ;
    end
end
%% auto
if ~isempty(obj.fp.kScale.aval)
    aKappa = obj.kappa*obj.fp.kScale.aval ;
    aKappa_err = obj.kappa*obj.fp.kScale.aval_error ;
    
    obj.p.cd.aval = epss*obj.kappa ;
    obj.p.cd.aval_error = 0 ;
    
    obj.p.ld.aval = aKappa^-1*1e9 ;
    obj.p.ld.aval_error = obj.p.ld.aval*(aKappa_err/aKappa) ;
    
    if ~isempty(obj.fp.p.aval)
        obj.p.ci.aval = obj.p.cd.aval*(obj.fp.p.aval^-1 - 1) ;
        obj.p.ci.aval_error = obj.p.ci.aval*(obj.fp.p.aval_error/obj.fp.p.aval) ;
    end
    
    if ~isempty(obj.fp.psiInf.aval)
        obj.p.psiInf.aval = obj.fp.psiInf.aval*1e3 ;
        obj.p.psiInf.aval_error = obj.fp.psiInf.aval_error*1e3 ;
        
        obj.p.sigma.aval = sqrt(8*epss*k_B*T_K*n_tot)*sinh(e*obj.fp.psiInf.aval/(2*k_B*T_K))/e*1e-15;
        obj.p.sigma.aval_error = sqrt(8*epss*k_B*T_K*n_tot)*cosh(e*obj.fp.psiInf.aval/(2*k_B*T_K))*(e*obj.fp.psiInf.aval_error/(2*k_B*T_K))/e*1e-15;
    end
end
end