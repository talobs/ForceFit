function obj = fit(obj, varargin)
handles = varargin{1} ;
%handles = handles{1} ;
load('physconst.mat', 'Na') ;

grp_idx = obj.group_idx ;

min_bnd_val = obj.fbnd.min.val ;
max_bnd_val = obj.fbnd.max.val ;

x = handles.groups(grp_idx).sep ;
y = handles.groups(grp_idx).force +  handles.groups(grp_idx).offset ;

[~, min_bnd_idx] = min(abs(x - min_bnd_val)) ;
[~, max_bnd_idx] = min(abs(x - max_bnd_val)) ;

fbnds = sort([min_bnd_idx max_bnd_idx]) ;
x = x(fbnds(1):fbnds(2)) ;
y = y(fbnds(1):fbnds(2)) ;

fields = fieldnames(obj.fp) ;
for i = 1:length(fields)
    fp_obj = obj.fp.(fields{i}) ;
    
    if isempty(fp_obj.aval_guess)
        c0(i) = NaN ;
    else
        c0(i) = fp_obj.aval_guess ;
    end
    
    if isempty(fp_obj.aval_guess)
        clb(i) = NaN ;
    else
        clb(i) = fp_obj.aval_min ;
    end
    
    if isempty(fp_obj.aval_guess)
        cub(i) = NaN ;
    else
        cub(i) = fp_obj.aval_max ;
    end
end

n_s_mM = obj.pr.n.val ;
n_H_mM = 10^(-obj.pr.pH.val+3) ;
n_tot_mM = n_s_mM+n_H_mM ;
n_tot = n_tot_mM*Na ;

constFit.R = obj.pr.R.val ;
constFit.T_K = obj.pr.T_C.val + 273.15 ;
constFit.kappa = obj.kappa*1e-9 ;
constFit.n = n_tot ;

function y = fitFun(c, L)
    y = Const_p_Exact.force(handles.solsDB, L, c, constFit) ;
end

optns = optimoptions(@lsqcurvefit, 'Display', 'final', 'FunctionTolerance', 1e-8, 'StepTolerance', 1e-8) ;
[cFit,resnorm,residual,exitflag,output,lambda,J] = lsqcurvefit(@fitFun, c0, x, y, clb, cub, optns) ;

cFitConfInt = nlparci(cFit,residual,'jacobian',J) ;

obj.fit_obj = [] ;
obj.fp.psiInf.aval = cFit(1) ;
obj.fp.p.aval = cFit(2) ;
obj.fp.A.aval = cFit(3) ;
obj.fp.d.aval = cFit(4) ;
obj.fp.offset.aval = cFit(5) ;
obj.fp.kScale.aval = cFit(6) ;

obj.fp.psiInf.aval_error = cFitConfInt(1, 2) - cFit(1) ;
obj.fp.p.aval_error = cFitConfInt(2, 2) - cFit(2) ;
obj.fp.A.aval_error = cFitConfInt(3, 2) - cFit(3) ;
obj.fp.d.aval_error = cFitConfInt(4, 2) - cFit(4) ;
obj.fp.offset.aval_error = cFitConfInt(5, 2) - cFit(5) ;
obj.fp.kScale.aval_error = cFitConfInt(6, 2) - cFit(6) ;


obj = obj.cal_p() ;
  
end