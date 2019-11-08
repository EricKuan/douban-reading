#!/bin/bash

urlencode () {
	echo -n $1 | xxd -p | tr -d '\n' | sed 's/\(..\)/%\1/g'
}

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
		url=`urlencode "./${dirs[$i]}/${file}"`
		readme="${readme}\n- [《${file}》]($url)"
	done
done

echo -e $readme > ./README.md