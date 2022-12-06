classdef parameter
    %MODEL_PARAMETER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        name % parameter's name
        is_manual = true % is it a manual parameter
        is_auto = true % is it an auto parameter
        mval % manual parameters's value
        aval % auto parameters's value
        aval_error
        units % a string contaning the parameter's units
        cal_fun  % a handler to function which calculates this parameter from the fiting parameters
        user_change_fun % a handler to a function the executes when the user change this parameter
        visible = true ;
    end
    
    methods
        function obj = parameter(name, units)
            obj.name = name ;
            obj.units = units ;
        end
        
        function obj = set.units(obj, units)
            if ischar(units)
                obj.units = units ;
            else
                error('Units value most be a string') ;
            end
        end
        
        function cal(obj)
            if ~isempty(obj.cal_fun)
                obj.cal_fun(obj)
            end
        end
    end
    
end

