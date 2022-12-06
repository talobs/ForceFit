classdef fitbnd
    %FITBND Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        name % boundary name
        val % boundary value
        color % line color
    end
    
    methods
        function obj = fitbnd(name, val)
            obj.name = name ;
            obj.val = val ;
        end
    end
    
end

