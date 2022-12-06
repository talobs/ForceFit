classdef Const_p_Linear < model   
    properties
        kappa ;
    end
    
    methods
        function obj = Const_p_Linear(handles, group_idx)
            obj.name = 'Const-p Linear' ;
            obj.group_idx = group_idx ;
            obj.cal_fun = @fun ;
            obj.fit_fun = @fit ;
            obj.cal_p_fun = @cal_p ;
            
            obj.p = struct('psiInf', parameter('Iso. Potential', 'mV'),...
                           'sigma', parameter('sigma', 'me*nm^-2'),...
                           'ld', parameter('Scrn. Length', 'nm'), ...
                           'cd', parameter('Diffuse C.', 'F*m^-2'), ...
                           'ci', parameter('Inner C.', 'F*m^-2')) ;

            obj.fp = struct('psiInf', fparameter('Iso. Potential', 'V'), ...
                            'p', fparameter('Regulation Param.', ''), ...
                            'A', fparameter('Hamaker', 'J*1e-21'), ...
                            'd', fparameter('VdW Shift', 'nm'), ...
                            'offset', fparameter('Offset', 'nN'), ...
                            'kScale', fparameter('Kappa Scale', '')) ;
            
            obj.fp.psiInf.aval_guess = 0.02 ;
            obj.fp.psiInf.aval_min = 0 ;
            obj.fp.psiInf.aval_max = 0.1 ;
            
            obj.fp.p.aval_guess = 0.5 ;
            obj.fp.p.aval_min = 0 ;
            obj.fp.p.aval_max = 1 ;
            
            obj.fp.A.aval_guess = 2 ;
            obj.fp.A.aval_min = 1 ;
            obj.fp.A.aval_max = 6 ;
            
            obj.fp.d.aval_guess = .7 ;
            obj.fp.d.aval_min = .7 ;
            obj.fp.d.aval_max = .7 ;
            
            obj.fp.offset.mval = 0 ;
            obj.fp.offset.aval = 0 ;
            obj.fp.offset.aval_guess = 0 ;
            obj.fp.offset.aval_min = -0.1 ;
            obj.fp.offset.aval_max = 0.1 ;

            obj.fp.kScale.aval_guess = 1 ;
            obj.fp.kScale.aval_min = 0.9 ;
            obj.fp.kScale.aval_max = 1.1 ;
            
            obj.pr = struct('R', prop('R', 2.5e-6, 'm'), ...
                            'T_C', prop('T', 25, 'C'), ...
                            'n', prop('n', 1, 'mM'),...
                            'pH', prop('pH', 5.6, '')) ;
                        
            if isfield(handles.groups(group_idx), 'T_C')
                obj.pr.T_C.val = handles.groups(group_idx).T_C ;
            end
            
            if isfield(handles.groups(group_idx), 'n')
                obj.pr.n.val = handles.groups(group_idx).n ;
            end
            
            if isfield(handles.groups(group_idx), 'pH')
                obj.pr.pH.val = handles.groups(group_idx).pH ;
            end
           
            obj.fbnd = struct('min', fitbnd('min', 2), 'max', fitbnd('max', 20)) ;
            
            obj.fbnd.min.val = 1 ;
            obj.fbnd.max.val = 40 ;
            
            obj = obj.cal_p() ;
        end
    end
end

