function [ y ] = DLVO_expAtr_fun(obj, x, moa)
%DLVO_EXPATR_FUN Summary of this function goes here
%   Detailed explanation goes here

if strcmp(moa, 'm')
    a = obj.fp.a.mval ;
    ld = obj.fp.ld.mval ;
    A = obj.fp.C.mval ;
    b = obj.fp.b.mval ;
    lAtr = obj.fp.lAtr.mval ;
elseif strcmp(moa, 'a')
    a = obj.fp.a.aval ;
    ld = obj.fp.ld.aval ;
    A = obj.fp.C.aval ;
    b = obj.fp.b.aval ;
    lAtr = obj.fp.lAtr.aval ;
end

try
    y{1} = a*exp(-x/ld) - A./x.^2 - b*exp(-x/lAtr);
catch
    y{1} = [] ;
end
end

