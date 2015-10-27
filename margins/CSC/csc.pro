pro csc
;Read the data file
OPENR,1,'/Users/drewnutter/gdrive/jmu/astrores/su13/CSC/cscflat.dat'
x=FLTARR(1000)       ;arbitrarily large array (must be at least as long as file)
y=FLTARR(1000) 
S=FLTARR(2)          ;A small array to read a line 
ON_IOERROR,ers       ;Jump to statement ers when I/O error is detected 
n=0                  ;Create a counter 
WHILE n LT 1000 DO BEGIN 
    READF,1,S        ;Read a line of data 
    PRINT,S          ;Print the line 
    x[n]=S[0]        ;Store x 
    y[n]=S[1]        ;store y
    n=n+1            ;Increment the counter 
ENDWHILE             ;End of while loop 
ers: CLOSE,1         ;Jump to this statement when an end of file is detected 
x=x[0:n-1]           ;truncate arrays to file length
y=y[0:n-1]

;Save plot to postscript file
set_plot,'ps'
device,filename='/Users/drewnutter/gdrive/jmu/astrores/su13/csc/cschisto.ps',xsize=5.0,ysize=3.0,/inches,/encapsulated

;Draw plot
plot,x,y,xtitle='radius in arcseconds',ytitle='count',title='Histogram of CSC Crossmatches'

device,/close
set_plot,'x'

return
end