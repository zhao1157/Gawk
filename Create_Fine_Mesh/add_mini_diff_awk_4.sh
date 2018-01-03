#! /usr/local/bin/bash

cat << eof > add_mini_diff_4.awk
#! /usr/local/bin/awk -f

{	
	mini_diff = \$3 - \$2
	
	if (mini_diff == 0)
	{
		print FNR, "mini_diff = 0"
	}
	
	for (i = 3; i <= NF-1; i++)
	{
		if (\$(i+1) - \$i < mini_diff)
		{
			mini_diff = \$(i+1) - \$i
			if (mini_diff == 0)
			{
				print FNR, "mini_diff = 0"
			}
		}	
	}
	
	\$(NF+1) = mini_diff
	print > "level_thresh_order_mini_diff"
}

END \
{
	print "line =", FNR
}
eof

chmod u+x add_mini_diff_4.awk
./add_mini_diff_4.awk level_thresh_order
