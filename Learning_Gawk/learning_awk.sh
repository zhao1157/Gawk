#! /usr/local/bin/bash

#=========214=========
#This is to demonstrate that variables in one program can not be accessed by another though
#they run in the same script.
cat<< eof > awk.sh
#! /usr/local/bin/awk -f

BEGIN {
	a = "loveme"
	print a
}
eof

chmod u+x awk.sh

./awk.sh

rm awk.sh

echo "Outside: " $a









##========213========
##This is to practice assigning values in the command line
#cat << eof > test.awk
##! /usr/local/bin/awk -f

#BEGIN {
	#printf "ARGC = %d, FILENAME = %s\n", ARGC, ARGV[1]
	#printf "%1\$s, %2\$s\n", NR, b	
#}
#eof

#chmod u+x test.awk

#./test.awk -v NR=2 -v b=3 test







##========212========
##This is to create a text file to be processed
#cat << eof > text 
#This is the first line 
#1. I love you

#3. There is a blank line.

#4. 2.343 23 'love' 2.343E-3
#eof



##=======211========
##This script is to practice escape sequences
#cat << eof > command_awk
##! /usr/local/bin/awk -f

#BEGIN {
	##In a string constant, if " is present, it has to be backslashed.
	#a = "^\"Hi\", this is my dir: /home/lianshuizhao$"
	#print a
	
	#if (a ~ /"/)
	#{
		##For index() function, the second argument has to be a string constant, not regexp.
		##while for match(), the second argument can be a regexp or a string constant.
		#printf "matched: %d, %d\n", index(a, "\""), match(a, /"/, arr)
		#for (i in arr)
		#{
			#printf "%d: %s\n", i, arr[i]
			
		#}
	#}
	
	#printf ">>>>\n"
	#if (a ~ /^\^"/)
		#printf "\^Found\n"
	#if (a ~ /\$/)
		#printf "\$Found\n"
	#printf "3backslashes: \\\ \n" 
	##to represent one backslash is to apply 3 backslashes.
	#a = "xxoo2\\\hi\\\xxoo"
	#printf "%s\n", a
	#if (a ~ /\\\/)
		#printf "found: %d\n", index(a, "\\\")
	#b = gensub(/\\\/, "F", "g", a)
	#printf "%s_%s\n", a, b
	##Here we combine index and substr functions together. index returns the index of the 
	##occurance of the sub-string, which is used by substr() to locate the substring we want.
	#printf "%s\n", substr(a, index(a, "\\\")-3)
	
	#printf ">>>>\n"
	#a = "hi\\\ my/ love/"
	#printf "%s is split into %d parts\n", a, split(a, arr, " ")
	#for (i in arr)
	#{
		#printf "%s_%s\n", i, arr[i]
		#if (arr[i] ~ /\\\/)
		#{
			#printf "\tFOUND: %s\n", "\\\"
		#}
		##Test [], which mean any one of the characters inlucded in []
		#if (b = match(arr[i], /[ieyh]/, brr))
		#{
			#printf "\t%d\n", b
		#}
	#}
	
	
#}



#eof

#chmod u+x command_awk

#./command_awk




##! /usr/local/bin/bash
##=======210========
##This script is to practice substr()
#cat << eof > command_awk
##! /usr/local/bin/gawk -f

#BEGIN {
	#a = "a sd a sd 23 a sd"
	
	#for (i = 1; i <= length(a); i++)
	#{
		#if (substr(a, i, 1) == "a")
		#{
			##printf "%d\n", i
			#a = gensub("a", "A", 1, a)
			#printf "%s\n", a
		#}
	#}
	
	#b = sprintf("%s\n", gensub("a", "A", "g", "a sd a sd 23 a sd"))
	#printf "%s\n", b
#}
#eof

#chmod u+x command_awk

#./command_awk




##! /usr/local/bin/bash
##========209========
##This script is to practice gensub() function.
#cat << eof > command_awk
##! /usr/local/bin/gawk -f

#BEGIN {
       #a = "abc defabc "
       #b = gensub(/abc/, "ABC", 2, a)
       #print b
       
       #printf ">>>>\n"
       #match(a, /abc/, arr)
       #for (i in arr)
       #{
		   #split(i, sep, SUBSEP)
		   #printf "%s_%s_%s\n", sep[1], sep[2], arr[i]
	   #}
	   
	   #printf ">>>>>\n"
	   #patsplit(a, arr, /(.+) (.+)/)
	   #for (i in arr)
	   #{
		   #printf "%s_%s\n", i, arr[i]
	   #}
 #}
 
#eof

#chmod u+x command_awk

#./command_awk

#gawk ' 
#BEGIN {
      #a = "abc def"
      #b = gensub(/(.+) (.+)/, "\\2 \\1", "g", a)
      #print b
#}
#'




##! /usr/local/bin/bash
##======208=======
##This script is to practice positional specifier
#cat << eof > command_awk
##! /usr/local/bin/gawk -f
#BEGIN {
#printf "%2\$s %1\$s %3\$s\n", 1, 2, 3
#}
#eof


#chmod u+x command_awk

#./command_awk




##! /usr/local/bin/bash
##=======207=======
##This script is to practice built-in functions asort and asorti for arrays
#cat << eof > command_awk
##! /usr/local/bin/gawk -f

#BEGIN {
	
	#me["DOB", "cday"] = "05"
	#me["DOB", "bmonth"] = "024"
	#me["DOB", "ayear"] = "1990"
	
	#for (ind in me)
	#{	name = ""
		#split(ind, sep, SUBSEP)
		#for (i in sep)
		#{
			#printf "%s_%s ", i, sep[i]
		#}
		##here \034 is the separator in the indices of array me.
		#printf "-> %s\n", me[sep[1]"\034"sep[2]]
	#}
	
	#printf ">>>>>asort\n"
	##here the orginal array is not modified, and des is a copy of me, and just like
	##asort(des)
	#printf "asort returns %d elements of array \"me\"\n", asort(me, des)
	#for (i in des)
	#{
		#printf "%s_%s\n", i, des[i]
		
	#}
	
	#printf ">>>>asorti\n"
	#delete des
	#printf "asorti returns %d elements of array \"me\"\n", asorti(me, des)
	#for (i in des)
	#{
		#des_sp[i][1] = ""	#without which, gawk complains about des_sp[i] not being an 
							##array.
		#split(des[i], des_sp[i], SUBSEP)
		#printf "%s_%s_%s\n", i, des_sp[i][1], des_sp[i][2]
		
	#}
	
	#printf ">>>>%s\n",  "\034"
#}
#eof

#chmod u+x command_awk

#./command_awk





##! /usr/local/bin/bash
##======206=======
#a=5
#b=$( echo "${a}%2"|bc -l )
#printf "%5.1f\n" $b

#echo $(( 5 % 3 ))

#line[5]=41

#if [ $((a % 2)) == 1 ]
#then
    #J_value=$( echo "${a}/2" | bc -l ) #NOT $((a/2)) which will do it in bash way, not bc.
    #printf "!!!%5.1f%5.1f\n" ${a} ${J_value} 
#fi




##! /usr/local/bin/bash
##=====205====
##This script is to test that variables are global without specifying as local in a function
#cat << eof > command_awk
##! /usr/bin/awk -f

#function mytes(i)
#{
	#i=2
	#j=3
#}

#BEGIN {
	#mytes() #Since no arguments are passed into the function, so all the arguments in the 
			##definition are local variables, otherwise global.
	#printf "i=%d, j=%d\n", i, j
	
#}

#eof

#chmod u+x command_awk

#./command_awk





##! /usr/local/bin/bash
##=====204=======
##This script is to practice indirect function calls
#cat << eof > temp 
#Biology_101 sum average data: 87.0 92.4 78.5 94.9
#Chemistry_305 sum average data: 75.2 98.3 94.7 88.2
#English_401 sum average data: 100.0 95.6 87.1 93.4
#eof

#cat << eof > command_awk
##! /usr/local/bin/awk -f
#{
	#for (i=1; i <= NF; i++)
	#{
		#if (\$i == "data:")
		#{
			#start=i+1
			#break 
		#}
	#}
	
	#printf "%s\n", \$1
	
	#for (i=2; \$i != "data:"; i++)
	#{
		#funct=\$i
		#printf "\t%s is %d\n", \$i, @funct(start, NF)
		
	#}
	
	
	
#}



##This is the section of definitions of functions
#function sum(start, end, 	sum_1, i)
#{
	#for (i=start; i <= end; i++)
	#{
		#sum_1 += \$i
	#}
	
	#return sum_1
#}

#function  average(start, end, 	sum, i)
#{
	#for (i=start; i <= end; i++)
	#{
		#sum += \$i
	#}
	
	#return sum/(end-start+1)
	
#}

#eof

#chmod u+x command_awk
#./command_awk temp 






##! /usr/local/bin/bash
##======203======
##This script is to practice return statement in a function
#cat << eof > temp 
#1 5 23 8 16
#44 3 5 2 8 26
#256 291 1396 2962 100
#-6 467 998 1101
#99385 11 0 225
#eof

#cat << eof > command_awk
##! /usr/bin/awk -f
#function find_max(arr, info, index_1, index_2_1, index_2_2, 		i, max, ind, sep)
#{
	#for (i in arr)
	#{
		#if (max < arr[i])
		#{
			#max = arr[i]
			#ind=i
		#}
	#}
	#split(ind, sep, SUBSEP)
	#info[index_1] = max
	#info[index_2_1] = sep[1]
	#info[index_2_2] = sep[2]
	
	##return info["max"]
#}

#{
	#for (i=1; i <= NF; i++)
	#{
		#line[NR, i] = \$i
	#}
#}

#END {
	
	#find_max(line, info_last, "max", "sep\034one", "sep\034two")
	#printf "%d %d %d\n", info_last["max"], info_last["sep", "one"], info_last["sep", "two"]
#}

#eof

#chmod u+x command_awk

#./command_awk temp 




##! /usr/local/bin/bash
##=====202======
##This script is to practice passing argument by value or by reference. For scalar, it's  
##value, for array it's reference.
#cat << eof > command_awk
##! /usr/bin/awk -f

#function mytest(scal, arr, inde)
#{
	#scal = "change_value"
	#arr[inde] = "change_value"
#}

#BEGIN {
	#scal = 23
	#arr["my", "first_name"] = "Lianshui"
	#mytest(scal, arr, "my\034first_name")
	
	#printf "%s %s \n", scal, arr["my", "first_name"]
#}
#eof

#chmod u+x command_awk

#./command_awk




##! /usr/local/bin/bash
##=====201=====
##This script is to practice recursive function
#cat << eof > command_awk
##! /usr/bin/awk -f

#function rev(a, 	i)
#{
	#i = 100
	
	#if (length(a) == 1)
		#return a
	#else if ( length(a) == "" )
		#return ""
	#else
		#return ( rev(substr(a, 2)) substr(a, 1, 1) )
	
	
#}

#function myprint(a)
#{
	#printf "%s\n", a
	#j=12
#}

#BEGIN {
	#a = "Don't panic!"
	#printf "The reverse of a is %s\n", rev(a)
	#printf "%d\n", i
	
	#b="L"
	#c="D"
	#printf "%d\n", j
	#myprint(b c)	#Here b c is concatenation of b and c, but bc is just one variable.
	#printf "%d\n", j
#}

#{
	#printf "before exiting: %d\n", j
	#if (\$0 == "")
		#exit
#}

#eof

#chmod u+x command_awk

#./command_awk




##! /usr/local/bin/bash
##======200=======
##This script is to practice user-defined function
#cat << eof > command_awk
##! /usr/bin/awk -f

#BEGIN{
	
	#a["first_name"] = "Lianshui"
	#a["last_name"]  = "Zhao"
	
	#pracice(a)
#}

##This section is all about the definitions of functions
#function pracice(arr)
#{
	#num_ele = length(arr)
	#for (i in arr)
	#{
		#printf "%s: %s, ", i, arr[i]
		#name = name arr[i] "_"
	#}
	#printf "\n%s.\n", name
#}
#eof

#chmod u+x command_awk

#./command_awk




##! /usr/local/bin/bash
##=====199=======
##This script is to practice user-defined functions
#cat << eof > command_awk
#BEGIN {
	#myprint()
#}

#{
	#myprint()
	#if (\$0 == "")
		#exit

#}

##Definitions of functions, which can be anywhere between rules in the awk program

#function myprint()
#{
	#printf "%s\n", "I love you!"
#}
#eof

#awk -f command_awk




##! /usr/local/bin/bash
##=====198======
##This script is to practice substr() function
#cat << eof > command_awk
#BEGIN {
	#a = "I love you!"
	#printf "With length of 4: %s\n", substr(a, 3, 4)
	#printf "Without specifying length: %s\n", substr(a, 3)
	#printf "With length of 0: %s\n", substr(a, 3, 0)
	
	#print ">>>>"
	#a = "I" "love" #without ,
	#printf "%s\n", a
	
	#a=0.00002132223
	#printf "%5.3G\n", a
	#printf "%9.3g\n", a
#}
#eof

#awk -f command_awk



##! /usr/local/bin/bash
##=====197======
##This script is to practice sprintf which is to return the value that printf would print
##with the same format without actually printing out.
#cat << eof > command_awk
##! /usr/bin/awk -f

#BEGIN {
	#a = sprintf("%.23f", 22/7)
	
	#printf "%s\n", a
#}

#{
	#print \$1
#}
#eof

#chmod u+x command_awk

#awk -f command_awk



##! /usr/local/bin/bash
##======196========
##This script is to parctice split funciton
#cat << eof > command_awk
##! /usr/bin/awk -f

#BEGIN {
	#a="1,2,3,4"
	##split() returns the number of parts the string is split into
	#num_split = split(a, arr, ",")
	#printf "\"%s\" is split into %d parts\n", a, num_split
	
	#for (i = 1; i <= num_split; i++)
	#{
		#printf "%d_%d, ", i, arr[i]
	#}
	#printf "\n"
#}
#eof

#chmod u+x command_awk

#./command_awk




##! /usr/local/bin/bash
##=======195======
##This script is to practice match function application
#cat << eof > temp
#match_1 I
#line2 I
#me I
#match_2 you
#I love you
#Do you understand?
#eof

#cat << eof > command_awk
##! /usr/bin/awk -f

#{
	#if (\$1 == "match_1")
	#{
		#regexp = \$2
		#next
	#}
	
	#where = match(\$0, regexp) #Index can be another option
	#if ( where != 0)
	#{
		#printf "%s is found at position %d in \"%s\"\n", regexp, where, \$0
	#}
	
	#if (\$1 == "match_2")
	#{
		#regexp = \$2
		#next
	#}	
#}


#eof

#chmod u+x command_awk

#./command_awk temp 






##! /usr/local/bin/bash
##======194========
##This script is to practice index and match functions
#cat << eof > command_awk
##! /usr/bin/awk -f

#BEGIN {
	#a="I love you!"
	
	#printf "%d\n", index(a, "o")
	#printf "%d\n", match(a, "o")
#}

#eof

#chmod u+x command_awk

#./command_awk




##! /usr/local/bin/bash
##======193======
##This script is to practice string-manipulation functions
#cat << eof > command_awk
##! /usr/bin/awk -f
#BEGIN{
	#arr["first_name"] = "Sethteee"
	#arr["last_name"] = "Zhao"
	
	##printf "%d\n", asort(arr)
	
	##gsub() makes changes to the original copy.
	#printf "%d\n", gsub(/e/, "E", arr["first_name"])
	#printf "%d\n", gsub("t", "T", arr["first_name"])
	#printf "%s\n", arr["first_name"]
	
	##sub() prints modifies the first occurance of the pattern and returns 0 (not matched)
	##or 1 (matched)
	#x="h"
	#printf "%d\n", sub(x, toupper(x), arr["last_name"])
	#printf "%s\n", arr["last_name"]
	
	##index() returns the position of the first occurance of pattern in the target.
	#x="ao"
	#printf "%d\n", index(arr["last_name"], x)
#}
#eof

#chmod u+x command_awk

#./command_awk





##! /usr/local/bin/bash
##======192========
##This script is to practice built-in atan funciton in awk
#cat << eof > command_awk
##! /usr/local/bin/awk -f
#BEGIN {
	#a=4*atan2(1,1)
	#printf "%.53f\n", a
	#printf ">>>>\n"
	#a=rand()
	#b=rand()
	#c=10 * rand()
	#printf "%s %s %.18f\n", a, b, c
	#printf "<<<<\n"
	
	#printf "*****\n"
	#printf "%.21f\n", sqrt(14)
#}
#eof

#chmod u+x command_awk

#./command_awk




##! /usr/local/bin/bash
##=====191=====
##This script is to practice split function
#cat << eof > command_awk
##! /usr/local/bin/awk -f
#BEGIN {
	#arr["s"][1]=""
	##split ("I love You!", arr["s"], SUBSEP) #This will result in one element
	#split ("I love you!", arr["s"]) #This assumes space as the separator
	#for (ind in arr["s"])
	#{
		#printf "%s %s\n", ind, arr["s"][ind]
	#}	
#}
#eof

#chmod u+x command_awk

#./command_awk





##! /usr/local/bin/bash
##=====190========
##This script is to practice arrays of arrays
#cat << eof > command_awk
##! /usr/local/bin/awk -f

#BEGIN {
	#for (i=1; i<=4; i++)
	#{
		#for (j=1; j<=2; j++)
		#{
			#a[i][j] = i*j
		#}	
	#}
	
	#printf "%d %d %d\n", a[3][2], length(a[3]), length(a)
	
	#for (k in a)
		#printf "The index of a is %s\n", k
	#for (k in a[3])
		#printf "The index of a[3] is %s\n", k
	###The following is wrong as it says attempting to use a scalar value as array.
	##for (k in a[3][2])
		##printf "The index of a[3][2] is %s\n", k
	
	#delete a[3][2]
	#a[3][2]["Seth", "Zhao"] = "Delete the original scalar and then reassign it as an array"
	#print a[3][2]["Seth", "Zhao"]
	#for (i in a[3][2])
	#{
		#split(i, sep, SUBSEP)
		#for (j in sep)
		#{
			##Concatenate to get the full name
			#name = name sep[j] " "
		#}
		#printf "The name is %s\n", name 
	#}
	
	#printf ">>>>>>\n"
	#for (i in a)
	#{
		#for (j in a[i])
		#{
			#if (! isarray(a[i][j]))
				#printf "%d %d: %d\n", i, j, a[i][j]
			#else
				#printf "%d %d is an array\n", i, j
		#}
	#}
	
	#printf "<<<<<<\n"
#}
#eof

#chmod u+x command_awk

#./command_awk




##! /usr/local/bin/bash
##=======189========
##This script is to practice associative arrays
#cat << eof > temp 
#I love you 
#Do you Know ?
#sd d
#eof

#cat << eof > command_awk
##! /usr/local/bin/gawk -f

#{
	#if (NF != 0)
	#{
		#for (i=1; i <= NF; i++)
		#{
			#line[FNR, i] = \$i
		#}
	#}
#}

#END {
	##This shows that the order in which the elements are printed is not the same as they
	##are read. 
	#for (inde in line)
	#{
		#printf "%s ", line[inde]
	#}
	#printf "\n"
	
	##So we have to use the following one to force them in a certain order.
	#for (i=1; i <= FNR; i++)
	#{
		#for (j=1; j <= 4; j++)
		#{
			#printf "%s ", line[i, j]
		#}	
	#}
#}
#eof

#chmod u+x command_awk

#./command_awk temp 




##! /usr/local/bin/bash
##=====188=======
##This script is to practice multi-dimensional array
#cat << eof > temp 
#firt_name last_name 100
#Lianshui Zhao 90
#Seth Zhao 94
#Muzi Li	99
#Perry Teng 200
#eof

#cat << eof > command_awk
##! /usr/local/bin/gawk -f

#{
	#score[\$1, \$2] = \$3
#}

#END {
	#printf "Length is %d\n", length(score)
	
	#for (inde in score)
	#{
		##sep will be an arrary starting an element of index 1.
		#split(inde, sep, SUBSEP)
		#printf "Length is %d\n", length(sep)
		#for (i in sep)
		#{
			#printf "%s %s ", i, sep[i]
		#}
		#printf "%s", score[sep[1], sep[2]]
		#printf "\n"
	#}
	
	#if (("Seth", "Zhao") in score)
	#{
		#printf "Seth Zhao got a score of %d\n", score["Seth", "Zhao"]
	#}
	
#}
#eof

#chmod u+x command_awk

#./command_awk temp 



##! /usr/local/bin/bash
##=====187======
##This script is to show that associative array is very useful
#cat << eof > command_awk
##! /usr/local/bin/gawk -f
#BEGIN {
	#color["Seth"] = "red"
	#color["Lucy"] = "blue"
	#color["TG"]   = "black"
	#color["Anil"] = "white"
	
	#for (name in color)
	#{
		#printf "%s loves %s.\n", name, color[name]
	#}
	##any string can be the index of an associative array.
	#a["2- x"] = 2
	#print a["2- x"]
#}
#eof

#chmod u+x command_awk

#./command_awk



##! /usr/local/bin/bash
##======186=======
##This script is to do a simple application using associative array
#cat << eof > temp 
#2 Do you still remember me?
#9 I would love to marry you!
#1 Hi my love.
#3 Yes, I do.
#eof

#cat << eof > command_awk
##! /usr/local/bin/gawk -f
#{
	#if (max < \$1)
	#{
		#max = \$1
	#}
	#line[\$1] = \$0
#}

#END {
	##for (i = 1; i <= max; i++)
	##{
		##if (i in line)
		##{
			##printf "%s\n", line[i]
		##}
	##}
	#print ">>>"
	##Use a special for-statement for arrays
	#for (i in line)
	#{
		#print line[i]
	#}
	#print "<<<"
	#printf "%f\n", (32 in line)
#}
#eof

#chmod u+x command_awk

#./command_awk temp 



##! /usr/local/bin/bash
##========185=========
##This script is to practice arrays in awk
#cat << eof > command_awk
##! /usr/local/bin/awk -f
##BEGIN pattern must have an action block.
#BEGIN {
	#x = "aaa"
	#arr["a"]="a"
	#arr["b"]="b"
	#arr["c"]="j"
	#arr[x]=123
	#arr["aaa"] = "love"
	#printf "%s\n", arr["aaa"]
	
	#if ( x in arr ) #This returns a boolean value, true/false, different from for loop in
					##shell
		#printf "in, %s %s\n", x, arr[x]
		
	#delete arr
	##Even though arr array is deleted, it's still an array-type, so can not be assigned 
	##a scalar value, like arr=2 (wrong)
	
#}

#eof

#chmod u+x command_awk

#./command_awk



##! /bin/bash
#======184=======
#which bash
#a=3200
#b=$((a/100))
#printf "%.1f\n" $b

#a=3
#printf "%5.1f\n" $((a/2))




##! /usr/local/bin/bash
##=====183=======
##This script is to practice using ARGV, ARGC
#cat << eof > command_awk
##! /usr/local/bin/awk -f

#BEGIN {
	#print x y
	#printf "ARGC=%d\n", ARGC
	#for (i=0; i < ARGC; i++)
	#{
		#printf "ARGV[%d]=%s\n", i, ARGV[i]
	#}
#}
#eof

#chmod u+x command_awk
##when more than one variable is needed to pass to awk, use as many -v as the number of 
##variable.
#./command_awk -v x=3 -v y=4 temp1 temp2




##! /usr/local/bin/bash
##=======182======
##This script is to practice changing NR
#cat << eof > temp 
#1
#2 sdf
#3
#4
#eof

#cat << eof > command_awk
##! /usr/local/bin/awk -f
#NR == 2 {
	#NR = 17	#NR is changed so will the subsequent NRs.
#}

#{ 
	#printf "%i\n", NR
#}
#eof

#chmod u+x command_awk

#./command_awk temp





##! /usr/local/bin/bash
##======181=======
##This script is to practice tracking FILENAME CHANGING
#cat << eof > command_awk
##! /usr/local/bin/awk -f
#BEGIN {
	#fn = "test_file_name"	
	#nr = 1
#}

#FILENAME != fn {
	#printf "%s has %d records\n", fn, NR-nr
	#nr = NR
	#fn = FILENAME
#}

#END {
	#printf "%s has %d records\n", fn, NR-nr+1
#}
#eof

#chmod u+x command_awk

#./command_awk temp1 temp2 temp1 temp2 temp2 temp1




##! /usr/local/bin/bash
##=====180======
##This script is to practice exit statement
#cat << eof > temp 
#one
#two
#three
#four
#eof

#cat << eof > command_awk
##! /usr/local/bin/awk -f
#BEGIN {
	#printf "This is BEGIN\n"
	#exit	#Exit in BEGIN stops executing the body, but go to END pattern
	#printf "hi"
#}
	
#{
	#print 
	##exit 	#Stop executing right away, and go to END.
#}

#END {
	##exit	#Stop executing immediately.
	#printf "This is END\n"
	
#}

#eof

#chmod u+x command_awk

#./command_awk temp 



##! /usr/local/bin/bash
##======179========
##This script is to practice nextfile statement
#cat << eof > temp1
#1
#2
#3 OFF
#4
#eof

#cat << eof > temp2
#5 off
#6 OFF
#7
#eof

#cat << eof > command_awk
##! /usr/local/bin/awk -f
##FNR == 3 
##NF == 2 
#toupper(\$2) == "OFF" {
	#printf "Changing from file %s\n", FILENAME
	#nextfile
	
#}

#{print}
#eof

#chmod u+x command_awk

#./command_awk temp1 temp2	




##! /usr/local/bin/bash
##======178======
##Again this is to practice next statement
#cat << eof > temp 
#1
#2
#3 4
#end
#eof

#cat << eof > command_awk
##! /usr/local/bin/awk -f
#NF != 1 {
	#printf ">>> NF != 1\n"
	#next
#}

#{print}
#eof

#chmod u+x command_awk

#./command_awk temp




##! /usr/local/bin/bash
##======177=====
##This script is to practice next statement
#cat << eof >temp 
#1 2
#3 x
#4
#5
#eof

#cat << eof > command_awk
##! /usr/local/bin/awk -f

#BEGIN {line=1}


#\$1 == "3"#means print the whole record

##\$2 ~ /x/	#regexp is associated with ~ and !~
#\$2 == "x" { #You can NOT move { to the next line, otherwise this pattern will print the
			 ##whole record and the next action will be for every record.
	#print line
	#line ++
#}

#eof

#chmod u+x command_awk

#./command_awk temp 




##! /usr/local/bin/bash
##======176=======
##This script is to practice control flow statements
#cat << eof > temp 
#1 2
#2 4
#3 6
#eof

#cat << eof > command_awk
##! /usr/local/bin/awk -f

#BEGIN {
	#line=1
	#x=11
	##This is to test the if-else statement
	#if (x > 0) printf ">0\n"
	#else if (x == 0) printf "=0\n"
	#else printf "<0\n"
	
	#printf "%i\n", x/2
#}

#{
	###This is to test the while statement
	##while (\$1 >= 3)
	##{
		##printf ">> %s\n", \$1
		##\$1 = 0
	##}
	
	###This is to test do-while statement 
	##printf "line: %s\n", line++
	##do
	##{
		##printf "*** %s\n", x--
	##} while(x > 8)
	
	##switch (x)
	##{
		##case "11": 
			##printf "11\n"
			##--x
			##break
		##case 10:
			##printf "10\n"
			##x--
			##break 
		##case 9: 
			##printf "9\n"
			##x--
			##break
		##default:
			##printf "default\n"
			##break 
	##}
	
	###This is to practice break from a for loop, does not contain an explicit condition, but
	###one with break statement and also continue statement, which directs the flow to the 
	###next iteration
	##for (i=1; ; i++)
	##{
		##if (i == 3)
			##continue	
			
		##if (i <= 9)
		##{
			##printf "%s\n", i
		##}
		##else
			##break
	##}
	
#}

#eof

#chmod u+x command_awk

#./command_awk temp 





##! /usr/local/bin/bash
##=====175======
##This script is to pracice assigning the value of a variable in shell to a variable in awk
#var="My dad is in hospital"

#cat << eof > temp 
#hi
#sd
#d
#eof

#cat << eof > command_awk
##! /usr/local/bin/awk -f

#BEGIN {
	#printf "%s\n", var_awk
#}

#{print var_awk_body, \$0}
#eof

#chmod u+x command_awk

#./command_awk -v var_awk=0d var_awk_body=i temp  #var_awk="use double quotes in case there are spaces"





##! /usr/local/bin/bash
##=======174========
##Again this is to practice range pattern
#cat << eof > temp
#0 0
#1
#2
#-1 -1

#0 0
#3
#4
#-1 -1
#eof

#cat << eof > command_awk
##! /usr/local/bin/awk -f

##{
	##printf "%s\n", \$1\$2
##}

##\$1\$2 == "00", \$1\$2 == "-1-1"

#\$1\$2 == "00" || \$1\$2 == "-1-1" {
	##Flag is used to control which part is to be printed
	#interested = ! interested 
	#next	#go to the next record
#}

#interested

#eof

#chmod u+x command_awk

#./command_awk temp 




##! /usr/local/bin/bash
##=======173=======
##This is to practice range pattern
#cat << eof > temp 
#on
#1
#off
#..
#on
#2
#off
#..
#on
#3
#off
#eof

#cat << eof > command_awk
##! /usr/local/bin/awk -f
#BEGIN {
	#line=1
#}


###line++
##{
	##line++
##}

###/on/, /off/

##line == 4

##/on/, /on/
##{
	##next
##}

##The following lines demonstrate that awk can be programmed to print records of certain
##lines.
#line >=2 && line <= 5 {
	#print 
#}

#{
	#line++
#}

#eof

#chmod u+x command_awk

#./command_awk temp




##! /usr/local/bin/bash
##=======172======
##This script is to test regexp pattern in awk
#cat << eof > temp 
#1
#2 1
#3 2 1
#nothing
#eof

#cat << eof > command_awk
##! /usr/local/bin/awk -f
##A non-empty expression is always true, so awk prints the record.
#1	#means true
#"f"	#means true

##However a regexp is different from single expression
#/2/	#means \$0 ~ /2/

#\$0 == 1 {
	#printf ">> %s\n", \$0
#}

##\$0 ~ 1
#/1/ {
	#printf "<< %s\n", \$0
#}

##\$0 ~ 1 && \$0 ~ 2 && \$0 ~ 3 
#/1/ && /2/ && /3/ {
	#printf "1, 2, 3 are matched\n"
#}

##\$0 ~ 2 || \$0 ~ 3 
#/2/ || /3/ {
	#printf "***2 or 3 is matched.\n"
#}

#!/1/ {
	#printf "This is bullshit: %s\n", \$0
#}

#eof

#chmod u+x command_awk

#./command_awk temp 






##! /usr/local/bin/bash
##=======171=======
##This script is to practice alteration operator
#cat << eof > temp 
#s
#1 2 
#fg
#as
#eof

#cat << eof > command_awk
##! /usr/local/bin/awk -f

#/s|1/ {
	#print
#}

#eof

#chmod u+x command_awk

#./command_awk temp 




##! /usr/local/bin/bash
##======170========
##This script is to test $++i in awk
#cat << eof > temp 
#1 2 3 4
#5 6 7 8
#eof

#cat << eof > command_awk
##! /usr/local/bin/awk -f
#BEGIN {
	#i = 2
#}

#{
	#printf "%s %s\n",\$++i, i
	#printf "%s\n", \$3^2	
#}

#eof

#chmod u+x command_awk
#./command_awk temp 




##! /usr/local/bin/bash
##========169=======
##This script is to demonstrate reading and writing in awk
##In awk, the file is automatically read and can be written to by redirection
#cat << eof > temp
#16
#25
#36
#49
#25
#eof

#cat << eof > command_awk
##! /usr/local/bin/awk -f
#BEGIN {
	#printf "Reading and writing now ~\n"
#}

#{
	#printf "%4d\n", sqrt(\$1) > "output"
#}

#END {
	#printf "END<<<\n"
#}
#eof

#chmod u+x command_awk

#./command_awk temp 

#cat output






##! /usr/local/bin/bash
##========168=======
##This script is to test ! condition || condition, which turns out to be that ! and && are
##of the same precedence (both are boolean)
#cat << eof > command_awk
##! /usr/local/bin/awk -f
#BEGIN {
	#if ( ! 0 && 0)
	#{
		#printf "xx\n"
	#}

#}
#eof

#chmod u+x command_awk
#./command_awk




##! /usr/local/bin/bash
##=======167========
##This script is to practice applying more than one rule to each record. In fact we can 
##combine different rules in one pair of braces.
#cat << eof > temp 
#line0
#start
#1
#2 
#3
#end
#beyond
#eof

#cat << eof > command_awk
##! /usr/local/bin/awk -f
#BEGIN {
	#interested = 0
	##Once "start" is read, we can just read all the following records, and end with the 
	##record "end"
#}

##The following rules can be represented by if-else statement.

#\$0 == "start" {
	#interested = 1
	#next
#}

#interested && \$0 != "end" {
	#print 
#}

#\$0 == "end" {
	#interested = 0
#}

#eof

#chmod u+x command_awk
#./command_awk temp 




##! /usr/local/bin/bash
##======166========
##This script is to practice boolean expression
#cat << eof > command_awk
##! /usr/local/bin/awk -f
##for each record, we can apply each rule which is included in braces separately.
#{
	#if (\$0 ~ 1)
		#print 
	
#}

#{
	#if (\$0 ~ 2)
		#print 
	
#}

#eof

#chmod u+x command_awk
#./command_awk






##! /usr/local/bin/bash
##======165======
##This script is to practice the comparison of regular expression
#cat << eof > temp 
#1 abcd

#3 efgh

#eof

#cat << eof > command_awk
##! /usr/local/bin/awk -f
##usually we can initialize some variables in the BEGIN rule.
#BEGIN {
	#printf "HEADER\n"
	#line=0
	##This is a variable which represents character a.
	#text = "a"
#}
##This block is applied to each record, which is by default recognized by a new line \n
#{
	#++ line
	#if (\$1 == 1 || \$1 == 3)
	#{
		#printf "%d. Line: %s\n", \$1, line
	#}
	
	#if (\$2 ~ text)	#Here text is a variable which contains character a, so no double quotes
					##are needed.
	#{
		#printf "Line %d contains %s\n", line, \$2
	#}	
	#if (\$0 == "")
	##If more than one action is needed in a block, use braces to include them.
		#printf "This is empty line %d\n", line
		#printf "<<<<<\n"	
#}

#eof

#chmod u+x command_awk

#./command_awk temp 



##! /usr/local/bin/bash
##=======164=======
##This scirpt is to practice true/false
##FALSE: empty string or 0 in numeric type.
#cat << eof > command_awk
##! /usr/local/bin/awk -f
#BEGIN {
	#if (! "")
		#printf "\"\" is false\n"
	#if (! 0)
		#printf "0 is false\n"
	#if ("0")
		#printf "\"0\" is true\n"
	#if (" ")
		#print "\" \" is true\n"

	#print (! "2")
#}
#eof

#chmod u+x command_awk

#./command_awk



##! /usr/local/bin/bash
##===========163=======
##This script is to practice increment and decrement of a field
#cat << eof > command_awk
##! /usr/local/bin/awk -f
#BEGIN {
	#printf "%s\n", "HEADER"
#}

#{
	##pre-increment or -decrement results in the same value of the expression and the
	##variable, while post-increment or -decreemnt results in an old value of the variable
	##for the expression, and new value for the variable itself.
	##NO parenthesis is needed.
	#print \$1, ++\$1, --\$1, \$1++, \$1--, \$1
	#i=1
	#print \$(i++), \$(i--), \$i
#}

#eof

#chmod u+x command_awk

#./command_awk temp 




##!/usr/local/bin/bash
##=======162=======
##This script is to practice string concatenation.
#cat << eof > command_awk
##! /usr/local/bin/awk -f
       
#BEGIN {
	#a = "hi"
	#b = a " my"
	#c = b " love"
	#d = c "!"
	#x=y=z=7
	#printf "%s\n%s\n%s\n%s\n", a, b, c, d
	#print x, y, z
#}
#eof

#chmod u+x command_awk
#./command_awk




##! /usr/local/bin/bash
##=======161=======
##This script is to practice some simple arithmetic operations using awk language

###First input data
##rm temp 
##for i in $(seq 1 3)
##do
	##read -p "Enter name and 3 test scores: " -a line
	##printf "%-6s%3s%3s%3s\n" ${line[*]} >> temp 


##done 

#cat << eof > command_awk
##! /usr/local/bin/awk -f
##BEGIN {
	##format_head="%-6s %3s %3s %3s %6s\n"
	##format_data="%-6s %3s %3s %3s %6.2s\n"
	##printf format_head, "NAME", "S_1", "S_2", "S_3", "AVE"
##}

##{
	###$5 = (\$2+\$3+\$4)/3
	##\$5 = (\$2+\$3+\$4)/3
	##printf format_data, \$1, \$2, \$3, \$4, \$5
##}
#{
	#printf "%s %s\n", 2**3, 3^3
#}
#eof

#chmod u+x command_awk

#./command_awk temp 





##! /usr/local/bin/bash
##=======160=======
##This script is to practice assigning values to variables in the command line
##By testing, it looks like -v only work for the variables appearing in the BEGIN block, not
##affact the variables only appearing in the BODy and END.
#cat << eof > command_awk
##! /usr/local/bin/awk -f
#BEGIN {
	#printf "BEGIN: %d_%d\n", a, b
	#printf "BEGIN: x=%s, y=%d, y=%s\n", x, y, y
	
#}
#{
	#printf "BODY: x=%s, y=%d, y=%s\n", x, y, y
	#printf "%d_%d\n", a, b
	#print \$a, \$b > out_file
#}

#END{
	
	#printf "END: x=%s, y=%d, y=%s\n", x, y, y
	
#}

#eof

#chmod u+x command_awk

##This feature can be very useful potentially when doing analysis.
##This is like $1 and $2 etc in bash.
#./command_awk x=\'sd y=23\' a=1 b=2 out_file="output" temp a=2 b=1 out_file="output2" temp





##! /usr/local/bin/bash
##=======159======
##This script is to practice pipping in the awk executable file
#cat << eof > command_awk
##! /usr/local/bin/awk -f
#{
	##printf "No pipping\n"
	#printf "%s\n", \$0 > "temp1"
	#command = "sort -r > temp2"
	#print \$0 | command
	#x = "hi""lo"
	#y = x"_y"
	#print y
#}
#eof

#chmod u+x command_awk
#./command_awk temp 



##! /usr/local/bin/bash
##=======158========
##This script is to practice redirection in awk
#rm temp 

#for i in $(seq 1 4)
#do
	#printf "%-5d%5d\n" $i $((i*i)) >> temp

#done

#cat <<eof > command_awk
##! /usr/local/bin/awk -f
#{
	#printf "%-5d\n", \$1 > "temp1"
	#printf "%5d\n", \$2 > "temp2"
#}
#eof

#chmod u+x command_awk
#./command_awk temp



##! /usr/local/bin/bash
##=======157=======
##This script is to practice printf with format specifiers, %, modifiers, format-control 
##letter
#cat << eof > command_awk
##! /usr/bin/awk -f
#BEGIN {
	##Be aware that format string and all arguments are separated by commas.
	#printf "%c %c\n", 65, 84
	#printf "%4i\n", 9.23
	##a negative sign in front of the modifiers makes sure that the iterm aligns to the left
	#printf "%-5.1f\n", 9.23
	##for scientific notation, the width includes the whole representation.
	#printf "%8.1e\n", 9.23
	#printf "%-9.1EEND\n", 9.23
	#printf "\\\%s\n", "hi"
	#printf "%+8.2f\n", 9.23
	#printf "%08.2f\n", 9.23
	#w=5
	#p=3
	#printf "%" w "." p "s\n", "hellolove"
	
	##When a format string is used several times, we can put it into a variable, and use it
	##whenever necessary.
	#format = "%-8s %8s\n"
	#printf format, "column_1", "column_2"
	#printf format, ">>", "<<"
	#for (i = 1; i <= 5; i++)
	#{
		#printf format, i, i+1
	#}
#}
#eof

#chmod u+x command_awk

#./command_awk


##! /usr/local/bin/bash
##=======156=======
##This script is to practice add new line and some texts to the ORS.
#cat << eof > command_awk
##! /usr/bin/awk -f

#BEGIN {
	#print "HEADER"
	#print ">>>>>"
	#ORS = "\nEND"
#}

#{
	#for (i = 1; i <= 3; i++)
	#{
		#print i
	#}	
#}

#END {
	#print "<<<<<"	
#}
#eof

#chmod u+x command_awk

#./command_awk




#! /usr/local/bin/bash
##==========155========
##Th is to test the expression used in OFMT
#cat << eof > temp
#1
#2
#3
#4
#5
#eof

#cat << eof > command_awk
##! /usr/bin/awk -f

#BEGIN {
	#print "OFMT for 1.2234234234"
#}

#{
	###Note \$0 is a strig constant, so don't put it inside the double quotes.
	###Set the width of the output as 7, and the digits of the numeric number to be a 
	###variable
	##OFMT = "%7." \$0 "f"
	#OFMT = "%7.0f"
	#print 1.2234234234
#}

#END {
	#print "<<<<<"	
#}
#eof

#chmod u+x command_awk

#./command_awk temp 




##! /usr/local/bin/bash
##=======154=======
##This script is to practice empty line as the record separator
#cat << eof > command_awk
##! /usr/bin/awk -f

#BEGIN {
	#print "Header"
	#print ">>>>>>"
	### \
	##ORS="\\\"	
	###One empty line
	#ORS="\n\n"	
#}

#{
	##For loop, we can put all the commands in the braces so that they are in the loop
	##c-style or c++-style?
	#for (i=1; i <=3; i++)
	#{
		#print i	
		#print "..."
	#}
#}

#END {
	#print "<<<<<<<"
#}

#eof

#chmod u+x command_awk

#./command_awk temp > output 

#awk 'BEGIN {RS="\n\n"; ORS="\n\n"} {print}' output 




##! /usr/local/bin/bash
##======153======
##This script is to practice some common functionalities of print
#cat << eof > temp
#Mon	1
#Tue 2
#Wed 3
#Thu 4
#eof

#cat << eof > command_awk
##! /usr/bin/awk -f

##Let's make a header
#BEGIN {
	##This sets the output file separator to be 3 spaces
	#OFS="   "
	##This sets teh output record separator as ;
	#ORS=";"
	#print "Date   Time"
	#print "----   ----"
#}

#{
	#print \$1, \$2
#}

#END{
	#print "<<<<<<"	
#}

#eof

#chmod u+x command_awk

#./command_awk temp > output 

#awk 'BEGIN {print "WITH RS >>"; RS=";"}{print $0}' output 
##Awk by default take \n as the record separator, and " " as the field separator.
#awk 'BEGIN {print "WITHOUT RS >>";}{print $0}' output



##! /usr/local/bin/bash
##======152=======
##This script is to demonstrate that without double quotes, a string is taken as an 
##expression.
#cat << eof > command_awk
##! /usr/bin/awk -f
#BEGIN {hi="HI MY LOVE!"; print hi, "hi"}	#The comma between hi and "hi" creates a FS.
#eof

#chmod u+x command_awk
#./command_awk




##! /usr/local/bin/bash
##======151======
##This script is to practice multiple-line record
#cat << eof > temp
#1 sd sd

#2

#3
#eof

#cat << eof > command_awk
##! /usr/bin/awk -f
#BEGIN {
	#print ">>>>>>>"
	#RS=""
#}

#{
	#print 
#}

#END {
	#print NR
	#print "<<<<<<"
#}
#eof

#chmod u+x command_awk

#./command_awk temp 




##! /usr/local/bin/bash
##======150========
##This script is to test the case where RS is the same as the FS.
#cat << eof > temp
#sdsfsd sdf s
#eof

#cat << eof > command_awk
##! /usr/bin/awk -f
#BEGIN {
	#FS="\n"
	#OFS="^"
#}

#{
	#print NF, "==", \$1, "=="
#}
#eof

#chmod u+x command_awk
#./command_awk temp



##! /usr/local/bin/bash
##=======149=======
##This script is to demonstrate that more than one space in a row does not make an empty 
##field, while for other FSs, they do.
#cat << eof > temp 
#1,,   	 2
#eof

#cat << eof > command_awk
##! /usr/bin/awk -f
#BEGIN{
	#print ">>>>>>>>"

#}

#{
	#OFS=","
	##\$1=\$1
	#\$2="X"
	#print NF, NF, \$0
#}

#END{print "<<<<<<<<<"}
#eof

#chmod u+x command_awk

#./command_awk temp




##! /usr/local/bin/bash
##======148======
##So far we can easily see the 3 main parts in the awk program. One is the BEGIN pattern, 
##which is executed at before any input is processed, and the second part is the rules 
##applied to each record, and last part is the END pattern which is executed after all the
##input records are processed.
#cat << eof > temp 
#1xhello 2xlove 3
#4 5 6 
#eof

#cat << eof > command_awk
##! /usr/bin/awk -f
#BEGIN {
	#print ">>>>>>>"
	##It has to be a string constant
	##In order to read the last record, a whitespace has to be put behind it, otherwise it
	##won't be read.
	#RS=" "
	#FS="x"
	##In order for the OFS to take effect, we have to apply $1=$1 assignment, otherwise it
	##won't work.
	#OFS="x"
#}

#{
	#\$1=\$1
	#print FNR, NF, \$2	
#}

#END{
	#print "<<<<<<<"	
#}
#eof

#chmod u+x command_awk
#./command_awk temp




##! /usr/local/bin/bash
##======147=======
##This script is to practice FS which is not spaces, and also we can change the the FS of
##the output -OFS.
#cat << eof > temp
#1,2,3,s
#I,love,you
#I,miss,you 
#what's,that?
#?,?
#eof

#cat << eof > command_awk
##! /usr/bin/awk -f
#BEGIN {
	#print ">>>>>>>>"
	#FS=","
	##By default FS is whitespace, so when print function is applied, the FS will be
	##whitespace, but when it's specified in the BEGIN pattern, FS will be set as that in
	##the BEGIN pattern.
	#OFS=":"
#}

#{
	#NF=2
	##AGAIN NEVER forget \ in front of $, otherwise you get wrong.
	##When does the record need to be reconstructed? NF, FS, OFS
	##are changed? Any other cases?
	##Here the following assignment is to force awk to reconstruct the record 
	#\$1=\$1
	##You will notice that the separator is changed to :.
	#print length(\$1),\$1,"> "\$0	
#}

#END {
	#print "<<<<<<<<"
#}
#eof

#chmod u+x command_awk

#./command_awk temp 




##! /usr/local/bin/bash
##======146=======
##This is test that command file does work
#cat << eof > temp
#1 2 3
#4 5 6
#7 8 9
#eof

#cat << eof > command_awk
##! /usr/bin/awk -f
#BEGIN {print ">>>>>"; OFS = ":"}
#{
	#NF=3
	#\$1=\$1
	#print
	
	##this is going to practice if-else statement
	#if (NF == 2)
		#print "NF is 2"
	#else
		#print "NF is " NF
#}
#END {print "<<<<<"}
#eof

#chmod u+x command_awk

#./command_awk temp 



##! /usr/local/bin/bash
##======145=======
##This is to demonstrate changing the record by $1=$1 after making some changes
#cat << eof > temp
#I love you
#Do you understand
#? ?
#eof
##After changing the record information, we have to force awk make this change by $1=$1 
##or replace 1 with 2, 3, etc.
#awk 'BEGIN {print ">>>>"; FS="o"; OFS=":"} {NF=2; $1=$1; print $0}' temp



##! /usr/local/bin/bash
##=====144=======
##This script is to demonstrate changing the record or more specifically the feilds in it.
#cat << eof > temp
#1 2 
#3 4
  #5   6
#7 8
#eof

#awk 'BEGIN {print "    SUM"; sum_1=0; sum_2=0; sum_3=0} {$4 = $1+$2; sum_1 += $1; sum_2 += $2; sum_3 += $4; print $0} END {print sum_1, sum_2, sum_3; print "<<<<<<"}' temp
#cat temp
#awk 'BEGIN {print ">>>>>"; OFS=","} {OFS = ":"; print}' temp
##reconstruct the record by applying $1=$1 (or $2=$2 or etc.) which is not well formatted.
#awk 'BEGIN {print ">>>>>>"} {$2=$2; print $0}' temp 



##! /bin/bash
##======143=====
##This script is to practice fields in awk
#cat << eof > temp
#I lvoe
#YOU 22
#eof

#a=( $(awk '{print NR}' temp) )
#echo ${a[*]}

##Here the expression can be a string constant or number
#awk 'BEGIN {record1=1; record2="2"; print "====="} {print $record1, $record2}' temp 
##use expression, and field of negative index is not allowed.
#awk 'BEGIN {print ">>>>>>>>>>>>"; field=2; field_cp="2"} $1 == "YOU" {print NR, $field, $field_cp, $(1*2)}' temp 
##looks like we can change the field directly by assigning value to it.
#awk 'BEGIN {print ">>>>>>>>>>>"} {print $2; $2="XO"; print $2}' temp 


##! /usr/local/bin/bash
##=======142========
##This script is test RS in awk, which can be spaces, \n or some other characters.
##Just like field separator, RS changes what is interpreted by awk.
#cat << eof > temp
#sdx sd x d

#q
#sd
#sd
#h
#eof

##awk 'BEGIN {RS="\n"} {print $0, FNR}' temp
#awk '{print $1, FNR, "---", $0}' FS="d" RS=" " temp 
#awk 'BEGIN {RS=""; print "====="} {print FNR, $4}' temp 
#awk 'BEGIN{print "END"}'




##! /usr/local/bin/bash
#======141=======
#cat << eof > temp
#11
#22
#33
#eof

#cat << eof > temp2
#s
#d
#eof
##This script perfectly demonstrates the difference between FNR and NR.
##FNR records the number of records read so far in the current file
##NR records the total number of records read so far for all the DATA files.
#awk '{print FILENAME, FNR, NR}' temp temp2




##! /usr/local/bin/bash
##======140======
##This script is to test FILENAME in awk
#awk 'END{print "The file processed is " FILENAME}' temp



##! /usr/local/bin/bash
##========139========
##This script is to test the case-changing function toupper() and tolower()
#cat << eof > temp
#x d sdfs 
#sdf
#XXDDSSD SDF3
#23 df
#eof

#awk '{print toupper($1), "--", toupper($0)}' temp
#awk '{if (NR == 3) print tolower($0)}' temp




##! /usr/local/bin/bash
##======138========
##This script is to parctice sub() function in awk. Note with ; awk thinks it's a complete
##action, so it will print by default.
##Substitute A for a
#echo "aa bb cc 11 22 33" | awk 'sub(/a/, "A"); {print NF}'
##Substitute A for the second field
#echo "aa bb cc 11 22 33" | awk 'sub($2, "A"); {print NF}'
##Substitute A for the first space, but how to do this for all spaces
#echo "aa bb cc 11 22 33" | awk 'sub(/ /, "A"); {print NF}'
##Substitute A for the entire record.
#echo "aa bb cc 11 22 33" | awk 'sub($0, "A"); {print NF}'




##! /usr/local/bin/bash
##=======137===========
##This script is to test the bracket operator
#cat << eof > temp
#[ sdf 1]
#s22
#23 3
#sdf
#eof
##Here hyphen means a range that connects two ends
#awk '/[b-g]/' temp
##No, not good.
#awk '[:digit:]' temp

#awk 'BEGIN {print "------"} {sub(/2/, "TWO"); sub (/^s/, "S"); print}' temp

#awk 'BEGIN {print "------"; exp="2"} $1 ~ /exp/ {print}' temp



##! /usr/local/bin/bash
##======136========
##This script is to test the regexp operators, like \, ^, $, *, ?, etc
#cat << eof > temp
#Jingjing Feng
#Weiwei Gu
#Lianshui Zhao
#Love
#wiiibiixx
#wxx
#Friendship
 

#eof

##Here ^L means the record starts with L
#awk '/^L/' temp | awk '$2 ~ /o$/'
##^$ means empty line
#awk '/^$/ {print NR}' temp
##^ $ means only one space in that line.
#awk '/^ $/ {print NR}' temp

#awk '/^wi*xx/' temp
#awk '/wii*/' temp
##The following expression is to test bracket expression
#cat << eof >temp
#hello
#love
#xcx
#xdx
#x
#2.d
#3.d
#4.d
#eof
##[xv] means the record contains x or v.
#awk 'BEGIN {print "----"} /[xv]/' temp
##It turns out that [^] does not work well
#awk 'BEGIN {print "------"} /[^ooo]/' temp
##Alternation operator is good
#awk 'BEGIN {print "------"} /[d]|[x]/' temp
##Period operator, which represents any single character
##Note this is different from . in bash, which means the current directory
#awk 'BEGIN {print "-------"} /x.x/' temp
#awk 'BEGIN {print "-------"} /.\.d/' temp
##The following script is to test + and {}
#cat << eof > temp
#wiwiwi
#xyzzzzz



#eof

#awk 'BEGIN {print "-----"} /xyz{2}/' temp
##+ does not work well.
#awk 'BEGIN {print "-----"} /wi+/' temp







##! /usr/local/bin/bash
##======135========
##The following script tests the escaped characters
#awk 'BEGIN {print "An alert\a. I want to start a new line.\nAnother alert \a.\nI want to\
	#get another new line in this script. This is half of double quotes \", this is a\
#backslash \\. This is single quote '\''. This is forwardslash /. This is horizontal tab\
#\t, and vertical tab \v."}'

#cat << eof > temp
#forwardslash /
#another forwardslash /
#a+b
#eof

#awk '/\// {print NF}' temp
##Here \+ has to be proceeded by a backslash
#awk '/a\+b/' temp

##The following lines are goingto test field separator FS.
#cat << eof >temp
#1,3,4
#a, b, c
#x,3, o
#a_b b_c
#eof

#awk 'BEGIN {FS=","; print "*********"} {print NF $2}' temp
#awk 'BEGIN {FS=" "; print "*********"} {print NF $2}' temp
#awk 'BEGIN {FS="_"; print "*********"} {print NF $2}' temp

##The following lines are used to test * in regexp
#cat << eof > temp
#s * sd
#*sd *8
#eof

#awk '/\*/' temp




##! /usr/local/bin/bash
##=======134=======
#cat << eof > temp
#this is
#this is
#is ds
#love s

#line 88
#end
#eof
##In awk there are two main parts, one is the pattern and the other is the action
#awk '/love/ {print NR}' temp
#awk '$2 !~ /8/ {print $1, $2, NF}' temp

#awk 'BEGIN {print "===="} {if (NR == 2) print}' temp
#awk 'BEGIN {print "===="} NR == 2' temp

#awk 'BEGIN {print "********"} $0 !~ /this is/ {print NR}' temp

##We can do this by pattern matching or by if statement in the braces
#awk 'BEGIN {print "********"} NR == 5 && NF == 0 {print NR, NF}' temp
#awk 'BEGIN {print "88888888"} {if (NR == 5 && NF == 0) print NR, NF}' temp

##This is to test whether ~ means perfectly match or partially
##The 2 following lines demostrated that ~ means partially matching, NOT perfectly matching
#awk 'BEGIN {print "xxxxxx"} $0 ~ /is/' temp
#awk 'BEGIN {print "xxxxxx"} /is/' temp



##! /usr/local/bin/bash
#===========133==========
#awk 'BEGIN {print "This is the header."}'

##The following line outputs the line number, number of columns and the whole line.
#awk '{print NR, NF, $0; print "            " $1, $NF}' temp

##The following line will print each field for each line
##We can see that more than one BEGIN can be used in this shell script. Just by the following
##example we can see how useful NR and NF are. By NF we can access the the element in each
##column and by NR we can track the rows.
#awk 'BEGIN {print "We are processing file temp"} {print "LINE " NR, "|| COLUMN " NF; for (i=1; i<=NF; i++) print $i; print \
	#"====="} END {print "THE TOTAL NUMBER OF ROWS IS " NR}' temp

##The following line will print some specific lines
##By single print without content, a new empty line is created.
##&& means and || or.
#awk 'BEGIN {line=0; print; print "++++NEW LINE++++"} {line=line+1; if (line > 3 && line < 6) print}'\
	#temp




##! /usr/local/bin/bash
##========132=======
#cat << eof > a132
#ndf sdfs
#k a a
#s d f
#4njnj
#eof

#awk 'length($0) == 5 {print $0}' a132 #$0 means the whole line, $1 the first column

#awk 'BEGIN {line=1} {if (line == 4) print; line=line+1 } END {print "line is " line}' a132

#awk 'BEGIN {leng=0}
	#{if (length($0) > leng) leng=length($0)} 
	#END {print "Length is " leng}' a132
#awk 'BEGIN {print "====="}'
#awk 'NF != 2' a132 #relational operator !=, ==, >, <, >=, <=
				   ##NF is the number of fields or columns
#awk 'BEGIN {print "========"}'
#awk 'BEGIN {for (i=1; i <=11; i++) print i, 10*rand()}'

#awk 'BEGIN {print "========"}'
#awk '{print "NR is", NR}' a132	#NR mean the number of rows
#awk 'END {print "The final NR is " NR}' a132
#awk '{if (NR % 2 ==0) print}' a132
#awk 'NR % 2=='1 a132
#awk '{if (NR%2==0) print}' a132 | awk '{if (NF==3) print}'
#awk '{print $NF}' a132	#here $NF means the the last column in a row.



##! /usr/local/bin/bash
##========131=======
#cat << eof > mail-list
#Amelia 555-5553 amelia.zodiacusque@gmail.com F
#Anthony 555-3412 anthony.asserturo@hotmail.com A
#Becky 555-7685 becky.algebrarum@gmail.com A
#Bill 555-1675 bill.drowning@hotmail.com A
#Broderick 555-0542 broderick.aliquotiens@yahoo.com R
#Camilla 555-2912 camilla.infusarum@skynet.be R
#Fabius 555-1234 fabius.undevicesimus@ucb.edu F
#Julie 555-6699 julie.perscrutabor@skeeve.com F
#Martin 555-6480 martin.codicibus@hotmail.com A
#Samuel 555-3430 samuel.lanceolis@shu.edu A
#Jean-Paul 555-2127 jeanpaul.campanorum@nyu.edu R
#eof

#cat << eof > inventory-shipped
#Jan 13 25 15 115
#Feb 15 32 24 226
#Mar 15 24 34 228
#Apr 31 52 63 420
#May 16 34 29 208
#Jun 31 42 75 492
#Jul 24 34 67 436
#Aug 15 34 47 316
#Sep 13 55 37 277
#Oct 29 54 68 525
#Nov 20 87 82 577
#Dec 17 35 61 401
#Jan 21 36 64 620
#Feb 26 58 80 652
#Mar 24 75 70 495
#Apr 21 70 74 514
#eof


#awk '/li/ {print $3}' mail-list	#print the third column in the file, // contains the pattern
#awk 'BEGIN {print "========"}'
#awk '/li/' mail-list	#the default action is to print the line in which the pattern is
						##matched.
#awk 'BEGIN {print "+++++++++"}'
#awk '{print $1}' mail-list	#Here the pattern is omitted, but at least one of them is 
							##present. If the action is omitted, then braces have to be 
							##omitted if no action is wanted to be performed on the line


	




##! /usr/local/bin/bash
#======130=======
#cat << eof > text1
#this is line 1

#the is line 3

#eof

#cat << eof > text2
#this is line 1

#the is line 3

#eof

##All the commands are executed for each line
#cat << eof > command
#BEGIN {print "========START======="}
#/ /{print "Space"}
#/^$/{print "Empty"}
#END {print "========END========"}
#eof

##Here we treat awk as a command utility, not as a program language. We usually combine 
##awk and shell script.
#awk -f command text1		#a file containing commands and an input file which is the file
						##to be processed.
						
						

##! /usr/bin/awk -f
#BEGIN { print "Don’t Panic! hi"; print "next line"}	#look the text has to be in double quotes "", not '', different actions are separated by ;, not ,.



##! /usr/bin/awk -f	#ONLY in the 1st line

##If you specify the interpreter, it has to be in the 1st line, NOT other lines, has to be 
##in the 1st line.
#BEGIN {print "hi"}




##======128=======
##This script is to practice awk

##! /usr/bin/awk -f
#which awk
#which bash
#cat << eof >a128
#Don't be panic

#the 3rd line 

#eof

#awk '/^$/{print "empty"}' a128
#awk '/e/{print $2}' a128
#awk '/ /{print "******\n"; print $2}' a128	#in {} each action is started in the new line

##Look in awk BEGIN and END must be in upper-case
#awk 'BEGIN {print "Don\47t Panic!"}'


#rm a128



