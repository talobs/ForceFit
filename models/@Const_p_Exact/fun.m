function y = fun(obj, x, moa, varargin)
handles = varargin{1} ;
load('physconst.mat', 'Na') ;

if strcmp(moa, 'm')
    psiInf = obj.fp.psiInf.mval ;
    p = obj.fp.p.mval ;
    A = obj.fp.A.mval ;
    d = obj.fp.d.mval ;
    offset = obj.fp.offset.mval ;
    kScale = obj.fp.kScale.mval ;
elseif strcmp(moa, 'a')
    psiInf = obj.fp.psiInf.aval ;
    p = obj.fp.p.aval ;
    A = obj.fp.A.aval ;
    d = obj.fp.d.aval ;
    offset = obj.fp.offset.aval ;
    kScale = obj.fp.kScale.aval ;
end

n_s_mM = obj.pr.n.val ;
n_H_mM = 10^(-obj.pr.pH.val+3) ;
n_tot_mM = n_s_mM+n_H_mM ;
n_tot = n_tot_mM*Na ;

constFit.R = obj.pr.R.val ;
constFit.T_K = obj.pr.T_C.val + 273.15;
constFit.kappa = obj.kappa*1e-9 ; %nm^-1
constFit.n = n_tot ;

c = [psiInf p A d offset kScale] ;


try
     y{1} = Const_p_Exact.force(handles.solsDB, x, c, constFit) ;
catch
     y{1} = [] ;
end
end