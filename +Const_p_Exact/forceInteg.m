function y = forceInteg(solsDB, x, phiInf, p) % x is kL
x = sort(x) ;
phim = Const_p_Exact.getPhim(solsDB, x, p, phiInf) ;
y = -cumtrapz(x, cosh(phim)-1) ;
y = y - min(y) ;
end