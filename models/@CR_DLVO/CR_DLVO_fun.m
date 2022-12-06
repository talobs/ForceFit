function y = CR_DLVO_fun(obj, x, moa)

%DLVO_FUN Summary of this function goes here
%   Detailed explanation goes here
if strcmp(moa, 'm')
    a = obj.fp.a.mval ;
    ld = obj.fp.ld.mval ;
    Delta = 1-2*obj.fp.p.mval ;
    A = obj.fp.C.mval ;
    offset = obj.fp.offset.mval ;
elseif strcmp(moa, 'a')
    a = obj.fp.a.aval ;
    ld = obj.fp.ld.aval ;
    Delta = 1-2*obj.fp.p.aval ;
    A = obj.fp.C.aval ;
    offset = obj.fp.offset.aval ;
end

try
    y{1} = a*exp(-x/ld)./(1+Delta*exp(-x/ld)) - A./x.^2 + offset;
catch
    y{1} = [] ;
end
end




