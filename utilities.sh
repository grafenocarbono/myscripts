BLACK="\e[0;30m"
RED="\e[0;31m"
GREEN="\e[0;32m"
YELLOW="\e[0;33m"
BLUE="\e[0;34m"
PURPLE="\e[0;35m" 
CYAN="\e[0;36m" 	
WHITE="\e[0;37m" 	

BACK_BLACK="\e[40m"
BACK_RED="\e[41m"
BACK_GREEN="\e[42m"
BACK_YELLOW="\e[43m"
BACK_BLUE="\e[44m"
BACK_PURPLE="\e[45m"
BACK_CYAN="\e[46m" 
BACK_WHITE="\e[47m"


BOLD_BLACK="\e[1;90m"
BOLD_RED="\e[1;91m"
BOLD_GREEN="\e[1;92m"
BOLD_YELLOW="\e[1;93m"
BOLD_BLUE="\e[1;94m"
BOLD_PURPLE="\e[1;95m"
BOLD_CYAN="\e[1;96m"
BOLD_WHITE="\e[1;97m"


BACK_INTE_BLACK="\e[0;100m"
BACK_INTE_RED="\e[0;101m" 	
BACK_INTE_GREEN="\e[0;102m" 
BACK_INTE_YELLOW="\e[0;103m"
BACK_INTE_BLUE="\e[0;104m" 	
BACK_INTE_PURPLE="\e[0;105m"
BACK_INTE_CYAN="\e[0;106m" 	
BACK_INTE_WHITE="\e[0;107m"

RESET="\e[0m"

#printf "$BACK_INTE_RED $BOLD_WHITE Example of use of colors $RESET \n"
#printf "Normal text\n"

function agree(){

clear

printf "$BACK_INTE_RED $BOLD_WHITE I make no warranty of any kind for the use of this software. I am not responsible for any direct or collateral damage. $RESET \n"
printf "$BOLD_BLACK @grafeno30 $RESET \n"
printf "$BOLD_BLACK Do you agree?(y/n) $RESET"
read -n 1 -r



if [[ $REPLY =~ ^[Yy]$ ]]
then
    return 1
else
    return 0
fi

}
