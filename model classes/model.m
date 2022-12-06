classdef model
    %MODEL Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        name % model's name
        group_idx % group's index
        p % parameters struct
        fp % fitting parameters struct
        pr
        fbnd
        fit_obj % matlab fit object
        cal_fun
        fit_fun
        cal_p_fun
        fit_curves ; % struct with fit curves information: name, line
        active  ;
    end
    
    methods
        function obj = model()
            obj.active.m = 0 ;
            obj.active.a = 0 ;
        end
        
        function y = cal(obj, x, moa, handles)
            y = obj.cal_fun(obj, x, moa, handles) ;
        end
        
        function obj = fit(obj, varargin)
            obj = obj.fit_fun(obj, varargin) ;
        end
        
        function obj = cal_p(obj)
            obj = obj.cal_p_fun(obj) ;
        end
        
        function obj = copy_fp_a2m(obj)
            fields = fieldnames(obj.fp) ;
            for i = 1:length(fields)
                obj.fp.(fields{i}).mval = obj.fp.(fields{i}).aval ;
                obj.cal_p() ;
            end
        end
        
        function obj = copy_fp_m2a_guess(obj)
            fields = fieldnames(obj.fp) ;
            for i = 1:length(fields)
                obj.fp.(fields{i}).aval_guess = obj.fp.(fields{i}).mval ;
                obj.cal_p() ;
            end
        end
    end
    
end

