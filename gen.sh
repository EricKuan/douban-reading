#!/bin/bash

dirs=(`ls -l ./ | grep '^d' | awk '{print $9}'`)

readme=""

IFS=$'\n'
for i in ${!dirs[*]}; do

	if test $i -ne 0; then
		readme="${readme}\n\n"
	fi

	readme="${readme}## ${dirs[$i]}\n"

	files=(`ls ./${dirs[$i]}/`)
	
	IFS=$'\n'
	for file in ${files[@]}; do
		readme="${readme}\n- [《${file}》](./${dirs[$i]}/${file})"
	done
done

echo -e $readme > ./README.md