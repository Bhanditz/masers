pro ahistintrinsic

        data=fltarr(1000)
        Cntrldata=fltarr(1000)
        mfit = fltarr(300)
        cfit = fltarr(300)
        
;Read the data files

        readcol,'gdrive/jmu/astrores/su13/simulation/montecarlo/lum/pimms/outpimm/new-210-m-intrinsic.dat',data
        readcol,'gdrive/jmu/astrores/su13/simulation/montecarlo/lum/pimms/outpimm/new-210-c-intrinsic.dat',Cntrldata

;Form histogram ranges and bins
        BinDiv = 10 ; 1/2 of the number of bins

        UseError = 1 ; zero means no error constraints 
                     ; one means that the error is already given as a percentage of the value

        datMax = max(data)
        datMin = min(data)
        datSpread = datMax - datMin
        ydim = N_Elements(data)               ;or number of objects in the sample

        CntrldatMax = max(Cntrldata)
        CntrldatMin = min(Cntrldata)
        CntrldatSpread = CntrldatMax - CntrldatMin
        Cntrlydim = N_Elements(Cntrldata)

        abMax = Max([CntrldatMax,datMax])     ;find absolute max of the two samples you want to compare histograms for
        abMin = Min([CntrldatMin,datMin])     ;same as above, for min.
        abSpread = abMax - abMin
               
        sizeBin=abSpread/BinDiv/2.0           ;needed smaller bin sizes here
        print, "sizeBin for fluxes",sizeBin   ;just to keep track of things, absolutely optional

;Create histogram values
        hist = HISTOGRAM(data,BINSIZE=sizeBin,MAX=abMax,MIN=abMin,LOCATIONS=loc)

        NBINS = N_ELEMENTS(loc)
        xplot = FLTARR(NBINS+2)
        xplot[(INDGEN(NBINS)+1)] = loc
        xplot[0] = loc[0]               ; - sizeBin
        xplot[NBINS+1] = loc[NBINS-1]   ;+sizeBin
        
        y = FLTARR(NBINS+2)
        y[(INDGEN(NBINS)+1)] = hist
        y[0] = 0
        y[NBINS+1] = 0

;Normalize that jam
        yplot = y / ydim
        yMax = Max([yplot])

        Cntrlhist = HISTOGRAM( Cntrldata,  BINSIZE=sizeBin,  MAX=abMax,  MIN=abMin, LOCATIONS = Cntrlloc)
        
        CntrlNBINS = N_ELEMENTS(Cntrlloc)
        Cntrlxplot = DBLARR(CntrlNBINS+2)
        Cntrlxplot[(INDGEN(CntrlNBINS)+1)] = Cntrlloc
        Cntrlxplot[0] = Cntrlloc[0]                         ;-sizeBin/4
        Cntrlxplot[CntrlNBINS+1] = Cntrlloc[CntrlNBINS-1]   ;+sizeBin
        
        Cntrly = FLTARR(CntrlNBINS+2)
        Cntrly[(INDGEN(CntrlNBINS)+1)] = Cntrlhist
        Cntrly[0] = 0
        Cntrly[CntrlNBINS+1] = 0
       
        
        Cntrlyplot = Cntrly / Cntrlydim
        CntrlyMax = Max([Cntrlyplot])

        YabMax = Max([CntrlyMax,yMax])

;Gaussian Fit
;        yfit = POLY_FIT( loc, hist, 10 ,Yfit, Yband, Sigma, Corrm )
;        cntrlyfit = POLY_FIT( loc, cntrlhist, 10 ,cntrlYfit, cntrlYband, cntrlSigma, cntrlCorrm )
        
;        Am = coeff[0] ;(z/(sqrt(2*pi)*sigm))
;        Ac = cntrlcoeff[0] ;(z/(sqrt(2*pi)*sigc))
;        mm = coeff[1]
;        mc = cntrlcoeff[1]
;        sigm = coeff[2]
;        sigc = cntrlcoeff[2]
;        z = 18
;        pi = 3.14159265359
;        xfit = FINDGEN(300)/100
;        mfit = exp(-((xfit-mm)^2)/(2*sigm^2))
;        cfit = exp(-((xfit-mc)^2)/(2*sigc^2))

;Select range for graph based on max and min values in data
        allxmin = fltarr(2)
        allxmin[0] = datmin
        allxmin[1] = cntrldatmin
        truexmin = min(allxmin)
        
        
        allxmax = fltarr(2)
        allxmax[0] = datmax
        allxmax[1] = cntrldatmax
        truexmax = max(allxmax)
        
        plototal = truexmax - truexmin
        plotmin = truexmin - 0.05*plototal
        plotmax = truexmax + 0.05*plototal
        
        allymax = fltarr(2)
        allymax[0] = ymax
        allymax[1] = yabmax
        trueymax = max(allymax) 
        peak = trueymax + max(allymax)/10
        
        x=fltarr(2)
        y=fltarr(2)

;Plot histogram
        TVLCT, 0, 0, 128, 1
        TVLCT, 128, 0, 0, 2
        TVLCT, 0, 0, 255, 3
        TVLCT, 255, 0, 0, 4
        savefile = 'gdrive/jmu/astrores/su13/simulation/montecarlo/lum/pimms/outpimm/210-intrinsic.eps'
        set_plot,'ps'
        device,filename=savefile,xsize=12.0,ysize=7.0,/inches,/encapsulated
        PLOT,x,y,$
                ;POS=[0.1,0.2,0.26,0.9],$
                XTHICK=3.75,YTHICK=3.75,CHARTHICK=7,CHARSIZE=2.25,$
                XRANGE=[plotmin,plotmax],XSTYLE=1,XMINOR=sizeBin,$
                YRANGE=[0,peak*100],YSTYLE=1.0,YMINOR=1,$
                ;XTICKNAME=[' ',' ',' ',' ',' ',' ',' '],$
                ;YTICKNAME=[' ',' ',' ',' ',' ',' ',' '],$
                XTITLE="Simulated Intrinsic L (2 - 10 keV)",$
                YTITLE="% objects"
        OPLOT,xplot,yplot*100,PSYM=10,THICK=8,color = 1B
        OPLOT,Cntrlxplot,Cntrlyplot*100, psym=10, THICK=12, linestyle=2,color = 2B
;        OPLOT,loc, yfit, THICK=8,color = 3B
;        OPLOT,loc, cntrlyfit, THICK=12,linestyle=2,color = 4B

;Legend
        lend = truexmin + 0.1*plototal
        oplot, [truexmin,lend], [trueymax*100+0.5,trueymax*100+0.5],THICK=8, psym=10,color = 1B
        xyouts,lend+0.05,trueymax*100,CHARSIZE=2,CHARTHICK=6, 'Masers',color = 1B
        oplot, [truexmin,lend],[trueymax*100-2.5,trueymax*100-2.5], psym=10,THICK=12,linestyle=2,color = 2B
        xyouts,lend+0.05,trueymax*100-3,CHARSIZE=2,CHARTHICK=6, 'Control',color = 2B
        
        device,/close
        set_plot,'x'  
return
end