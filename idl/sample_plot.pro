pro sample_plot

set_plot,'ps'
device,filename='/Users/drewnutter/gdrive/jmu/astrores/su13/idl/sample_plot.eps',xsize=5.0,ysize=3.0,/inches,/encapsulated

    y=[95,95,63,63,14,14,9,9,8,8,5,5]
    x=[0,1,1,2,2,3,3,4,4,5,5,6]
    plot,x,y,xtitle='radius in arcseconds',ytitle='count',title='Histogram of RASS BSC Crossmatches'

device,/close
set_plot,'x'

return
end