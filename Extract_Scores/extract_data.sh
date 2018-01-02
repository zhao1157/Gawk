#! /bin/awk -f

#This script is to extract the students' scores of an exam and store the scores with the associated number of students who get the same 
#score for gnuplot later.

#Read the number of students took the exam.
NR == 16 \
{
	num_stu = $4
}

NR >= 26 && NR <= 25+num_stu \
{
	print $5 > "percent_score"
	
	if (data [$5] == "")
	{
		data [$5] = 1
	}
	else
	{
		data [$5] ++
	}
}

END \
{	
	#In this block, we can process the file to find the number of students who get the
	#same score.
	sum = 0
	len = length(data)
	
	for (i = 1; i <= len; i++)
	{
		ind = find_mini_ind(data)
		sum += data[ind]
		print ind, data[ind] > "data_histogram"
		delete data[ind]
	}
	
	if (sum != num_stu)
	{
		print "This is wrong"
		exit
	}
}

function find_mini_ind(a, 		i, ind, temp)
{	
	i = 1
	for (ind in a)
	{	
		if (i == 1)
		{
			temp = ind
			i ++
		}
		else
		{
			temp = ind < temp ? ind : temp
		}
		
		#i++	
	}
	
	return temp
}

