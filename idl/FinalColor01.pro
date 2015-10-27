PRO FinalColor01

compile_opt idl2
       
CLOSE,1
;calling the saved data file
        OPENR,1,'/Users/drewnutter/gdrive/jmu/astrores/su13/idl/FinalColor01.dat'

;number of rows/columns
        XDIM1=5
        ydim1=80

        VAL1=0
        VAL21=YDIM1-1

        ARRAY1=FLTARR(XDIM1,YDIM1)
 
        READF,1,ARRAY1

        ARRAY1=TRANSPOSE(ARRAY1)

;declaring variables
        r =ARRAY1[VAL1:VAL21,3]
        g = ARRAY1[val1:val21,2]
        u =ARRAY1[VAL1:VAL21,4]
        type = ARRAY1[val1:val21,1]

;defining quantities
g_r = g-r
u_r = u-r

;making use of the where function
u_r1 = u_r[where(type eq 1)]
u_r2 = u_r[where(type eq 2)]
u_r3 = u_r[where(type eq 3)]
u_r4 = u_r[where(type eq 4)]

;page setup
        xpage=8.5
        ypage=11.
        ysize=4.5
        xsize=5.75
        yoffset=(ypage-ysize)/2.
        xoffset=(xpage-xsize)/2.

;creating a postscript file to view the plot
        SET_PLOT,'PS'
        DEVICE,/INCHES,YSIZE=ysize,XSIZE=xsize,$
                YOFFSET=yoffset,XOFFSET=xoffset,$
               FILENAME='/Users/drewnutter/gdrive/jmu/astrores/su13/idl/FinalColor01Plot2.ps',/color

        TEK_COLOR

;having IDL print out the information to make it easy to set chart limits
print, [min(g_r), max(g_r)]
print, [min(u_r), max(u_r)]
print, [min(r), max(r)]
      
  !P.MULTI = 0

;making a personalized symbol (this one is a filled circle)
        A = FINDGEN(17) * (!PI*2/16.)
       USERSYM, COS(A), SIN(A),/FILL

;plotting data and setting up the chart
       PLOT,r,u_r1,PSYM=8,symsize=0.7,$
                THICK=4,XTHICK=3.75,YTHICK=3.75,CHARTHICK=3.5,CHARSIZE=1.35,$
                XRANGE=[9,25],XSTYLE=1.0,XMINOR=1,$
                YRANGE=[-1,4],YSTYLE=1.0,YMINOR=.5,$
                XTITLE="r value",$
                YTITLE="u-r"

;plotting additional data over top of the original set   
      OPLOT,r,u_r2,PSYM=7,symsize=0.7,color=4

      OPLOT,r,u_r3,PSYM=6,symsize=0.7,color=6

      OPlot,r,u_r4,PSYM=5,symsize=0.7,color=5

;setup of legend

;words of legend
xyouts,[22,22],[0.4,0.4], 'Ellipticals'
xyouts,[22,22],[0.2,0.2], 'Spirals'
xyouts,[22,22],[0.0,0.0], 'DK'
xyouts,[22,22],[-0.2,-0.2], 'Merger'

;symbols of the legend

;Ellipticals
x=findgen(2.0)/4.0 + 1.55
y=x*0 + 36.5
OPLOT, x, y, psym=8

;Spirals
x=findgen(2.0)/4.0 + 1.55
y=x*0 + 34.5
OPLOT, x, y, psym=7, color=4

;DK
x=findgen(2.0)/4.0 + 1.55
y=x*0 + 28.5
OPLOT, x, y, psym=6, color=6

;Merger
x=findgen(2.0)/4.0 + 1.55
y=x*0 + 26.5
OPLOT, x, y, psym=5, color=5

        !P.MULTI = 0
        DEVICE,/CLOSE 
        SET_PLOT,'X'
END
