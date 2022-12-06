classdef Sep_DLVO < model
    %DLVO Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
    methods
        function obj = Sep_DLVO(handles, group_idx)
            obj.name = 'DLVO' ;
            obj.group_idx = group_idx ;
            obj.cal_fun = @Sep_DLVO_fun ;
            obj.fit_fun = @Sep_DLVO_fit ;
            obj.cal_p_fun = @DLVO_cal_p ;
            
            obj.fit_curves(1).name = 'Total' ;
            obj.fit_curves(1).line = '-' ;
            obj.fit_curves(1).disp = 1 ;
            
            obj.fit_curves(2).name = 'Exponent' ;
            obj.fit_curves(2).line = '--' ;
            obj.fit_curves(2).disp = 1 ;
            
            obj.fit_curves(3).name = 'VdW' ;
            obj.fit_curves(3).line = '-.' ;
            obj.fit_curves(3).disp = 1 ;
            
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
            obj.fp.C.aval_min = 1 ;
            obj.fp.C.aval_max = 3 ;

            
            
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
                obj.fp.ld.aval_min = obj.fp.ld.aval_guess*0.8 ;
                obj.fp.ld.aval_max = obj.fp.ld.aval_guess*1.2 ;
            end
            
            obj.fbnd = struct('Exp_1', fitbnd('Exp 1', 2),...
                'Exp_2', fitbnd('Exp 2', 7),...
                'VdW_1', fitbnd('VdW 1',7),...
                'VdW_2', fitbnd('VdW 2', 20')) ;
            
            obj.fbnd.Exp_1.color = [1 0 1] ;
            obj.fbnd.Exp_2.color = [1 0 1] ;
            obj.fbnd.VdW_1.color = [0 1 0] ;
            obj.fbnd.VdW_2.color = [0 1 0] ;
        end
    end
end

