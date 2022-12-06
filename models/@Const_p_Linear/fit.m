function obj = fit(obj, varargin)
handles = varargin{1} ;

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

constFit.R = obj.pr.R.val ;
constFit.epss = epssF(obj.pr.T_C.val) ;
constFit.kappa = obj.kappa*1e-9 ;

function y = fitFun(c, L)
    y = const_p_linear_force(L, c, constFit) ;
end

optns = optimoptions(@lsqcurvefit, 'Display', 'off') ;
[cFit, resnorm] = lsqcurvefit(@fitFun, c0, x, y, clb, cub, optns) ;
    
    obj.fit_obj = [] ;
    obj.fp.psiInf.aval = cFit(1) ;
    obj.fp.p.aval = cFit(2) ;
    obj.fp.A.aval = cFit(3) ;
    obj.fp.d.aval = cFit(4) ;
    obj.fp.offset.aval = cFit(5) ;
    obj.fp.kScale.aval = cFit(6) ;
    
    obj.fp.psiInf.aval_error = 0 ;
    obj.fp.p.aval_error = 0 ;
    obj.fp.A.aval_error = 0 ;
    obj.fp.d.aval_error = 0 ;
    obj.fp.offset.aval_error = 0 ;
    
    %{
    errors = confint(f, 0.95) ;
    errors = errors(2,:) ;
    
    obj.fp.a.aval_error = errors(1) - f.a ;
    obj.fp.ld.aval_error = errors(2) - f.b ;
    obj.fp.C.aval_error = errors(3) - f.c ;
    obj.fp.offset.aval_error = errors(4) - f.d;
      %}
    obj = obj.cal_p() ;
  
end