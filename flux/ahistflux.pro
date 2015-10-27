pro ahistflux

        data=fltarr(1000)
        Cntrldata=fltarr(1000)

;Read the data files
        print,'Select the maser data.'
        mfile = DIALOG_PICKFILE(FILTER='*.dat', PATH='gdrive/jmu/astrores/su13/flux')
        OPENR,1,mfile
        ON_IOERROR,ers       ;Jump to statement ers when I/O error is detected (interrupt end loop)
        n=0                  ;Create a counter 
        WHILE n LT 1000 DO BEGIN 
            READF,1,S        ;Read a line of data 
            data[n]=S        ;Store histogram x-axis
            n=n+1            ;Increment the counter
        ENDWHILE             ;End of while loop 
        ers: CLOSE,1         ;Jump to this statement when an end of file is detected 
        data=data[0:n-1]     ;truncate array to file length

        print,'Select the control data.'
        cfile = DIALOG_PICKFILE(FILTER='*.dat', PATH='gdrive/jmu/astrores/su13/flux')
        OPENR,1,cfile
        ON_IOERROR,ers1      ;Jump to statement ers when I/O error is detected (interrupt end loop)
        n=0                  ;Create a counter 
        WHILE n LT 1000 DO BEGIN 
            READF,1,S        ;Read a line of data 
            Cntrldata[n]=S   ;Store histogram x-axis
            n=n+1            ;Increment the counter
        ENDWHILE             ;End of while loop 
        ers1: CLOSE,1        ;Jump to this statement when an end of file is detected 
        Cntrldata=Cntrldata[0:n-1]     ;truncate array to file length

;Form histogram ranges and bins
        BinDiv = 5 ;you choose this based on how your data looks like; it can be anything, but integer, for now

        UseError = 1
                     ; zero means no error constraints 
                     ; one means that the error is already
                     ; given as a percentage of the value

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
        
;Select range for graph based on max and min values in data
        allxmin = fltarr(2)
        allxmin[0] = datmin
        allxmin[1] = cntrldatmin
        truexmin = min(allxmin)
        plotmin = truexmin - 0.2
        
        allxmax = fltarr(2)
        allxmax[0] = datmax
        allxmax[1] = cntrldatmax
        truexmax = max(allxmax)
        plotmax = truexmax + 0.2
        
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
        print,'Select a location to save the plot'
        savefile = DIALOG_PICKFILE(FILTER='*.eps', PATH='gdrive/jmu/astrores/su13/flux')
        set_plot,'ps'
        device,filename=savefile,xsize=12.0,ysize=7.0,/inches,/encapsulated
        PLOT,x,y,$
                ;POS=[0.1,0.2,0.26,0.9],$
                XTHICK=3.75,YTHICK=3.75,CHARTHICK=7,CHARSIZE=2.25,$
                XRANGE=[plotmin,plotmax],XSTYLE=1,XMINOR=sizeBin,$
                YRANGE=[0,peak*100],YSTYLE=1.0,YMINOR=1,$
                ;XTICKNAME=[' ',' ',' ',' ',' ',' ',' '],$
                ;YTICKNAME=[' ',' ',' ',' ',' ',' ',' '],$
                XTITLE="F (14-195 keV)",$
                YTITLE="% objects"
        OPLOT,xplot,yplot*100,PSYM=10,THICK=8,color = 1B
        OPLOT,Cntrlxplot,Cntrlyplot*100, psym=10, THICK=12, linestyle=2,color = 2B

;Legend
        lxmin = truexmin + 1.5
        lend = lxmin + 0.25
        oplot, [lxmin,lend], [trueymax*100+0.5,trueymax*100+0.5],THICK=8, psym=10,color = 1B
        xyouts,lend+0.05,trueymax*100,CHARSIZE=2,CHARTHICK=6, 'Masers',color = 1B
        oplot, [lxmin,lend],[trueymax*100-2.5,trueymax*100-2.5], psym=10,THICK=12,linestyle=2,color = 2B
        xyouts,lend+0.05,trueymax*100-3,CHARSIZE=2,CHARTHICK=6, 'Control',color = 2B
        
        device,/close
        set_plot,'x'  
        
return
end