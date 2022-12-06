function F = force(solsDB, L, c, constFit) 
% c = [psiInf p A d offset kScale]
% return force in nN
xRange = sort(solsDB.xRange) ;
k_B = 1.38e-23 ;
e = 1.6e-19 ;

psiInf = c(1) ;
p = c(2) ;
A = c(3) ;
d = c(4) ;
offset = c(5) ;
kScale = c(6) ;

kappa = constFit.kappa*kScale ;
R = constFit.R ;
T_K = constFit.T_K ;
n = constFit.n ;

x = kappa*L ;
validXInds = x > xRange(1) ;
x = x(validXInds) ;

z = L + d ;
z = z(validXInds) ;

kappaSI = kappa*1e9;
phiInf = e*psiInf/(k_B*T_K) ;

F = 4*pi*R*n*k_B*T_K/kappaSI*Const_p_Exact.forceInteg(solsDB, x, phiInf, p)*1e9 ;
F = F - ((A*1e-21)*R./(6*(z*1e-9).^2))*1e9 + offset;
if sum(~validXInds)
    F = [NaN(sum(~validXInds), 1) ; F] ;
end
end

