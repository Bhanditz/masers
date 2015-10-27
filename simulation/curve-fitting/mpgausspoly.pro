; This procedure is used to fit gaussian curves over two distributions. Code must be edited to select quantity
; and general location of the gaussian curves. The values from this fit are then transformed 

pro mpgausspoly

;Set variables
  RESTORE, '/users/drewnutter/gdrive/jmu/astrores/su13/simulation/flux/fluxvariables.sav'
  histerr = hist*0 + .001                     ;Invent hypothetical error, adjust to improve fit
  cntrlhisterr = cntrlhist*0 + .001
  cntrlhist = 100*cntrlhist/total(cntrlhist)  ;Scale to percentage
  hist = 100*hist/total(hist)

;Define an MPFIT 19 degree polynomial expression
  expr = 'GAUSS1(X, P[0:2]) + GAUSS1(X, P[3:5]) + GAUSS1(X, P[6:8]) + GAUSS1(X, P[9:11])'
  start = [-12.6,0.7,37 , -10.5,1,6.45 , -11.6,1,3.23 , -14,0.1,3.23]
  cntrlexpr = 'GAUSS1(X, P[0:2]) + GAUSS1(X, P[3:5]) + GAUSS1(X, P[6:8])'
  cntrlstart = [-12.3845,1.29635,96.1745 , -13.3787,0.241437,14.3545 , -11,0.1,57]
  result = MPFITEXPR(expr,loc,hist,histerr, start)
  cntrlresult = MPFITEXPR(cntrlexpr,loc,cntrlhist,cntrlhisterr, cntrlstart)

;Define new x values and apply fit
  x = -findgen(1000)*(5.55/1000) - 9.45
  maserfit = gauss1(x, result(0:2)) + gauss1(x, result(3:5)) + gauss1(x, result(6:8)) + gauss1(x, result(9:11))
  cntrlfit = gauss1(x, cntrlresult(0:2)) + gauss1(x, cntrlresult(3:5)) + gauss1(x, result(6:8))

;Plot results on top of original data
  TVLCT, 0, 0, 128, 1
  TVLCT, 128, 0, 0, 2
  TVLCT, 0, 0, 255, 3
  TVLCT, 255, 0, 0, 4

  savefile = 'gdrive/jmu/astrores/su13/simulation/flux/gaussmaser.eps'
  set_plot,'ps'
  device,filename=savefile,xsize=12.0,ysize=7.0,/inches,/encapsulated
  plot,loc,hist,psym=10,thick=7,color=1B,linestyle=2
  oplot,x,maserfit,color=3B,thick=7
  device,/close

  savefile = 'gdrive/jmu/astrores/su13/simulation/flux/gausscontrol.eps'
  set_plot,'ps'
  device,filename=savefile,xsize=12.0,ysize=7.0,/inches,/encapsulated
  plot,loc,cntrlhist,psym=10,linestyle=2,thick=7,color=2B
  oplot,x,cntrlfit,color=4B,thick=7
  device,/close

;Save the variables
  zz_readme = 'Variables RESULT and CNTRLRESULT list values (mean, sigma, area) for GAUSS1.pro as packaged with MPFIT. RESULT is for masers and represents four different gauss functions. CNTRLRESULT is for the control and represents three.'
  SAVE, /VARIABLES, FILENAME='gdrive/jmu/astrores/su13/simulation/flux/fluxmodelgauss.sav'

return
end