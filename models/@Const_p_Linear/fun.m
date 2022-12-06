function y = fun(obj, x, moa)

%DLVO_FUN Summary of this function goes here
%   Detailed explanation goes here
if strcmp(moa, 'm')
    psiInf = obj.fp.psiInf.mval ;
    p = obj.fp.p.mval ;
    A = obj.fp.A.mval ;
    d = obj.fp.d.mval ;
    offset = obj.fp.offset.mval ;
    kScale = obj.fp.kScale.mval ;
elseif strcmp(moa, 'a')
    psiInf = obj.fp.psiInf.aval ;
    p = obj.fp.p.aval ;
    A = obj.fp.A.aval ;
    d = obj.fp.d.aval ;
    offset = obj.fp.offset.aval ;
    kScale = obj.fp.kScale.aval ;
end

constFit.R = obj.pr.R.val ;
constFit.epss = epssF(obj.pr.T_C.val) ;
constFit.kappa = obj.kappa*1e-9 ; %nm^-1

c = [psiInf p A d offset kScale] ;

try
    y{1} = TalForce(x, c, constFit) ;
catch
    y{1} = [] ;
end
end




