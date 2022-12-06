classdef fparameter
    %MODEL_FITTING_PARAMETER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        name % parameter's name
        is_manual = true % is it a manual parameter
        is_auto = true % is it an auto parameter
        mval % manual parameters's value
        aval % auto parameters's value
        aval_error
        aval_guess
        aval_min
        aval_max
        units
        visible = true
    end
    
    methods
        function obj = fparameter(name, units)
            obj.name = name ;
            obj.units = units ;
        end
    end
    
end

