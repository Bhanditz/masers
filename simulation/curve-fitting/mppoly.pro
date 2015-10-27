pro mppoly

;Restore variables from ahist
  RESTORE, '/users/drewnutter/gdrive/jmu/astrores/su13/simulation/flux/fluxvariables.sav'
  histerr = hist*0 + .001               ;error
  cntrlhisterr = cntrlhist*0 + .00001

;Define an MPFIT polynomial expression
  expr = 'P[0] + X*P[1] + X^2*P[2] + X^3*P[3]'; + X^4*P[4] + X^5*P[5] + X^6*P[6] + X^7*P[7] + X^8*P[8] + X^9*P[9]';,$
;    ' + X^10*P[10] + X^11*P[11] + X^12*P[12] + X^13*P[13] + X^14*P[14] + X^15*P[15] + X^16*P[16] + X^17*P[17] + X^18*P[18]'
  result = MPFITEXPR(expr,loc,hist,histerr, start)
  cntrlresult = MPFITEXPR(expr,loc,cntrlhist,cntrlhisterr, start)

;Define new x-axis for fit curve
  x = -findgen(100)*(5.5/100) - 9.5

;Plot results on top of original data
  ploterr,loc,cntrlhist,histerr
  oplot,loc,hist*4
  oplot,loc,$
    (result(0) + result(1)*loc + result(2)*loc^2 + result(3)*loc^3)*4,$; + result(4)*loc^4 +$
;    result(5)*loc^5 + result(6)*loc^6 + result(7)*loc^7 + result(8)*loc^8 + result(9)*loc^9,$; +$
;    result(10)*loc^10 + result(11)*loc^11 + result(12)*loc^12 + result(13)*loc^13 + result(14)*loc^14 +$
;    result(15)*loc^15 + result(16)*loc^16 + result(17)*loc^17 + result(18)*loc^18,$
    color=255,thick=5 
  oplot,loc,$
    cntrlresult(0) + cntrlresult(1)*loc + cntrlresult(2)*loc^2 + cntrlresult(3)*loc^3,$; + cntrlresult(4)*loc^4 +$
;    cntrlresult(5)*loc^5 + cntrlresult(6)*loc^6 + cntrlresult(7)*loc^7 + cntrlresult(8)*loc^8 + cntrlresult(9)*loc^9,$; +$
;    cntrlresult(10)*loc^10 + cntrlresult(11)*loc^11 + cntrlresult(12)*loc^12 + cntrlresult(13)*loc^13 + cntrlresult(14)*loc^14 +$
;    cntrlresult(15)*loc^15 + cntrlresult(16)*loc^16 + cntrlresult(17)*loc^17 + cntrlresult(18)*loc^18,$
    color=255,thick=5 
  print,'maser',result(0),result(1),result(2),result(3)
  print,'control',cntrlresult(0),cntrlresult(1),cntrlresult(2),cntrlresult(3)
return
end