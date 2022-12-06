function F = const_p_linear_force(L, c, constFit)
R = constFit.R ;
epss = constFit.epss ;
kappa = constFit.kappa ; %m

psiInf = c(1) ; %V
p = c(2) ;
A = c(3) ; % J*1e-21 ;
d = c(4) ; % nm
offset = c(5) ; % nN
kScale = c(6) ;

kappa = kappa*kScale ;

z = L+d ;
x = L*kappa/2 ;
kappaSI = kappa*1e9;

if p == 0.5
    F = 2*pi*R*kappaSI*epss*psiInf^2*(-log(tanh(x)))*1e9 ;
else
    F = 2*pi*R*kappaSI*epss*psiInf^2*(1-tanh(x).^(1-2*p))/(1-2*p)*1e9 ;
end

F = F - ((A*1e-21)*R./(6*(z*1e-9).^2))*1e9 + offset;
end