pro datable

;Declare Variables
x=FLTARR(1000)       ;Arbitrarily large arrays (must be at least as long as file)
y=FLTARR(1000)
xh=FLTARR(1000) 
count=FLTARR(1000) 
prif=FLTARR(1000) 
perc=FLTARR(1000) 
S=FLTARR(2)          ;Small array to read a line 
ray=FLTARR(1000)

;First loop handles histogram
;locate file
print,'The first dialog box will ask for your histogram input.'
flatfile = DIALOG_PICKFILE(FILTER='*.dat', PATH='gdrive/jmu/astrores/su13/margins')
;Read the data file
OPENR,1,flatfile
ON_IOERROR,ers       ;Jump to statement ers when I/O error is detected (interrupt end loop)
n=0                  ;Create a counter 
WHILE n LT 1000 DO BEGIN 
    READF,1,S        ;Read a line of data 
    PRINT,S          ;Print the line 
    xh[n]=S[0]       ;Store histogram x-axis
    count[n]=S[1]    ;Store counts
    n=n+1            ;Increment the counter
ENDWHILE             ;End of while loop 
ers: CLOSE,1         ;Jump to this statement when an end of file is detected 
xh=xh[0:n-1]         ;truncate arrays to file length
count=count[0:n-1]

;Second Loop handles other calculations based on shorter table
print,'The second dialog box asks for shortened table input.'
shortfile = DIALOG_PICKFILE(FILTER='*.dat', PATH='gdrive/jmu/astrores/su13/margins')
print,'The third dialog box asks for rayleigh input.'
rayleigh = DIALOG_PICKFILE(FILTER='*.dat', PATH='gdrive/jmu/astrores/su13/margins')
OPENR,1,shortfile
OPENR,2,rayleigh
ON_IOERROR,ers2      ;Jump to statement ers2 when I/O error is detected (interrupt end loop)
n=0                  ;Create a counter 1
WHILE n LT 1000 DO BEGIN 
    READF,1,S        ;Read a line of data 
    READF,2,T
    PRINT,S          ;Print the line 
    ray[n]=T
    x[n]=S[0]        ;Store regular x-axis
    y[n]=S[1]        ;Store counts
    prif[n]=(x[n]/y[n])/(x[n-1]/y[n-1])   ;Percent Random Increase Factor
    print,prif[n]
    perc[0]=0.5
    perc[n]=perc[n-1]*prif[n]
    n=n+1            ;Increment the counter
ENDWHILE             ;End of while loop 
ers2: CLOSE,1        ;Jump to this statement when an end of file is detected 
x=x[0:n-1]           ;truncate arrays to file length
y=y[0:n-1]
prif=prif[0:n-1]
perc=perc[0:n-1]

;Save histogram to postscript file
print,'The third dialog box asks where to save the histogram.'
savefile = DIALOG_PICKFILE(FILTER='*.eps', PATH='gdrive/jmu/astrores/su13/margins')
set_plot,'ps'
device,filename=savefile,xsize=10.0,ysize=6.0,/inches,/encapsulated
TEK_COLOR

; Define labels as strings before reading.
ttl = ''           
httl = ''
xlab = ''
ylab = ''

;Accept input to define labels
;READ, ttl, PROMPT='Enter Catalog Name: '
;READ, xlab, PROMPT='Enter label for x-axis: '
;READ, ylab, PROMPT='Enter label for y-axis: '

;Draw histogram
httl='2XMMi Matches Within Each Successive Annulus'
xtot=x[n-1]
plot,xh,count,xtitle='angular separation in arcseconds',ytitle='matches',title=httl,XRANGE=[0,xtot],XSTYLE=1.0,XMINOR=1
OPLOT,x,ray, psym=0, THICK=2, linestyle=0
device,/close
set_plot,'x'

;Save factor plot to postscript file
print,'The fourth dialog box asks where to save the factor plot'
savefile = DIALOG_PICKFILE(FILTER='*.eps', PATH='gdrive/jmu/astrores/su13/margins')
set_plot,'ps'
device,filename=savefile,xsize=10.0,ysize=6.0,/inches,/encapsulated
;Draw factor plot                      
fttl='PIF for 2XMMi'
xtot=x[n-1]
plot,x,prif,xtitle='angular separation in arcseconds',ytitle='PIF',title=fttl,XRANGE=[0,xtot],XSTYLE=1.0,XMINOR=1
device,/close
set_plot,'x'

;Save percentage plot to postscript file
print,'The fifth dialog box asks where to save the percentage plot'
savefile = DIALOG_PICKFILE(FILTER='*.eps', PATH='gdrive/jmu/astrores/su13/margins')
set_plot,'ps'
device,filename=savefile,xsize=10.0,ysize=6.0,/inches,/encapsulated
;Draw percentage plot
pttl='% of Randoms per Annulus Scaled Arbitrarily'
xtot=x[n-1]
plot,x,perc,xtitle='angular separation in arcseconds',ytitle='percentage',title=pttl,XRANGE=[0,xtot],XSTYLE=1.0,XMINOR=1
device,/close
set_plot,'x'

return
end