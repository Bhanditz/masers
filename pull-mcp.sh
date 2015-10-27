#!/bin/bash
# Run this script to output the current MCP table in a comma-delimited format.
# You can either run it in bash or execute it. To run in the shell use this command:
# $ sh pull-mcp.sh [options] [output file]
# For more info, try this:
# $ sh pull-mcp.sh --help

function arguments {
# Identify options that affect this script's behavior.
	for (( i=1; $i<=$#; i++ )); do
		iter=${!i}
		if [ "${iter:0:2}" == "--" ]; then
			if [ "$iter" == "--help" ]; then
				help=1
			elif [ "$iter" == "--spaces" ]; then
				noaskspaces=1
			elif [ "$iter" == "--nospaces" ]; then
				nospaces=1
				noaskspaces=1
			elif [ "$iter" == "--columns" ]; then
				i=$[i+1]		# Skip next argument for analysis (don't use as output filename)
				columns=${!i}	# Use next argument to identify chosen columns
				noaskcolumns=1
			else
				echo "$iter is not a valid option."
			fi
		elif [ "${iter:0:1}" == "-" ]; then
			string=${!i}
			for (( j=1; j<${#string}; j++ )); do
				opt=${string:$j:1}
				if [ "$opt" == "h" ]; then
					help=1
				elif [ "$opt" == "s" ]; then
					noaskspaces=1
				elif [ "$opt" == "n" ]; then
					nospaces=1
					noaskspaces=1
				elif [ "$opt" == "c" ]; then
					i=$[i+1]		# Skip next argument for analysis (don't use as output filename)
					columns="${!i}"	# Use next argument to identify chosen columns
					noaskcolumns=1
				else
					echo "$opt is not a valid option."
				fi
			done
		else
			numargs=$[$numargs+1]
			outfile=${!i}
			noaskoutfile=1
		fi
	done
	if [[ $numargs > 1 ]]; then
		echo "Error: You have entered too many arguments."
		help=1
		echo
	fi
}

function DownloadReformat {
	# This function downloads and pipes the html file into an awk script
	# that prints a CSV table based on the chosen columns.
	curl https://safe.nrao.edu/wiki/bin/view/Main/PrivateWaterMaserList?raw=on -Ss | awk -v outform="$columns" -v nospaces=$nospaces ' 
		BEGIN { 
			FS = "[|{}\\]\\[:]"
			OFS = ","
			tablecount = 0

			# parse outform into array: outform must be string of integers
			n = split(outform,outformarr,"")
			top[0]="count"
			top[1]="name"
			top[2]="ra"
			top[3]="dec"
			top[4]="vsys"
			top[5]="notes"
			top[6]="ref"
			for ( i=1; i<=n; i++ ){
				printf top[outformarr[i]]
				if ( i == n ){
					printf "\n"
				} else {
					printf ","
				}
			}
		}
		$0 == "---++ References" { good = 0 }
		good == 1 && tablecount == 1 && $0 != "" && $2 != " *Count*  " {
			column[1] = $8			# set name still with spaces
			gsub(/ /,"")			# remove all spaces
			column[0] = $2			# count
			imageurl = $6			# in case someone wants to use this
			if ( nospaces == 1 ){	# optionally name without spaces
				column[1] = $8
			}
			column[4] = $17			# vsys
			column[5] = $18			# notes
			column[6] = $19			# ref
	
			# convert ra and dec to degrees
			ra[1] = $11
			ra[2] = $12
			ra[3] = $13
			column[2] = 15*ra[1] + ra[2]/4 + ra[3]/240
			dec[1] = $14
			if ( dec[1] < 0 ){
				dec[2] = - $15
				dec[3] = - $16
			} else {
				dec[2] = $15
				dec[3] = $16
			}
			column[3] = dec[1] + dec[2]/60 + dec[3]/3600
	
			# for each element in outform, print appropriate column
			for ( i=1; i<=n; i++ ){
				printf column[outformarr[i]]
				if ( i == n ){
					printf "\n"
				} else {
					printf ","
				}
			}
		}
		$1 == "%TABLE" { good = 1; tablecount++ }
	'
}

function AllSurveyed {
	curl http://www.gb.nrao.edu/~jbraatz/H2O/sum_dir_sort.txt | awk '
		BEGIN {IGNORECASE = 1; OFS=","}
		$1 ~ /Source/{print "name,ra,dec,vsys"}
		$1 !~ /Source/{
    		gsub("C-","C")
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
}


arguments $@

if [[ $help == 1 ]]; then
	echo "NAME"
	echo -e "\tpull-mcp\n"
	echo "SYNOPSIS"
    echo -e "\t$ sh /path/to/pull-mcp.sh [options] [output file]"
    echo -e "\t\tOR (if executable)"
	echo -e "\t$ /path/to/pull-mcp.sh [options] [output file]"
	echo -e "\t\tOR (if installed)"
	echo -e "\t$ pull-mcp [options] [output file]\n"
	echo "DESCRIPTION"
	echo -e "\tpull-mcp is a shell script which downloads and converts the MCP"
	echo -e "\tlist of confirmed maser galaxies into CSV format and changes the"
	echo -e "\tRA and DEC to decimal degrees. It directly analyzes the HTML"
	echo -e "\tto determine the formatting of the table, which helps us avoid"
	echo -e "\tproblems that come with copy and pasting the plain text table"
    echo -e "\toutput displayed by a web browser. When saved to a file, this\n"
    echo -e "\tscript will also download the all surveyed list in 1234 format.\n"
    echo "USAGE"
    echo -e "\tpull-mcp can be run in shell or executed. For the following"
    echo -e "\tcommands, if you cd into the file directory, replace \"/path/to\""
    echo -e "\twith \".\". To run in shell use this command:"
    echo -e "\t\t$ shell /path/to/pull-mcp.sh"
    echo -e "\tTo execute it you must first run this command only once:"
    echo -e "\t\t# chmod 755 /path/to/pull-mcp.sh"
    echo -e "\tThen execute it with this command:"
    echo -e "\t\t$ /path/to/pull-mcp.sh"
	echo -e "\tTo install and run from anywhere, run these commands only once:"
	echo -e "\t\t# cp /path/to/pull-mcp.sh /usr/local/bin/pull-mcp"
	echo -e "\t\t# chmod 755 /usr/local/bin/pull-mcp"
    echo -e "\tThen execute it with this command:"
    echo -e "\t\t$ pull-mcp\n"
	echo "OPTIONS"
	echo -e "\t-c [selected columns], --columns [selected columns]"
	echo -e "\t\tUse this option to identify which columns you would like."
	echo -e "\t\tOrder, repetition, and any other characters will be ignored."
	echo -e "\t\teg. All is 0123456. num, RA, and DEC is 023, as in:"
	echo -e "\t\t$ sh pull-mcp.sh --columns 023"
	echo -e "\t\t0 = num"
	echo -e "\t\t1 = name"
	echo -e "\t\t2 = ra"
	echo -e "\t\t3 = dec"
	echo -e "\t\t4 = vsys"
	echo -e "\t\t5 = notes"
	echo -e "\t\t6 = reference"
	echo -e "\t-s, --spaces"
	echo -e "\t\tRetain spaces (eg. \"NGC 23\")."
	echo -e "\t\tThis will not affect the viability of the csv output."
	echo -e "\t-n, --nospaces"
	echo -e "\t\tRemove all spaces (eg. \"NGC 23\" turns into \"NGC23\")."
	echo -e "\t\tThis will not affect the viability of the csv output."
	echo -e "\t-h, --help"
	echo -e "\t\tDisplay this help file.\n"
else

	if [[ $noaskcolumns != 1 ]]; then
		echo "Please list which columns you would like according to their number with no spaces."
		echo "eg. All is 0123456. num, RA, and DEC is 023."
		echo "Order, repetition, and any other characters will be ignored."
		echo "0 = num"
		echo "1 = name"
		echo "2 = ra"
		echo "3 = dec"
		echo "4 = vsys"
		echo "5 = notes"
		echo "6 = reference"
		read columns
	fi

	if [[ $noaskspaces != 1 ]]; then
		echo "Would you like to retain spaces (eg. \"NGC 23\" vs \"NGC23\")?"
		echo "This will not affect the viability of the csv output,"
		printf "but it may affect future cross-matches done by name.\n[Y/n]: "
		read yn
		echo
		if [[ $yn == "" ]] || [[ $yn == "y" ]] || [[ $yn == "Y" ]] || [[ $yn == "yes" ]] || [[ $yn == "Yes" ]] || [[ $yn == "YES" ]]; then
			echo "Object names will retain spaces."
		else
			nospaces=1
			echo "Object names will not retain spaces."
		fi
	fi

	if [[ $noaskoutfile != 1 ]]; then
		echo
		echo
		printf "Would you like to output your tables to a file?\n[Y/n]: "
		read yn
		echo
		if [[ $yn == "" ]] || [[ $yn == "y" ]] || [[ $yn == "Y" ]] || [[ $yn == "yes" ]] || [[ $yn == "Yes" ]] || [[ $yn == "YES" ]]; then
			printf "Please enter your desired filename: "
			read outfile
		else
			nospaces=1
			echo "Masers will be printed to stdout."
		fi
	fi

	if [[ $outfile != "" ]]; then
		DownloadReformat > $outfile
		AllSurveyed > "all-"$outfile
		echo
		echo "The table has been output to $outfile."
		echo "The list of all surveyed galaxies has been output to all-$outfile."
	else
		DownloadReformat
	fi
fi
