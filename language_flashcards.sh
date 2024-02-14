#!/bin/bash

echo -e "\nIn what language you want to create new flashcards?"

read language

echo -e "\nHow many cards do you want to create?"

read amountOfCards

#Get both sides of the digital flashcard, question and answer. Store them all in an array.
for ((i = 0; i < amountOfCards; i++)); do
        echo -e "\nEnter the English word for card Nr. $((i+1)):"
        read question[i]
        echo -e "\nEnter the $language translation:"
        read solution[i]
done

#adding 100 empty lines, so that previous inputs are not visible anymore.
for ((i = 0; i< 100; i++)); do
        echo ""
done

echo -e "Time to review the flashcards :)\n"

#dramatic effect
echo "3"
sleep 1
echo "2"
sleep 1
echo "1"
sleep 1
echo ""

#create counters for right and wront answers.
countRight=0
countWrong=0

#Show user the front side of the flashcard, and get them to type the answer.
for ((i = 0; i < ${#question[@]}; i++)); do

echo "What is the $language translation of: ${question[i]}"
read answer

if [ "${answer}" == "${solution[i]}" ]; then
        echo -e "\nThat was correct.\n"
        ((countRight++))
else
        echo -e "\nThat was wrong. The correct answer is: ${solution[i]}.\n"
        ((countWrong++))
fi

done

echo -e "\nYou had $countRight correct answers and $countWrong wrong answers."
