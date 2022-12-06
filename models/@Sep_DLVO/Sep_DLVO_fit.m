function obj = Sep_DLVO_fit(obj, varargin)
handles = varargin{1} ;
handles = handles{1} ;

grp_idx = obj.group_idx ;

min_VdW_val = min([obj.fbnd.VdW_1.val obj.fbnd.VdW_2.val]) ;
max_VdW_val = max([obj.fbnd.VdW_1.val obj.fbnd.VdW_2.val]) ;

min_exp_val = min([obj.fbnd.Exp_1.val obj.fbnd.Exp_2.val]) ;
max_exp_val = max([obj.fbnd.Exp_1.val obj.fbnd.Exp_2.val]) ;

x = handles.groups(grp_idx).sep ;
y = handles.groups(grp_idx).force +  handles.groups(grp_idx).offset ;

[~, min_VdW_idx] = min(abs(x - min_VdW_val)) ;
[~, max_VdW_idx] = min(abs(x - max_VdW_val)) ;

[~, min_exp_idx] = min(abs(x - min_exp_val)) ;
[~, max_exp_idx] = min(abs(x - max_exp_val)) ;

VdW_idx_srtd = sort([min_VdW_idx max_VdW_idx]) ;
exp_idx_srtd = sort([min_exp_idx max_exp_idx]) ;

x_VdW = x(VdW_idx_srtd(1):VdW_idx_srtd(2)) ;
y_VdW = y(VdW_idx_srtd(1):VdW_idx_srtd(2)) ;

x_exp = x(exp_idx_srtd(1):exp_idx_srtd(2)) ;
y_exp = y(exp_idx_srtd(1):exp_idx_srtd(2)) ;


fields_VdW = {'C', 'offset'} ;
fields_exp = {'a', 'ld',} ;

for i = 1:length(fields_VdW)
    fp_obj = obj.fp.(fields_VdW{i}) ;
    
    if isempty(fp_obj.aval_guess)
        guess(i) = NaN ;
    else
        guess(i) = fp_obj.aval_guess ;
    end
    
    if isempty(fp_obj.aval_guess)
        lower(i) = NaN ;
    else
        lower(i) = fp_obj.aval_min ;
    end
    
    if isempty(fp_obj.aval_guess)
        upper(i) = NaN ;
    else
        upper(i) = fp_obj.aval_max ;
    end
end
    
f_VdW = fit(x_VdW, log(abs(y_VdW)), 'log(abs(-c/x^2+d))', 'StartPoint', guess ,'Lower', lower, 'Upper', upper) ;
    
for i = 1:length(fields_exp)
    fp_obj = obj.fp.(fields_exp{i}) ;

    if isempty(fp_obj.aval_guess)
        guess(i) = NaN ;
    else
        guess(i) = fp_obj.aval_guess ;
    end

    if isempty(fp_obj.aval_guess)
        lower(i) = NaN ;
    else
        lower(i) = fp_obj.aval_min ;
    end

    if isempty(fp_obj.aval_guess)
        upper(i) = NaN ;
    else
        upper(i) = fp_obj.aval_max ;
    end
end

f_exp = fit(x_exp, y_exp +f_VdW.c./x_exp.^2 + f_VdW.d, 'a*exp(-x/b)', 'StartPoint', guess ,'Lower', lower, 'Upper', upper) ;

obj.fit_obj.VdW = f_VdW ;
obj.fit_obj.exp = f_exp ;

obj.fp.a.aval = f_exp.a ;
obj.fp.ld.aval = f_exp.b ;
obj.fp.C.aval = f_VdW.c ;
obj.fp.offset.aval = f_VdW.d ;

errors_VdW = confint(f_VdW, 0.95) ;
errors_VdW = errors_VdW(2,:) ;

errors_exp = confint(f_exp, 0.95) ;
errors_exp = errors_exp(2,:) ;

errors = [errors_exp errors_VdW] ;

obj.fp.a.aval_error = errors(1) - f_exp.a ;
obj.fp.ld.aval_error = errors(2) - f_exp.b ;
obj.fp.C.aval_error = errors(3) - f_VdW.c ;
obj.fp.offset.aval_error = errors(4) - f_VdW.d;

obj = obj.cal_p() ;