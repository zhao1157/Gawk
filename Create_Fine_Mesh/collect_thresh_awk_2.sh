#! /usr/local/bin/bash 

#This script is to collect all the threshold for each bound level and output to a file

cat << eof > collect_thresh_2.awk
#! /usr/local/bin/awk -f
{
	if (trans[\$1] == "")
	{
		trans[\$1] = \$5
	}
	else
	{
		trans[\$1] = trans[\$1] "  " \$5
	}
}

END \
{
	len = length (trans)
	
	for (i = 1; i <= len; i ++)
	{
		ind = find_mini_index()
		print ind, trans[ind] > "level_thresh"
		delete trans[ind]
	}	
}

function find_mini_index(i, ind, temp)
{
	i = 1
	for (ind in trans)
	{
		if (i == 1)
		{
			temp = ind
			i ++
		}
		else if (temp+0 > ind+0)
		{
			temp = ind
		}	
	}	
	return temp
}
eof

chmod u+x collect_thresh_2.awk

./collect_thresh_2.awk transitions




