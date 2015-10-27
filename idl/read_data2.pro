PRO READ_DATA2
OPENR,1,'/Users/drewnutter/gdrive/jmu/astrores/su13/CSC/cscmargin.dat'
H=FLTARR(2,10) ;A big array to hold the data 
S=FLTARR(2)      ;A small array to read a line 
ON_IOERROR,ers     ;Jump to statement ers when I/O error is detected 
n=0 ; Create a counter 
WHILE n LT 10 DO BEGIN 
    READF,1,S    ;Read a line of data 
    PRINT,S      ;Print the line 
    H[*,n]=S     ;Store it in H 
    n=n+1        ;Increment the counter 
ENDWHILE          ;End of while loop 
ers: CLOSE,1         ;Jump to this statement when an end of file is detected 
H=H[*,0:n-1]
END