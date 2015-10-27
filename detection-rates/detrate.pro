pro detrate

;Declare variables
    cat=FLTARR(100)      ;catalog names
    e=FLTARR(100)        ;average energy per catalog
    loge=FLTARR(100)       ;log of energy
    c=FLTARR(100)        ;control count
    m=FLTARR(100)        ;maser count
    cr=FLTARR(100)       ;control rate
    mr=FLTARR(100)       ;maser rate
    mc=FLTARR(100)       ;maser/control
    S=FLTARR(3)          ;line reader
;Read the data files
    print,'Select the data.'
    dfile = DIALOG_PICKFILE(FILTER='*.dat', PATH='gdrive/jmu/astrores/su13/detection-rates')
    OPENR,1,dfile
    ON_IOERROR,ers       ;Jump to statement ers when I/O error is detected (interrupt end loop)
    n=0                  ;Create a counter
    WHILE n LT 100 DO BEGIN 
        READF,1,S        ;Read a line of data 
        print,S
        e[n]=S[0]
        loge[n]=alog(e[n])
        c[n]=S[1]
        m[n]=S[2]
        mr[n]=m[n]/151
        cr[n]=c[n]/3339
        mc[n]=mr[n]/cr[n]
        n=n+1            ;Increment the counter
    ENDWHILE             ;End of while loop 
    ers: CLOSE,1         ;Jump to this statement when an end of file is detected 
    cat=cat[0:n-1]       ;truncate array to file length
    e=e[0:n-1]
    loge=loge[0:n-1]
    c=c[0:n-1]
    m=m[0:n-1]
    mr=mr[0:n-1]
    cr=cr[0:n-1]
    mc=mc[0:n-1]
    
    
    
    cr1 = fltarr(1)
    cr2 = fltarr(1)
    cr3 = fltarr(1)
    cr4 = fltarr(1)
    cr5 = fltarr(1)
    cr6 = fltarr(1)
    mr1 = fltarr(1)
    mr2 = fltarr(1)
    mr3 = fltarr(1)
    mr4 = fltarr(1)
    mr5 = fltarr(1)
    mr6 = fltarr(1)
    cr6[0] = cr[0]
    cr1[0] = cr[1]
    cr2[0] = cr[2]
    cr3[0] = cr[3]
    cr4[0] = cr[4]
    cr5[0] = cr[5]
    mr6[0] = mr[0]
    mr1[0] = mr[1]
    mr2[0] = mr[2]
    mr3[0] = mr[3]
    mr4[0] = mr[4]
    mr5[0] = mr[5]
    loge1 = fltarr(1)
    loge2 = fltarr(1)
    loge3 = fltarr(1)
    loge4 = fltarr(1)
    loge5 = fltarr(1)
    loge6 = fltarr(1)
    mc1 = fltarr(1)
    mc2 = fltarr(1)
    mc3 = fltarr(1)
    mc4 = fltarr(1)
    mc5 = fltarr(1)
    mc6 = fltarr(1)
    loge1[0] = loge[0]
    loge2[0] = loge[1]
    loge3[0] = loge[2]
    loge4[0] = loge[3]
    loge5[0] = loge[4]
    loge6[0] = loge[5]
    mc1[0] = mc[0]
    mc2[0] = mc[1]
    mc3[0] = mc[2]
    mc4[0] = mc[3]
    mc5[0] = mc[4]
    mc6[0] = mc[5]
    
    
;Find maximum values
    logemax=MAX(loge)+MAX(loge)/10
    mrmax=MAX(mr)+MAX(mr)/10
    crmax=MAX(cr)+MAX(cr)/10
    mcmax=MAX(mc)+MAX(mc)/10
    
    x=fltarr(2)
    y=fltarr(2)
        
;Draw Maser vs Control plot
    TVLCT, 255, 0, 0, 1
    TVLCT, 255, 128, 0, 2
    TVLCT, 40, 150, 40, 3
    TVLCT, 40, 40, 200, 4
    TVLCT, 30, 175, 175, 5
    TVLCT, 180, 50, 180, 6
    print,'Select a location to save maser vs control'
    savefile = DIALOG_PICKFILE(FILTER='*.eps', PATH='gdrive/jmu/astrores/su13/detection-rates')
    set_plot,'ps'
    device,filename=savefile,xsize=12.0,ysize=7.0,/inches,/encapsulated
    PLOT,x,y,PSYM=4,symsize=1.5,$
        THICK=6,XTHICK=3.75,YTHICK=3.75,CHARTHICK=6.5,CHARSIZE=2,$
        TITLE='Maser vs. Non-maser Detection Rates',$
        XTITLE='Non-maser Rate',YTITLE='Maser Rate',$
        XRANGE=[0,crmax],XSTYLE=1,XMINOR=1,$
        YRANGE=[0,mrmax],YSTYLE=1.0,YMINOR=1
    OPLOT,cr6,mr6,PSYM=4,symsize=1.5,color=1B,THICK=9    
    OPLOT,cr1,mr1,PSYM=4,symsize=1.5,color=2B,THICK=9
    OPLOT,cr2,mr2,PSYM=4,symsize=1.5,color=3B,THICK=9
    OPLOT,cr3,mr3,PSYM=4,symsize=1.5,color=4B,THICK=9
    OPLOT,cr4,mr4,PSYM=4,symsize=1.5,color=5B,THICK=9
    OPLOT,cr5,mr5,PSYM=4,symsize=1.5,color=6B,THICK=9
    OPLOT,cr6,mr6,PSYM=4,symsize=1,color=1B,THICK=9
    OPLOT,cr1,mr1,PSYM=4,symsize=1,color=2B,THICK=9
    OPLOT,cr2,mr2,PSYM=4,symsize=1,color=3B,THICK=9
    OPLOT,cr3,mr3,PSYM=4,symsize=1,color=4B,THICK=9
    OPLOT,cr4,mr4,PSYM=4,symsize=1,color=5B,THICK=9
    OPLOT,cr5,mr5,PSYM=4,symsize=1,color=6B,THICK=9

;Draw Maser/Control vs Energy plot
    print,'Select a location to save m/c vs energy'
    savefile = DIALOG_PICKFILE(FILTER='*.eps', PATH='gdrive/jmu/astrores/su13/detection-rates')
    set_plot,'ps'
    device,filename=savefile,xsize=12.0,ysize=7.0,/inches,/encapsulated
    PLOT,x,y,PSYM=1,$
        THICK=4,XTHICK=3.75,YTHICK=3.75,CHARTHICK=6.5,CHARSIZE=2,$
        TITLE='Maser/Non-maser Rates vs. Energy',$
        XTITLE='Energy log(keV)',YTITLE='Maser Rate/Non-maser Rate',$
        XRANGE=[0,logemax],XSTYLE=1,XMINOR=1,$
        YRANGE=[0,mcmax],YSTYLE=1.0,YMINOR=1
    OPLOT,loge1,mc1,PSYM=4,symsize=1.5,color=1B,THICK=9
    OPLOT,loge2,mc2,PSYM=4,symsize=1.5,color=2B,THICK=9
    OPLOT,loge3,mc3,PSYM=4,symsize=1.5,color=3B,THICK=9
    OPLOT,loge4,mc4,PSYM=4,symsize=1.5,color=4B,THICK=9
    OPLOT,loge5,mc5,PSYM=4,symsize=1.5,color=5B,THICK=9
    OPLOT,loge6,mc6,PSYM=4,symsize=1.5,color=6B,THICK=9
    OPLOT,loge1,mc1,PSYM=4,symsize=1,color=1B,THICK=9
    OPLOT,loge2,mc2,PSYM=4,symsize=1,color=2B,THICK=9
    OPLOT,loge3,mc3,PSYM=4,symsize=1,color=3B,THICK=9
    OPLOT,loge4,mc4,PSYM=4,symsize=1,color=4B,THICK=9
    OPLOT,loge5,mc5,PSYM=4,symsize=1,color=5B,THICK=9
    OPLOT,loge6,mc6,PSYM=4,symsize=1,color=6B,THICK=9
    device,/close
    set_plot,'x'
    
return
end