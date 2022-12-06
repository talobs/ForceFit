classdef DLVO_expAtr < model
    %DLVO_EXPATR Summary of this class goes here
    %   Detailed explanation goes here
    
%DLVO Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
    methods
        function obj = DLVO_expAtr(handles, group_idx)
            obj.name = 'DLVO+expAtr' ;
            obj.group_idx = group_idx ;
            obj.cal_fun = @DLVO_expAtr_fun ;
            obj.fit_fun = @DLVO_expAtr_fit ;
            obj.cal_p_fun = @DLVO_cal_p ;
            
            obj.p = struct('sigma', parameter('sigma', 'e*nm^-2'),...
                           'psi', parameter('psi', 'mV'),...
                           'A', parameter('Hammaker Const.', 'J')) ;

            obj.fp = struct('a', fparameter('Exp. Prefactor', 'nN'),...
                            'ld', fparameter('Debye Length', 'nm'),...
                            'C', fparameter('C', 'N*nm^2'),...
                            'offset', fparameter('offset', 'nN'),...
                            'b', fparameter('Atr. Exp. Prefactor', 'nN'),...
                            'lAtr', fparameter('Atr. Length', 'nm')) ;
                        
            obj.fp.a.aval_guess = 10 ;
            obj.fp.a.aval_min = 0 ;
            obj.fp.a.aval_max = 20 ;
            
            obj.fp.offset.mval = 0 ;
            obj.fp.offset.aval = 0 ;
            obj.fp.offset.aval_guess = 0 ;
            obj.fp.offset.aval_min = -0.1 ;
            obj.fp.offset.aval_max = 0.1 ;
            
            obj.fp.C.mval = 1.1 ;
            obj.fp.C.aval_guess = 1.1 ;
            obj.fp.C.aval_min = obj.fp.C.aval_guess ;
            obj.fp.C.aval_max = obj.fp.C.aval_guess ;
            
            obj.fp.b.aval = 0 ;
            obj.fp.b.aval_guess = 0 ;
            obj.fp.b.aval_min = 0 ;
            obj.fp.b.aval_max = 0.1 ;
            
            obj.fp.lAtr.aval = 10 ;
            obj.fp.lAtr.aval_guess = 10 ;
            obj.fp.lAtr.aval_min = 2 ;
            obj.fp.lAtr.aval_max = 30 ;
            
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
            
            obj.fbnd = struct('min', fitbnd('min', 2), 'mid', fitbnd('mid', 2), 'max', fitbnd('max', 50)) ;

        end
    end
end


