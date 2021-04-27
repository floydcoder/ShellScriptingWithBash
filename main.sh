# A BRIEF DESCRIPTION OF THE WHOLE PROGRAM LOGIC BY ITS FUNCTIONS

# main()
# task1 --> menu1() --> task1() --> STILL WANT TO PLAY? YES. task1() --> STILL WANT TO PLAY? NO. main()
# task2 --> menu2() --> task2() --> STILL WANT TO PLAY? YES. task2() --> STILL WANT TO PLAY? NO. main()
# task3 --> menu3() --> task3() --> STILL WANT TO PLAY? YES. task3() --> STILL WANT TO PLAY? NO. main()
# EXIT


#Author: Marco Stevanella
# Task 1
# This program has the goal to display to the user a defined number of even multiples, from a given number.
# It is important to note that the number that is been chosen for creating multiples will not be displayed in the sequence. As per Project rubric.

# A function has been created to perform the operations for task1.

function task1 () {

echo "please enter the number you want to get the multiples from"
read number
echo "Please tell me how many multiples you want to display"
read multiple
        if [ $(( $number%2 )) -eq 0 ]
        then
        for (( i=2 ; i<= multiple+1 ; i++ ))
        do
        tot=$(( number*i ))
        echo "The multiples are: $tot"
        done
        else
        for (( i=2 ; i<= multiple*2 ; i+=2 ))
        do
        tot=$(( number*i ))
        echo "the multiples are: $tot"
        done
        fi
# Sequentially, below here we wanted the user to have total control of the program  once the task is completed. In this way the
# user can go back to main menu or keep playing the game.
        for (( ; ; ))
                do
                        echo "Would you like to continue playing or going to the main menu? CAPITAL LETTER ONLY!"
                        echo " M --> Go to the main menu"
                        echo " P --> Keep Playing"
                        read selection2
                case "$selection2" in
                        M) main ;;
                        P) task1 ;;
                        *) echo "Sorry, you might have digit a wrong letter. Remember that I only accept M or P " ;;
                esac
        done

}

#this function is being used as internal menu for task 1, in this way it is easier for the user to have control of the program.

function menu1 () {

echo "Hi, I am a multiples generator that displays only even multiples of a given numbe. Do you want to try it? (Y) YES (N) NO"
read menuDecision
if [ $menuDecision == Y ]
then
task1
elif [ $menuDecision == N ]
then
main
else
echo "The menu is case sensitive either digit Y or N"
menu1
fi

}


# Here is where task 2 begins


#Task 2
#This program prompts the user to enter two different integers
#and finds the linear sequence of given by U=an+b rule.
#The user chooses the length of the sequence output.


#This is the code that performs the arithmatic functions of task 2

function task2 () {


echo -n "Please enter an integer: "; read  a
echo -n "Please enter another integer: "; read  b
echo -n "Please How many outputs would you like to see?  "; read seqnum

# ^(-)?[0-9]+$ is used to check for the integer input only

if  [[ "$a" =~ ^(-)?[0-9]+$ ]] && [[ "$b" =~ ^(-)?[0-9]+$ ]] && [[ "$seqnum" =~ ^(-)?[0-9]+$ ]];
then
	for (( n=1; n<$seqnum+1; n++ ))
	do
		let product=$a*$n+$b
		echo -n " $product "
		sleep 0.5
	done
else
	echo "Sorry Integers Only! Please try again."
fi


#Gives User the option of going back to the main menu or running the task again

for (( ;; ))
do
	echo "Would you like to repeat the task or go back to the main menu?"
	echo "Please response with capital letter only!"
	echo " M--> Go back to the main menu"
	echo " S--> Repeat the task"
	read choice

	case "$choice" in
		M) main ;;
		S) task2 ;;
		*) echo "Invalid Input! Please reply with Capital M or S only" ;;
	esac

done

}



function menu2 () {


echo "Hello there! "
echo "This program displays a linear sequence of numbers generated by U=an+b rule."
echo "Would you like to try it? [Y] Yes [N] No"
read menudecision2
if [[ $menudecision2 == "Y" ]]
then
	task2
elif [[ $menudecision2 == "N" ]]
then
	main
else
	echo "The menu is case sensitive. Please reply with only Capital \'Y' or \'N' "
	menu2
fi

}

# Here is were task 3 begins

function task3 () {



maxvalue=0
while [ $maxvalue -le 1 ]; do
        echo -n "Please enter a positive number (2 or greater) to serve as the maximum value: "; read maxvalue
        if [ $maxvalue -le 1 ]; then
                echo "You entered an invalid number, please try again."
        fi
done
value1=1
value2=2
product=$(( value1*value2 ))
echo ""
echo "The numbers that can be expressed as the"
echo "product of two nonnegative integers in succession are:"
echo ""
while [ $product -le $maxvalue ]; do
        echo "$product = $value1 * $value2"
        ((value1++))
        ((value2++))
        product=$(( value1*value2 ))
done
((value1--))
echo ""
echo "$value1 numbers were printed that fit the criteria"
echo ""
for (( ; ; ))
                do
                        echo "Would you like to continue playing or going to the main menu? CAPITAL LETTER ONLY!"
                        echo " M --> Go to the main menu"
                        echo " P --> Keep Playing"
                        read selectiontask3
                case "$selectiontask3" in
                        M) main ;;
                        P) task3 ;;
                        *) echo "Sorry, you might have digit a wrong letter. Remember that I only accept M or P " ;;
                esac
        done
}

function menu3 () {

echo "Hi, Would you like to continue with this game? (Y) YES (N) NO "
read menuDecision3
if [ $menuDecision3 == Y ]
then
task3
elif [ $menuDecision3 == N ]
then
main
else
echo "The menu is case sensitive either digit Y or N"
menu3
fi

}

# Main Program Menu starts

main () {

for (( ; ; ))
do
        echo "-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
        echo "       WELCOME TO GROUP 32 COMP_1236 PROJECT"
        echo "                                                         "
        echo "Made by: Marco Stevanella, Novela Titania, Mykyta Bortnik"
        echo "                                                         "
        echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
        echo "Press the following numbers to navigate through the program"
        echo "1. Task number 1"
        echo "2. Task number 2"
        echo "3. Task number 3"
        echo "4. EXIT"
        read option

        case "$option" in
                1) menu1;;
                2) menu2;;
                3) menu3;;
                4) exit 0;;
                *) echo "It looks like you've digited a wrong number. Please try again";;
        esac
done
}

main
