classdef DLVO < model
    %DLVO Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
    methods
        function obj = DLVO(handles, group_idx)
            obj.name = 'DLVO' ;
            obj.group_idx = group_idx ;
            obj.cal_fun = @DLVO_fun ;
            obj.fit_fun = @DLVO_fit ;
            obj.cal_p_fun = @DLVO_cal_p ;
            
            obj.p = struct('sigma', parameter('sigma', 'e*nm^-2'),...
                           'psi', parameter('psi', 'mV'),...
                           'A', parameter('Hammaker Const.', 'J')) ;

            obj.fp = struct('a', fparameter('Exp. Prefactor', 'nN'),...
                            'ld', fparameter('Debye Length', 'nm'),...
                            'C', fparameter('C', 'N*nm^2'),...
                            'offset', fparameter('offset', 'nN')) ;
            
            obj.fp.a.aval_guess = 10 ;
            obj.fp.a.aval_min = 0 ;
            obj.fp.a.aval_max = 20 ;
            
            obj.fp.offset.mval = 0 ;
            obj.fp.offset.aval = 0 ;
            obj.fp.offset.aval_guess = 0 ;
            obj.fp.offset.aval_min = -0.1 ;
            obj.fp.offset.aval_max = 0.1 ;
            
            obj.fp.C.mval = 2 ;
            obj.fp.C.aval_guess = 2 ;
            obj.fp.C.aval_min = 1.9 ;
            obj.fp.C.aval_max = 2.1 ;

            
            
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
            
            if ~isempty(obj.pr.n.val) && ~isempty(obj.pr.T_C.val)
                obj.fp.ld.aval_guess = cal_ld(obj.pr.n.val, obj.pr.T_C.val) ;
                obj.fp.ld.aval_min = obj.fp.ld.aval_guess*0.5 ; %cal_ld(obj.pr.n.val*1.1, obj.pr.T_C.val) ;
                obj.fp.ld.aval_max = obj.fp.ld.aval_guess*1.5 ; %cal_ld(obj.pr.n.val*0.9, obj.pr.T_C.val) ;
            end
            
            obj.fbnd = struct('min', fitbnd('min', 2), 'max', fitbnd('max', 20)) ;
            
            if obj.fp.ld.aval_guess > 2
                obj.fbnd.min.val = obj.fp.ld.aval_guess ;
            else
                obj.fbnd.min.val = 2 ;
            end
            
            obj.fbnd.max.val = 30 ;
        %{
            if 10*obj.fp.ld.aval_guess > 30
                obj.fbnd.max.val = 10*obj.fp.ld.aval_guess ;
            else
                obj.fbnd.max.val = 20 ;
            end
        %}  
        end
    end
end

