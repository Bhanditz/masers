pro histtest

  data = fltarr(100)
  print,'Select the data.'
  data = DIALOG_PICKFILE(FILTER='*.dat', PATH='gdrive/jmu/astrores/su13/flux')
  hist = HISTOGRAM(data,BINSIZE=0.1,MAX=-9,MIN=-14)

return
end