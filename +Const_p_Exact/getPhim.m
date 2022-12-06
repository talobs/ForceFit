function y = getPhim(solsDB, x, p, phiInf) %x is kL
sols = solsDB.sols ;
pVec = solsDB.pVec ;
phiInfs = solsDB.phiInfs ;
xRange = solsDB.xRange ;

if p > max(pVec) || p < min(pVec)
    error('p is out of range')
end

if sum(x < min(xRange))
    error('x is out of range')
end

if phiInf < 0 || phiInf > max(phiInfs)
    error('phiInf is out of range') ;
end

pSInd = find(p >= pVec) ;
pSInd = pSInd(end) ;
if pSInd == length(pVec)
    pSInd = pSInd -1 ;
end
pLInd = pSInd + 1 ;
pS = pVec(pSInd) ;
pL = pVec(pLInd) ;

pSW = 1 - (p-pS)/(pL - pS) ;
pLW = 1 - (pL-p)/(pL - pS) ;

xRange = sort(xRange) ;
xInRangeInds = x <= xRange(2) ;
xOutRangeInds = ~xInRangeInds ;
xInRange = x(xInRangeInds) ;
xOutRange = x(xOutRangeInds) ;
y = zeros(size(x, 1), size(x, 2)) ;

if phiInf < phiInfs(1)
    phiL = phiInfs(1) ;
    phiLW = 1 - (phiL - phiInf)/phiL ;
    
    if sum(xInRangeInds)
        yXInRange = (pSW*phiLW)*deval(sols{pSInd, 1}, xInRange) + ...
                    (pLW*phiLW)*deval(sols{pLInd, 1}, xInRange) ;
        y(xInRangeInds) = yXInRange ;
    end
    
    if sum(xOutRangeInds)
        yXMax = (pSW*phiLW)*deval(sols{pSInd, 1}, xRange(2)) + ...
                (pLW*phiLW)*deval(sols{pLInd, 1}, xRange(2)) ;
        
        yXOutRange = yXMax*exp(-(xOutRange-xRange(2))/2) ;
        y(xOutRangeInds) = yXOutRange ;
    end
else
    phiSInd = find(phiInf >= phiInfs) ;
    phiSInd = phiSInd(end) ;
    if phiSInd == length(phiInfs)
        phiSInd = phiSInd - 1 ;
    end
    phiLInd = phiSInd + 1 ;
    phiS = phiInfs(phiSInd) ;
    phiL = phiInfs(phiLInd) ;
    
    phiSW = 1 - (phiInf - phiS)/(phiL - phiS) ;
    phiLW = 1 - (phiL - phiInf)/(phiL - phiS) ;
    
    if sum(xInRangeInds)
        yXInRange = (pSW*phiSW)*deval(sols{pSInd, phiSInd}, xInRange) + ...
                    (pLW*phiSW)*deval(sols{pLInd, phiSInd}, xInRange) + ...
                    (pSW*phiLW)*deval(sols{pSInd, phiLInd}, xInRange) + ...
                    (pLW*phiLW)*deval(sols{pLInd, phiLInd}, xInRange) ;
        y(xInRangeInds) = yXInRange ;
    end
    
    if sum(xOutRangeInds)
        yXMax = (pSW*phiSW)*deval(sols{pSInd, phiSInd}, xRange(2)) + ...
                (pLW*phiSW)*deval(sols{pLInd, phiSInd}, xRange(2)) + ...
            	(pSW*phiLW)*deval(sols{pSInd, phiLInd}, xRange(2)) + ...
            	(pLW*phiLW)*deval(sols{pLInd, phiLInd}, xRange(2)) ;
        
        yXOutRange = yXMax*exp(-(xOutRange-xRange(2))/2) ;
        y(xOutRangeInds) = yXOutRange ;
    end
end

end