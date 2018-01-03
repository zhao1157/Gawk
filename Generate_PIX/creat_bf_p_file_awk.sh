#! /bin/bash 

#This script is to create the p-file for the extra configurations.

cat << eof > creat_bf_p_file.awk
#! /usr/local/bin/awk -f

BEGIN \
{
	printf "%d ", ind 
	line_p_file = 1
	out_file = "out/" ind 
}

#=========I=========
#Read the energy file and find level ind and its energy in unit of Ry relative to the 
#lowest energy of the ionized state.
FILENAME == "out_dir/fe17_2_hole_a.en" && NF > 6 \
{
	if (\$1 == ind)
	{
		printf "Found_Energy "
		en_ind = (\$3 - 1260.31231)/13.605693
		nextfile	
	}
}

#=========II=========
#Next read the energy from ../create_mesh_2/fine_mesh_bf, in which the energy points are
#checked that they are all different.
FILENAME == "../../create_fine_mesh_2/fine_mesh_bf" \
{
	if (\$1 == ind)
	{
		printf "Found_Photo_Mesh "
		for (i = 2; i <= NF; i ++)
		{
			photo_mesh[i] = \$i / 13.605693
		}
		nextfile
	}
	
}

#========III==========
#Find the lowest energy threshold for level ind 
FILENAME == "../../create_fine_mesh_2/level_thresh_order_mini_diff" \
{
	if (\$1 == ind)
	{
		printf "Found_Lowest_Threshold "
		th_ind = \$2 /13.605693
		nextfile
	}
}

#========IV===========
#Now we are ready to create the p-file for level ind 
FILENAME == "xsectn/" ind \
{
	if (line_p_file == 1)
	{
		printf "    0%5i    0    1\n", (ind-2)+454+166 > out_file
		printf "%14.6E  %5i\n", en_ind, length(photo_mesh) > out_file
		printf "    0.000000\n" > out_file 
		
		printf "  %.9E  %.9E    %.3E  %.3E\n", photo_mesh[line_p_file+1], \
			photo_mesh[line_p_file+1]-th_ind, \$1, \$1 > out_file
			
		line_p_file ++
		next 
	}
	
	printf "  %.9E  %.9E    %.3E  %.3E\n", photo_mesh[line_p_file+1], \
			photo_mesh[line_p_file+1]-th_ind, \$1, \$1 > out_file
	line_p_file ++
}

END \
{
	if (line_p_file - 1 == length(photo_mesh)+0)
	{
		printf "DONE\n"
	}	
	else
	{
		printf "Something went wrong!\n"
	}
}
eof

chmod u+x creat_bf_p_file.awk

if [ -d out ]
then 
	rm -rf out
fi

mkdir out 

#Make changes to the level indices range
for ((i = 3; i <= 5002; i ++ ))
do
	printf "%d: " $i
	
	./creat_bf_p_file.awk -v ind=${i} \
						  out_dir/fe17_2_hole_a.en \
						  ../../create_fine_mesh_2/fine_mesh_bf \
						  ../../create_fine_mesh_2/level_thresh_order_mini_diff \
						  xsectn/${i}
done 


