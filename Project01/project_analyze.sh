#!/bin/bash

cd ~
#change it a bit/understand it
function check_todo() { 
grep -Hr "#TODO" --exclude="todo.log" "./Project01" > "./Project01/logs/todo.log"
}

function check_errors () {
find -name "*.hs" | xargs -I {} ghc -fno-code {} &> /home/chishtia/CS1XA3/Project01/logs/compile_fail.log
find -name "*.py" | xargs -I {} ghc -fno-code {} &> /home/chishtia/CS1XA3/Project01/logs/compile_fail.log
}

function check_compfile() {
echo "What two files are you comparing?"
read file1 file2
diff $file1 $file2
}

#call function which find files depending the filename
function check_find () {
echo "What is the name of the file you are searching?"
read filename
echo "What type of file are you searching?"
read filetype
find . -name "*$filename*$filetype" -type f 
}


#change it up, so to ensure that log files are created new everytime 
#program is run
file1="./Project01/logs/todo.log"
file2="./Project01/logs/compile_fail.log"
#file3="/home/chishtia/new_csv/csv"
if [ -e "$file1" ] || [ -e "$file2" ]; then
        rm -r "$file1"
        rm -r "$file2"
fi

touch ./Project01/logs/todo.log
touch ./Project01/logs/compile_fail.log

#variables to store number of specific type of files
bash=0
hask=0
python=0
css=0
javascript=0
html=0

#add the haskell and python error command after testing
declare -a features=('todo' 'errors' 'find' 'compfile');

#add all features of the script by printing out values of the array of 
#commands
echo "The list of features of this script is ..."
echo ${features[@]}
echo "Type which function to execute:"
read command
echo "I'm executing $command"
command=$(echo "$command"| tr "[:upper:]" "[:lower:]" 2>&1)
echo "New transformed command is $command"
#execute said command
for item in ${command[@]}; do
	echo "The command in array which the user input is being compared to is ${item}" 
	if [ "${item}" = "${command}" ]; then
		check_${command}
		echo "Found a match for the command"
				
	fi
done

#file type count
#go through all the files in repo and count how many they are

#add commands/lines before this to find all the python and haskell files and run them
#  2> compile_fail.log
#

