pro ahistsim2

;        RESTORE, FILENAME='gdrive/jmu/astrores/su13/simulation/curve-fitting/mppoly2-2xcsc-210.sav'
;        data1=fltarr(50000)
;        mfit = fltarr(300)
;        cfit = fltarr(300)

;Read the data files
        mfile = 'gdrive/jmu/astrores/su13/simulation/montecarlo/lum/210/210-lumsim-m.dat'
        readcol,mfile,data1

;Form histogram ranges and bins
        BinDiv1 = 5.5 ; 1/2 of the number of bins

        UseError1 = 1 ; zero means no error constraints 
                     ; one means that the error is already given as a percentage of the value

        datMax1 = max(data1)
        datMin1 = min(data1)
        datSpread1 = datMax1 - datMin1
        ydim1 = N_Elements(data1)               ;or number of objects in the sample

        abMax1 = Max([datMax1])     ;find absolute max of the two samples you want to compare histograms for
        abMin1 = Min([datMin1])     ;same as above, for min.
        abSpread1 = abMax1 - abMin1
        
        sizeBin1=abSpread1/BinDiv1/2.0           ;needed smaller bin sizes here
        print, "sizeBin for fluxes",sizeBin1   ;just to keep track of things, absolutely optional

;Create histogram values
        newhist1 = HISTOGRAM(data1,BINSIZE=sizeBin1,MAX=abMax1,MIN=abMin1,LOCATIONS=loc)

        NBINS1 = N_ELEMENTS(loc)
        xplot1 = FLTARR(NBINS1+2)
        xplot1[(INDGEN(NBINS1)+1)] = loc
        xplot1[0] = loc[0]               ; - sizeBin
        xplot1[NBINS1+1] = loc[NBINS1-1]   ;+sizeBin
        
        y1 = FLTARR(NBINS1+2)
        y1[(INDGEN(NBINS1)+1)] = newhist1
        y1[0] = 0
        y1[NBINS1+1] = 0

;Normalize that jam
        yplot1 = y1 / ydim1
        YabMax1 = Max([yplot1])

;Select range for graph based on max and min values in data ----- FIX THIS, REDUNDANT FROM OLD CODE
        truexmin1 = datmin1
        truexmax1 = datmax1
        plototal1 = truexmax1 - truexmin1
        plotmin1 = truexmin1 - 0.05*plototal1
        plotmax1 = truexmax1 + 0.05*plototal1

        
        xx=fltarr(2)
        yy=fltarr(2)

;;;;;;;; BEGIN COPY OF MPPOLY2 ;;;;;;;;;;;;
;
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
  xn = findgen(100)*0.07 + 37
  maserfit = result(0) + result(1)*x + result(2)*x^2 + result(3)*x
  cntrlfit = cntrlresult(0) + cntrlresult(1)*xn + cntrlresult(2)*xn^2 + cntrlresult(3)*xn^3
;
;;;;;;;; END COPY OF MPPOLY2 ;;;;;;;;;;;;

  TVLCT, 0, 0, 128, 1
  TVLCT, 128, 0, 0, 2
  TVLCT, 0, 0, 255, 3
  TVLCT, 255, 0, 0, 4
  
        xplot2 = xplot1 + sizeBin1/2        ;shift graph by half a bin size

        trueymax1 = .2
        peak1 = trueymax1 + trueymax1/10

        savefile = 'gdrive/jmu/astrores/su13/simulation/montecarlo/lum/210/210-lumsim-m.eps'
        set_plot,'ps'
        device,filename=savefile,xsize=12.0,ysize=7.0,/inches,/encapsulated
        PLOT,xx,yy,$
                XTHICK=3.75,YTHICK=3.75,CHARTHICK=7,CHARSIZE=2.25,$
                XRANGE=[plotmin1,plotmax1],XSTYLE=1,XMINOR=sizeBin,$
                YRANGE=[0,peak1*100-7],YSTYLE=1.0,YMINOR=1,$
                XTITLE="Luminosity (2 - 10 keV)",$
                YTITLE="% objects"
        OPLOT,xplot2,yplot1*100,PSYM=10,THICK=8,color = 1B
        OPLOT,xplot,cntrlyplot*100,psym=10,thick=12,color=1B,linestyle=2
        OPLOT,xn,cntrlfit*100,thick=7,color=1B
;        OPLOT,Cntrlxplot,Cntrlyplot*100, psym=10, THICK=12, linestyle=2,color = 2B
;        OPLOT,loc, yfit, THICK=8,color = 3B
;        OPLOT,loc, cntrlyfit, THICK=12,linestyle=2,color = 4B

;Legend
        trueymax1 = .13    ;shift it vertically
        truexmin1 = truexmin1 + 0    ;shift it horizontally
        lend1 = truexmin1 + 0.1*plototal1
        oplot, [truexmin1,lend1], [trueymax1*100+0.5,trueymax1*100+0.5],THICK=8, psym=10,color = 1B
        xyouts,lend1+0.05,trueymax1*100,CHARSIZE=2,CHARTHICK=6, 'Simulation',color = 1B
        oplot, [truexmin1,lend1],[trueymax1*100-1,trueymax1*100-1], psym=10,THICK=12,linestyle=2,color = 1B
        xyouts,lend1+0.05,trueymax1*100-1,CHARSIZE=2,CHARTHICK=6, 'Masers',color = 1B
        
        device,/close
        set_plot,'x'  
return
end