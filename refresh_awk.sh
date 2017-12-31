#! /usr/local/bin/awk -f



#=======32=======
#This is script is to practice feeding values to variables through command line
F == 1 \
{
	print 1, F
}

F == 2 \
{
	print 2, F
}











##=======31========
##This is to refresh my mind of FNR and NR
#{
	#print FNR, NR
#}




##========30=========
##This is to test find the minimum index in an array
#BEGIN \
#{
	#a[2] = 2
	#a[1] = 34
	#a[10] = 23
	#a[33] = "sdf"
	#a[8] = "sddd" " " "sd"
	#a[9.3] = 3
	
	#print length(a)
	#len = length(a)
	
	#for (i = 1; i <= len; i ++ )
	#{
		#ind = find_mini_index()
		#print ind, ind + 1,  a[ind]
		#delete a[ind]
	#}
#}

#function find_mini_index(i, ind, temp)
#{
	#i = 1
	#for (ind in a)
	#{
		#if (i == 1)
		#{
			#temp = ind
			#i ++
		#}
		#else if (temp+0 > ind+0)
		#{
			#temp = ind
		#}
		
	#}
	
	#return temp
#}





##=========29========
#BEGIN \
#{
	#print 2+23s3
#}





##=========28=========
#BEGIN \
#{
	#ind = 1
#}
#FILENAME == "temp_" ind \
#{
	#print "This is file temp_1"
	
	#printf "%.2f\n", int(2.2)
#}





##======27=========
##This script is to practice data inteference.
#{
	#for (i = 1; i <= NF; i++)
	#{
		#data[i] = $i
	#}
	
	#for (i in data)
	#{
		#printf "%s ", data[i]
	#}
	#printf "\n"
	#delete data	#otherwise the previous data might interfer with the next record.
#}





##========26=========
##This script is to practice print and printf
#BEGIN \
#{
	#print 23, "love" " me" 23 "ap\n", "%d", 2
	#printf "%11.4E: %s\n", 23.43243, "love" " me"
	
	#a = 2.343323  /  3.2323
	#printf "%s, %.12f\n", a, a
#}





##======25=======
##This script is to practice 0
#{
	#for (i=1; i<=NF; i++)
	#{
		#if ($i == 0)
		#{
			#print $i
		#}
		
	#}
#}




##======24======
##This script is to practice the increment of a for loop
#{
	##for (i = 1; i <= NF-1; )
	#i = 1
	#for (; ;)
	#{
		#if (i >= NF) break
		
		#j = i+1
		
		#while ($i == $j)
		#{
			#$j = ""
			#j++
		#}
		
		#i = j	
	#}
	#print 
#}




##========23========
##This script is to practice delete a field.
#{	
	#print $2
	##delete $2
	#$2 = ""
	#print $2, ":", $3-$2
#}




##======22========
##This script is to test NF changes when new field is created
#{
	#print NF
	#$(NF+1) = 2
	#print NF
	#$(NF+2) = "2"
	#print NF
	#print > "temp_1"
#}




##========21=========
##This script is to practice function, whose have all the local variables in the parenthesis
##except arrays. So in fact we don't need to use another array variable. All the scalar 
##variables are local in the parenthesis though they may share variable name, but local,
##has nothing to do with the variable of the same name, except passing values.
#BEGIN \
#{
	#a[2] = 23
	#bb =30
	#test_func()
	#print a[2], b[2], bb
	#print "c =", c
#}

#function test_func( bb)
#{
	#print a[2], b[2], bb
	#b[2] = 3
	#bb= "sd"
	#c=2
#}






##========20========
##This is to practice printf 
#BEGIN {
	#printf "%.2f, %.3f, %.4f\n", 2.2323, 2.34343
	
#}




##=========19==========
##This is to test function
#{
	#order()
	##if i is not put in the parenthesis in the function definition, then it's treated as
	##a global variable.
	#print i, $0
	#$2 = $2+23
	#$(NF+1) = "LOVE"
	#print $2, $0
#}

#function order(		 j, temp)
#{
	#for (i = 1; i <= NF-1; i++)
	#{
		#for (j = i+1; j <= NF; j++)
		#{
			#if ($i > $j)
			#{
				#temp = $i
				#$i = $j
				#$j = temp
			#}
		
		#}
	#}
	
#}





##=======18========
##This is to test reading each column is not interferred by the previous value.
#{
	#print $2
#}




##=======17=========
##This is to practice delete an array
##Once var is a scalar, it's a scalar all its life; once it's a vector, it's a vector all
##its life.
#BEGIN \
#{
	#a["love"] = "love"
	#delete a
	##print a["love"]
	#a=3
#}





##========16========
##This script is to practice concatenation of data into a single string instead of many
##array elements.
#{
	#if (data[$1] == "")
	#{
		#data[$1] = $2
	#}
	#else
	#{
		#data[$1] = data[$1] " " $2
	#}
#}

#END \
#{
	#for (i in data)
	#{
		#print "index =", i, "data =", data[i]
	#}
	
	
#}




##=======15======
##This script is to practice arrays.
#BEGIN \
#{
	#a["me"][2] = 32
	#a["you"][2] = 23
	#a["him"][3] ="hi"

	#for (i in a)
	#{
		#print i
		
	#}

#}




##==========14==========
##This script is to practice 

#{
	#print i
	##nextfile is to ingnore the rest of the file and go to the next file.
	#nextfile
#}





##=========13=========
##This script is to practice break, which returns from the innermost loop.
#BEGIN \
#{
	#a["me"] = ""
	#a["you"] = ""
#for (j in a)
#{
	#for (i = 1; i <=4; i++)
	#{
		#if (i >=3)
		#{
			#break
		#}
		#print i
	#}
#}	
	
#}




##=========12==========
##This is to test change $0 by assigning another filed
#{
	#$3 = "extra"
	#$2 = ""
	#$1 = ""
	#print 
#}




##=======11=========
##This is a test
#BEGIN \
#{
	#i = 3
	#a["me"][1] = 2
	#a["me"][++i] = 3
	#print "i =", i
	#for (i in a["me"])
	#{
		#print i, a["me"][i], isarray(a["me"])
	#}	
#}




##=======10=======
##This script is to find out the value of an uninitialized variable.
#BEGIN \
#{	
	#b[0] ="0sd"
	#b[""] = "NULL"
	#print b[a], b[""]
	#b[a]=3
	#print a, b[a], b[""]
	#print a+1
	#print a "love"
	
	#a = "ind_" 2
	#print a

#}






##========9==========
##This script is to practice mitidimensional arrays.
#BEGIN \
#{
	#a["me"][0] = 1
	#a["me"][1] = 23.3E-3
	#a["me"][2] = 23444

	#printf "%d\n", length(a["me"])
	#print isarray(a), length(a)
	
	#for (i in a)
	#{
		#print i
		
		##It is important to check whether it's an
		#if (isarray (a[i]))
		#{
			#for (j in a[i])
			#{
				#print a[i][j]
			#}
		#}
		#else
		#{
			#print a[i]
		#}
		
	#}
#}





##========8=========
##This  is to practice next which starts over with the next record.
#BEGIN \
#{
	#line = 0
#}


#{line ++}


#line == 2 \
#{
	#next
#}

#{
	#print ":", $0
#}





##=========7==========
##This is to verify that though an element is deleted, length still gives the original 
##number of elements.
#
#BEGIN \
#{
#	arr ["love"] = "love"
#	arr ["me"] = "me"
#
#	print "original # =", length(arr)
#	delete arr["love"]
#	print "After # =", length(arr)
#}
#




##=======6========
##This is to practice function
#BEGIN \
#{
#	a["one"] = 1
#	a["two"] = 2
#	a["three"] = 3
#	
#	str = incre(a, 3)
#	
#	printf "%s\n", str
#	printf "In the main i = %s\n", i
#	printf "In the main j = %s\n", j
#	
#	printf "=========\n"
#	
#	b = 0
#	
#	b = 2 > b? 2:b
#	
#	printf "b = %d\n", b
#	
#	printf "*********\n"
#	print "before: len =", length(a)
#	
#	delete a["one"]
#	
#	print "after: len =", length(a)
#	
#	print "******\n"
#	print int (23.3)
#}
#
#function incre(a, num, 		i)
#{	
#	print "num = " num
#	
#	for (i in a)
#	{	print i
#		print a[i]
#	}
#	
#	printf "In function i (local) = %s\n", i
#	j="global"
#	
#	return "This is return of incre"
#}
#




##=========5=========
#BEGIN \
#{
#	line = 4
#	line ++
#	print line
#	printf "%d_%d_%d\n", ++line, line++, line
#
#}
#
#{
#	tem = $1
#	
#	if (data [tem] == "")
#	{
#		data [tem] = 1
#	}
#	else
#	{
#		data [tem] ++
#	}
#}
#
#END \
#{	
#	sum = 0
#	
#	for (ind in data)
#	{
#		sum += data[ind]
#		print ind, data[ind] > "histogram"
#	}
#	
#	if (sum != 5)
#	{
#		print "This is wrong"
#		exit
#	}
#	
#	
#
#}






##========4========

#BEGIN {
#	print 4 23
#	
#	SUBSEP = "\034" "@"
#	a["f", "n"] = "seth"
#	print a["f", "n"], a["f" SUBSEP "n"]
#	
#	if ("f" SUBSEP "n" in a)
#	{
#		print "IN"
#	}
#	
#	if (("f", "n") in a)
#	{
#		print "IN", length (a), length(1), substr("love", 2, 1)
#	}
#	
#	print "========="
#	
#	info ["first", "name"] = "seth"
#	info ["last", "name"] = "zhao"
#	info ["DOB"] = "04/02/1990"
#	
#	SUBSEP = "\034"
#	for (ind in info)
#	{
#		printf  "Before split %s", ind
#		split (ind, sep, SUBSEP)
#		
#		len = length (sep)
#		print "\nlen =", len 
#		name = "" 
#		for (ind_sep in sep)
#		{
#			printf "%d, %s\n", ind_sep, sep[ind_sep]
#			if (ind_sep == 1)
#			{
#				name = sep[ind_sep]
#			}
#			else if (ind_sep <= len)
#			{
#				name = name SUBSEP sep[ind_sep]
#			}
#		}
#		print "ind =", name, info[name]
#		
#	
#	}
#	print "love" "you" "xx" "\034"
#}





##========3=========
#BEGIN {
#	printf "%d\n", length("h i \n")
#	
#	printf "ARGC = %d, ARGV[1] = %s\n", ARGC, ARGV[1]
#	i = 0
#}
#
#{i++}	#For each line, we record the line number
#
#/^$/ {printf "%d. This is empty line\n", i}
#/T/ {printf "%d. %s\n", i, $0}
#/  / {printf "%d. This line has 2 subsequent empty spaces.\n", i}
#$2 ~ /is/ {} #{printf "$2 ~ /is/\n"}
#
#/^T/ {printf "%d. ^T\n", i}
#/u$/ {printf "%d. u$\n", i}
#
#i == 3 {printf "%d. i = 3\n", i}
#
#$0 !~ / / {printf "Not contain space\n"}






##========2========
#BEGIN {
#	printf "%d, %s\n", a, b
#	printf "ARGC = %d\n", ARGC
#}
#
#FILENAME == ARGV[3] { 
#	printf "Body: a=%s, c=%d, d=%.2E\n", a, c, d > out_1
#}
#
#
#FILENAME == ARGV[5] { 
#	#print FILENAME, ARGV[2]
#	print out_2
#	printf "Body: a=%s, c=%d, d=%.2E\n", a, c, d > out_2
#}
#
#/^$/ {
#	print "love", NR > out_empty
#
#}







##======1==============


##This is to refresh my mind of coding awk 
#
##The BEGIN block does NOT depend on whether there is input file or not, it always executes.
##But for the END block, it can only execute after processing the input file. If there is 
##not an input file, then the program waites until the file is provided, otherwise END won't
##execute.
#BEGIN {
#	printf "In the command line a = " a "\n"
#	printf "In the command line b = %d\n", b
#	a = "s"
#	b = "d"
#	ab = "kk"
#	print "I LVOE YOU.", "sd" b a
#	#Assignment is different from that in shell script, which requires NO spaces between
#	#variable, = and value. This is more like C-style.
#	a = "love"
#	print ARGV[3], ARGC, FILENAME
#	print "==================="
#}
#
#{
#	print ARGV[1], ARGC
#	#No matter how many input files, BEGIN and END can only execute once, which is before
#	#processing all the files and after processing all the files.
#	print NR, FNR, FILENAME, NF, $NF, $2, $0
#}
#
#
#END {
#	printf "===================\n"
#	print "This is the end."
#	print ARGV[0], ARGC
#	
#	#As you might find, positional specifier must be in all format control strings,
#	#otherwise error, or you don't specify any positional specifiers. That's ALL or NONE.
#	printf "FNR = %2$d, NR = %1$d, %2$s\n", NR, FNR
#	
#	printf "%2$3.2d, %1$f, %2$12.2E,   %2$.2e, %3$ 18.12s\n", 2, 2.343, FILENAME a
#}
