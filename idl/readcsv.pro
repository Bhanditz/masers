pro readcsv

; Use DIALOG_PICKFILE to locate 'ScatterplotData.csv.' 
; and assign it a name ('testfile')
testfile = DIALOG_PICKFILE(FILTER='*.csv')

; Read the file in and assign it to the sed_data variable;
; assign the header information to variables for use later.
sed_data = READ_CSV(testfile, HEADER=SedHeader, $
   N_TABLE_HEADER=1, TABLE_HEADER=SedTableHeader)
 
; Display the field names found in the header.
PRINT, SedHeader
PRINT, SedTableHeader

; Show information on the file structure
;HELP, sed_data, /STRUCTURES

return
end