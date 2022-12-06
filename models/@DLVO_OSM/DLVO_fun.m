function y = DLVO_fun(obj, x, moa)

%DLVO_FUN Summary of this function goes here
%   Detailed explanation goes here
if strcmp(moa, 'm')
    a = obj.fp.a.mval ;
    ld = obj.fp.ld.mval ;
    A = obj.fp.C.mval ;
    offset = obj.fp.offset.mval ;
elseif strcmp(moa, 'a')
    a = obj.fp.a.aval ;
    ld = obj.fp.ld.aval ;
    A = obj.fp.C.aval ;
    offset = obj.fp.offset.aval ;
end

try
    y{1} = a*exp(-x/ld) - A./x.^2 + offset;
catch
    y{1} = [] ;
end
end




