classdef prop
    %PROP Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        name % property's name
        val % value
        units % a string contaning the parameter's units
        visible = true
    end
    
    methods
        function obj = prop(name, val, units)
            obj.name = name ;
            obj.val = val ;
            obj.units = units ;
        end
        
        function obj = set.units(obj, units)
            if ischar(units)
                obj.units = units ;
            else
                error('Units value most be a string') ;
            end
        end
    end
    
end

