pro ahistmargin

        sep=fltarr(1000)
        ray=fltarr(1000)
        S=fltarr(2)
        sepadj=fltarr(1000)
        
;Read the data files
        print,'The first dialog box asks for the separation and position error data.'
        shortfile = DIALOG_PICKFILE(FILTER='*.dat', PATH='gdrive/jmu/astrores/su13/margins')
;        print,'The third dialog box asks for rayleigh input.'
;        rayleigh = DIALOG_PICKFILE(FILTER='*.dat', PATH='gdrive/jmu/astrores/su13/margins')
        OPENR,1,shortfile
;        OPENR,2,rayleigh
        ON_IOERROR,ers       ;Jump to statement ers when I/O error is detected (interrupt end loop)
        n=0                  ;Create a counter 
        WHILE n LT 1000 DO BEGIN 
            READF,1,S        ;Read a line of data
;            READF,2,T
            print,S 
            sep[n]=S[0]        ;Store histogram x-axis
            sepadj[n]=S[1]     ;adjusted separation times average poserr divided by individual poserr
;            ray[n]=T
            n=n+1            ;Increment the counter
        ENDWHILE             ;End of while loop 
        ers: CLOSE,1         ;Jump to this statement when an end of file is detected 
        sep=sep[0:n-1]     ;truncate array to file length
        sepadj=sepadj[0:n-1]
;        ray=ray[0:n-1]

;Form histogram ranges and bins
        BinDiv = 15 ;you choose this based on how your data looks like; it can be anything, but integer, for now

        UseError = 0
                     ; zero means no error constraints 
                     ; one means that the error is already
                     ; given as a percentage of the value

        datMax = max(sep)
        datMin = min(sep)
        datSpread = datMax - datMin
        ydim = N_Elements(sep)               ;or number of objects in the sample

        CntrldatMax = max(sepadj)
        CntrldatMin = min(sepadj)
        CntrldatSpread = CntrldatMax - CntrldatMin
        Cntrlydim = N_Elements(sepadj)

        abMax = Max([CntrldatMax,datMax])     ;find absolute max of the two samples you want to compare histograms for
        abMin = Min([CntrldatMin,datMin])     ;same as above, for min.
        abSpread = abMax - abMin
               
        sizeBin=abSpread/BinDiv/2.0           ;needed smaller bin sizes here
        print, "sizeBin for fluxes",sizeBin   ;just to keep track of things, absolutely optional

;Create histogram values
        hist = HISTOGRAM(sep,BINSIZE=sizeBin,MAX=abMax,MIN=abMin,LOCATIONS=loc)

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

        Cntrlhist = HISTOGRAM( sepadj,  BINSIZE=sizeBin,  MAX=abMax,  MIN=abMin, LOCATIONS = Cntrlloc)
        
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
       


;Plot histogram
        print,'Select a location to save the plot'
        savefile = DIALOG_PICKFILE(FILTER='*.eps', PATH='gdrive/jmu/astrores/su13/margins')
        set_plot,'ps'
        device,filename=savefile,xsize=6.0,ysize=3.0,/inches,/encapsulated
        PLOT, xplot,yplot,PSYM=10,$
                ;POS=[0.1,0.2,0.26,0.9],$
                THICK=4,XTHICK=3.75,YTHICK=3.75,CHARTHICK=2,CHARSIZE=1.5,$
                XRANGE=[0,70],XSTYLE=1,XMINOR=sizeBin,$
                YRANGE=[0,yabmax],YSTYLE=1.0,YMINOR=1,$
                ;XTICKNAME=[' ',' ',' ',' ',' ',' ',' '],$
                ;YTICKNAME=[' ',' ',' ',' ',' ',' ',' '],$
                XTITLE="radius",$
                YTITLE="% objects",$
                title='titlep'

        OPLOT,Cntrlxplot,Cntrlyplot, psym=10, THICK=8, linestyle=2
        device,/close
        set_plot,'x'  
        
return
end