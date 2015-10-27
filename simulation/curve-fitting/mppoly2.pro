pro mppoly2

;Restore variables from ahist
  RESTORE, '/users/drewnutter/gdrive/jmu/astrores/su13/simulation/lum/lumvars-210.sav'
  histerr = hist*0 + .001               ;error
  cntrlhisterr = cntrlhist*0 + .00001

;Define an MPFIT polynomial expression
  expr = 'P[0] + X*P[1] + X^2*P[2] + X^3*P[3]'
  result = MPFITEXPR(expr,xplot,yplot,histerr, start)
  cntrlresult = MPFITEXPR(expr,xplot,cntrlyplot,cntrlhisterr, start)

;Define new x-axis for fit curve and apply fit
  x = findgen(100)*0.06 + 37
  maserfit = result(0) + result(1)*x + result(2)*x^2 + result(3)*x^3
  xn = findgen(100)*0.07 + 37
  cntrlfit = cntrlresult(0) + cntrlresult(1)*xn + cntrlresult(2)*xn^2 + cntrlresult(3)*xn^3

  print,'Maser data is: ',result
  print,'Control data is: ',cntrlresult

;Plot results on top of original data
  TVLCT, 0, 0, 128, 1
  TVLCT, 128, 0, 0, 2
  TVLCT, 0, 0, 255, 3
  TVLCT, 255, 0, 0, 4

  savefile = '/users/drewnutter/gdrive/jmu/astrores/su13/simulation/curve-fitting/lum/210-lummaser.eps'
  set_plot,'ps'
  device,filename=savefile,xsize=12.0,ysize=7.0,/inches,/encapsulated
  plot,xplot,yplot*100,psym=10,thick=7,color=1B,linestyle=2
  oplot,x,maserfit*100,color=3B,thick=7
  device,/close

  savefile = '/users/drewnutter/gdrive/jmu/astrores/su13/simulation/curve-fitting/lum/210-lumcontrol.eps'
  set_plot,'ps'
  device,filename=savefile,xsize=12.0,ysize=7.0,/inches,/encapsulated
  plot,xplot,cntrlyplot*100,psym=10,linestyle=2,thick=7,color=2B
  oplot,xn,cntrlfit*100,color=4B,thick=7
  device,/close
  
  SAVE, /VARIABLES, FILENAME='gdrive/jmu/astrores/su13/simulation/curve-fitting/lum/fit-210-lum.sav'

return
end 

;;; For higher order polynomials use this prewritten code. ;;;
; + X^4*P[4] + X^5*P[5] + X^6*P[6] + X^7*P[7] + X^8*P[8] + X^9*P[9]';,$
;    ' + X^10*P[10] + X^11*P[11] + X^12*P[12] + X^13*P[13] + X^14*P[14] + X^15*P[15] + X^16*P[16] + X^17*P[17] + X^18*P[18]'
; + result(4)*loc^4 +$
;    result(5)*loc^5 + result(6)*loc^6 + result(7)*loc^7 + result(8)*loc^8 + result(9)*loc^9,$; +$
;    result(10)*loc^10 + result(11)*loc^11 + result(12)*loc^12 + result(13)*loc^13 + result(14)*loc^14 +$
;    result(15)*loc^15 + result(16)*loc^16 + result(17)*loc^17 + result(18)*loc^18
; + cntrlresult(4)*loc^4 +$
;    cntrlresult(5)*loc^5 + cntrlresult(6)*loc^6 + cntrlresult(7)*loc^7 + cntrlresult(8)*loc^8 + cntrlresult(9)*loc^9,$; +$
;    cntrlresult(10)*loc^10 + cntrlresult(11)*loc^11 + cntrlresult(12)*loc^12 + cntrlresult(13)*loc^13 + cntrlresult(14)*loc^14 +$
;    cntrlresult(15)*loc^15 + cntrlresult(16)*loc^16 + cntrlresult(17)*loc^17 + cntrlresult(18)*loc^18