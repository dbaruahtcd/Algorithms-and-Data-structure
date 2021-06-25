#!bin/bash
# if [ $1 -gt 20 ]
# then
#   echo "who are you"
#   whoami
#   # echo `I am : $whoami`
# fi
# 
# date

# echo "there are: $# arguments"
# echo "First argument is $1"
# echo "Second argument is $2"
# echo "Process id: $$"
# echo "Exit status: $?"

# echo Who am I taking to. Enter uname and password
# read -p 'Username: ' usname
# read -sp 'Password: ' pword
# 
# echo Hello there $usname

# if [ $1 -gt 100 ]
# then
#   echo Argument is: $1
# fi

# counter=1
# while [ $counter -le 5 ]
# do
#   echo count: $counter
#   let "counter = $counter + 1"
# done


# names='bob dylan springsteen'
# 
# for n in $names
# do
#   echo "My name is: $n"
# done

# print_something() {
#   echo "Hello boss"
# }
# 
# print_something

# lines_in_file() {
#   cat $1 | wc -l
# }
# 
# line=$( lines_in_file $1)
# echo The lines in file: $1 are: $line


cols=$( tput cols )
rows=$( tput lines )
message=$@
input_length=${#message}
half_input_length=$(( $input_length / 2 ))
middle_row=$(( $rows / 2 ))
middle_col=$(( ($cols / 2) - $half_input_length ))
tput clear
tput cup $middle_row $middle_col
tput bold
echo $@
tput sgr0
tput cup $( tput lines ) 0