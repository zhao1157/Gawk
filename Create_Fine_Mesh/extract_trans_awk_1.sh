#! /usr/local/bin/bash 

#This script is simply to extract the transtions information from 
#../pre_generate_PI_1/out_dir/fe17_2_hole_a.rr

cat << eof > extract_trans_1.awk
#! /usr/local/bin/awk -f

NF == 6 \
{
	print > "transitions"
}

END \
{
	print "line = ", FNR
}
eof

chmod u+x extract_trans_1.awk
./extract_trans_1.awk ../../pre_generate_PI_1/T3_1/out_dir/fe17_2_hole_a.rr 

