	curl http://www.gb.nrao.edu/~jbraatz/H2O/sum_dir_sort.txt -Ss | awk '
		BEGIN {IGNORECASE = 1; OFS=","}
		$1 ~ /Source/{print "name,ra,dec,vsys"}
		$1 !~ /Source/{
    		gsub("C-","C")
    		gsub("RW Lyr","RW-Lyr")
		    if ($1 != A && $1 != B){
      			RA = ($2 + ($3 / 60) + ($4 / 3600))*15
				if ($5 > 0 || $5 == "+00"){
	    			DEC = $5 + ($6 / 60) + ($7 / 3600)
				}
				if ($5 < 0 || $5 == "-00"){
	    			DEC = $5 - ($6 / 60) - ($7 / 3600)
				}
				#if (D - DEC > 0.00277 || D - DEC < -0.00277){
					print $1,RA,DEC,$8
				#}
    		}
    		B = A
    		A = $1
    		D = DEC
		}'