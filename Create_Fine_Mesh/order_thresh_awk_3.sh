#! /usr/local/bin/bash

#This script is to put the energy threshold in order 
cat << eof > order_thresh_3.awk
#! /usr/local/bin/awk -f

{
	#Rank the original threshold in ascending order
	order()
	
	#Add the ending energy to the line
	\$(NF+1) = \$2+500*13.60569
	
	#remove the same adjacent energy point
	remove_same()
	
	print > "level_thresh_order"
	
}

#This function is to remove the field that's the same as the previous one.
function remove_same(i, j)
{
	for (i = 2; i <= NF-1; )
	{
		j = i+1
		
		while (\$i == \$j)
		{
			\$j = ""
			j++
		}
		
		i = j	
	}
	
}


#This function is to put the fields in ascending order.
function order(i, j, temp)
{
	for (i = 2; i <= NF-1; i++)
	{
		for (j = i+1; j <= NF; j++)
		{
			if (\$i > \$j)
			{
				temp = \$i
				\$i = \$j
				\$j = temp
			}
		}
	}	
}
eof

chmod u+x order_thresh_3.awk

./order_thresh_3.awk level_thresh


