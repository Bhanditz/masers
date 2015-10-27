pro ahistdata
 
        data=fltarr(1000)
        Cntrldata=fltarr(1000)
        mfit = fltarr(300)
        cfit = fltarr(300)
        
;Read the data files
        print,'Select the maser data.'
        mfile = 'gdrive/jmu/astrores/su13/luminosity/2x+csc/m-dlog.dat'
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
        cfile = 'gdrive/jmu/astrores/su13/luminosity/2x+csc/c-dlog.dat'
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
        BinDiv = 7 ; 1/2 of the number of bins

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
        Cntrlxplot = FLTARR(CntrlNBINS+2)
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
;        yfit = GaussFit(loc, hist, coeff, NTERMS=3)
;        cntrlyfit = GaussFit(loc, cntrlhist, cntrlcoeff, NTERMS=3)
        
;Save data
;        saveplace3 = 'gdrive/jmu/astrores/su13/simulation/lum/loc.dat'
;        saveplace4 = 'gdrive/jmu/astrores/su13/simulation/lum/mhist.dat'
;        saveplace5 = 'gdrive/jmu/astrores/su13/simulation/lum/chist.dat'
;        saveplace6 = 'gdrive/jmu/astrores/su13/simulation/lum/mgaussfit.dat'
;        saveplace7 = 'gdrive/jmu/astrores/su13/simulation/lum/cgaussfit.dat'
;        OPENW,3,saveplace3
;        printf,3,loc
;        close,3
;        OPENW,4,saveplace4
;        printf,4,hist
;        close,4
;        OPENW,5,saveplace5
;        printf,5,cntrlhist
;        close,5
;        OPENW,6,saveplace6
;        printf,6,coeff[0],coeff[1],coeff[2]
;        close,6
;        OPENW,7,saveplace7
;        printf,7,cntrlcoeff[0],cntrlcoeff[1],cntrlcoeff[2]
;        close,7

        SAVE, /VARIABLES, FILENAME='gdrive/jmu/astrores/su13/simulation/dl/dlvar-210.sav'
       
return
end