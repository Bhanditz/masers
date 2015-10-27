pro ahistdata2

        mfit = fltarr(300)
        cfit = fltarr(300)
        
;Read the data files
        readcol,'gdrive/jmu/astrores/su13/luminosity/swift-bat/mlum.dat',data
        readcol,'gdrive/jmu/astrores/su13/luminosity/swift-bat/clum.dat',Cntrldata

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

        SAVE, /VARIABLES, FILENAME='gdrive/jmu/astrores/su13/simulation/lum/lumvars-swift.sav'
       
return
end