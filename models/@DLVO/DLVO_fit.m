function obj = DLVO_fit(obj, varargin)
handles = varargin{1} ;
handles = handles{1} ;

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
    
    f = fit(x, y, 'a*exp(-x/b)-c/x^2+d', 'StartPoint', guess ,'Lower', lower, 'Upper', upper) ;
    
    obj.fit_obj = f ;
    obj.fp.a.aval = f.a ;
    obj.fp.ld.aval = f.b ;
    obj.fp.C.aval = f.c ;
    obj.fp.offset.aval = f.d ;
    
    errors = confint(f, 0.95) ;
    errors = errors(2,:) ;
    
    obj.fp.a.aval_error = errors(1) - f.a ;
    obj.fp.ld.aval_error = errors(2) - f.b ;
    obj.fp.C.aval_error = errors(3) - f.c ;
    obj.fp.offset.aval_error = errors(4) - f.d;
    
    obj = obj.cal_p() ;