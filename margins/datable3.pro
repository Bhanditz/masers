pro datable3

;Declare variables
        sep=fltarr(1000)
        rayx=fltarr(1000)
        rayy=fltarr(1000)
        R=fltarr(2)


;Select files
    print,'The first dialog box asks for the list of separations.'
    separations = DIALOG_PICKFILE(FILTER='*.dat', PATH='gdrive/jmu/astrores/su13/margins')
;    print,'The second dialog box asks for list of rayleigh points.'
;    rayleigh = DIALOG_PICKFILE(FILTER='*.dat', PATH='gdrive/jmu/astrores/su13/margins')

;Save separation data into array
    OPENR,1,separations
    ON_IOERROR,ers
    n=0                      ;Create a counter 
    WHILE n LT 1000 DO BEGIN ;Begin read loop
        READ,1,S             ;Read one line
        sep[n] = S           ;Save into array
        n = n + 1            ;Add to counter
        print,'hello'
    ENDWHILE
    ers: CLOSE,1             ;Jump to this statement when an end of file is detected 
    sep=sep[0:n-1]           ;Truncate array to file length

;Save rayleigh data into array
;    ON_IOERROR,ers2
;    n=0                      ;Reset counter 
;    OPENR,2,rayleigh
;    WHILE n LT 1000 DO BEGIN ;Begin read loop
;        READ,2,R             ;Read one line
;        rayx[n] = R[0]       ;Save into array
;        rayy[n] = R[1]       ;Save into array
;        n = n + 1            ;Add to counter
;    ENDWHILE
;    ers2: CLOSE,2            ;Jump to this statement when an end of file is detected 
;    rayx=rayy[0:n-1]           ;Truncate array to file length
;    rayx=rayy[0:n-1]           ;Truncate array to file length

;Establish information for separation histogram
    BinDiv = 15              ;you choose this based on how your data looks like; it can be anything, but integer, for now

    UseError = 0
                     ; zero means no error constraints 
                     ; one means that the error is already
                     ; given as a percentage of the value
    datMax = max(sep)
    datMin = min(sep)
    datSpread = datMax - datMin
    ydim = N_Elements(sep)                ;or number of objects in the sample
    
    sizeBin=5    ;datSpread/BinDiv/2.0          ;needed smaller bin sizes here
    print, "sizeBin for fluxes",sizeBin   ;just to keep track of things, absolutely optional
    
    hist = HISTOGRAM(sep,BINSIZE=sizeBin,MAX=datMax,MIN=datMin,LOCATIONS=loc)

    NBINS = N_ELEMENTS(loc)
    xplot = FLTARR(NBINS+2)
    xplot[(INDGEN(NBINS)+1)] = loc
    xplot[0] = loc[0]               ;-sizeBin
    xplot[NBINS+1] = loc[NBINS-1]   ;+sizeBin

    y = FLTARR(NBINS+2)
    y[(INDGEN(NBINS)+1)] = hist
    y[0] = 0
    y[NBINS+1] = 0

    ;Normalize that jam
    yplot = y / ydim
    yMax = Max([yplot])
    
    print,'Select a location to save the plot'
    savefile = DIALOG_PICKFILE(FILTER='*.eps', PATH='gdrive/jmu/astrores/su13/margins')
    set_plot,'ps'
    device,filename=savefile,xsize=6.0,ysize=3.0,/inches,/encapsulated
    PLOT,xplot,yplot,PSYM=10,$
        THICK=4,XTHICK=3.75,YTHICK=3.75,CHARTHICK=2,CHARSIZE=1.5,$
        XRANGE=[0,70],XSTYLE=1,XMINOR=sizeBin,$
        YRANGE=[0,ymax],YSTYLE=1.0,YMINOR=1,$
        title='titlep',XTITLE="radius",YTITLE="% objects"
;    OPLOT,rayx,rayy,psym=10,THICK=8,linestyle=2
    device,/close
    set_plot,'x'

return
end