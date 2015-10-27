pro varvtime
 
        mvar=fltarr(1000)
        mmjd=fltarr(1000)
        cvar=fltarr(1000)
        cmjd=fltarr(1000)
        S=fltarr(2)

;Read the data files
        print,'Select the maser data.'
        mfile = DIALOG_PICKFILE(FILTER='*.dat', PATH='gdrive/jmu/astrores/su13/luminosity/2x+csc/vary')
        OPENR,1,mfile
        ON_IOERROR,ers       ;Jump to statement ers when I/O error is detected (interrupt end loop)
        n=0                  ;Create a counter 
        WHILE n LT 1000 DO BEGIN 
            READF,1,S        ;Read a line of data 
            mmjd[n]=S[0]     ;Store maser time
            mvar[n]=S[1]     ;Store maser variability
            n=n+1            ;Increment the counter
        ENDWHILE             ;End of while loop 
        ers: CLOSE,1         ;Jump to this statement when an end of file is detected 
        mmjd=mmjd[0:n-1]     ;truncate array to file length
        mvar=mvar[0:n-1]

        print,'Select the control data.'
        cfile = DIALOG_PICKFILE(FILTER='*.dat', PATH='gdrive/jmu/astrores/su13/luminosity/2x+csc/vary')
        OPENR,1,cfile
        ON_IOERROR,ers1      ;Jump to statement ers when I/O error is detected (interrupt end loop)
        n=0                  ;Create a counter 
        WHILE n LT 1000 DO BEGIN 
            READF,1,S        ;Read a line of data 
            cmjd[n]=S[0]     ;Store control time
            cvar[n]=S[1]     ;Store control variability
            n=n+1            ;Increment the counter
        ENDWHILE             ;End of while loop 
        ers1: CLOSE,1        ;Jump to this statement when an end of file is detected 
        cmjd=cmjd[0:n-1]     ;truncate array to file length
        cvar=cvar[0:n-1]
        
;Set graph ranges
        xmins = fltarr(2)
        xmins[0] = MIN(mmjd)
        xmins[1] = MIN(cmjd)
        xmin = MIN(xmins)
        plotmin = 0.9*xmin

        xmaxs = fltarr(2)
        xmaxs[0] = MAX(mmjd)
        xmaxs[1] = MAX(cmjd)
        xmax = MAX(xmaxs)
        plotmax = 1.1*xmax
        
        ymins = fltarr(2)
        ymins[0] = MIN(mvar)
        ymins[1] = MIN(cvar)
        ymin = MIN(xmins)
        bottom = 0.9*ymin

        ymaxs = fltarr(2)
        ymaxs[0] = MAX(mvar)
        ymaxs[1] = MAX(cvar)
        ymax = MAX(xmaxs)
        peak = 1.1*ymax

;Plot data
        x = fltarr(2)
        y = fltarr(2)
        TVLCT, 0, 0, 255, 1
        TVLCT, 255, 0, 0, 2
        print,'Select a location to save the plot'
        savefile = DIALOG_PICKFILE(FILTER='*.eps', PATH='gdrive/jmu/astrores/su13/luminosity/2x+csc/vary')
        set_plot,'ps'
        device,filename=savefile,xsize=12.0,ysize=7.0,/inches,/encapsulated
        PLOT,x,y,$
                XTHICK=3.75,YTHICK=3.75,CHARTHICK=7,CHARSIZE=2.25,$
                XRANGE=[plotmin,plotmax],XSTYLE=1,XMINOR=sizeBin,$
                YRANGE=[-2,2],YSTYLE=1.0,YMINOR=1,$
                XTITLE="mjd",$
                YTITLE="variability"
        OPLOT,cmjd,cvar,THICK=8,psym=1,symsize=1.5,color = 2B
        OPLOT,mmjd,mvar,THICK=8,psym=4,symsize=1.5,color = 1B
        device,/close
        
return
end