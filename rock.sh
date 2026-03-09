#!/bin/bash

while true; do
    read -rp "How many games do you want to play?" total_games
    if [[ "$total_games" =~ ^([1-9]|10)$ ]]; then
        break
    else
        echo "Please enter a number between 1 and 10."
    fi
done

choices=("Rock" "Paper" "Scissors")
player_score=0
computer_score=0
ties=0
games_played=0

while (( games_played < total_games )); do
    games_left=$(( total_games - games_played ))

    echo ""
    echo "--------------------------------"
    echo " Games left: $games_left  |  You: $player_score  CPU: $computer_score  Tie;s: $ties"
    echo "--------------------------------"
    echo " 1) Rock"
    echo " 2) Paper"
    echo " 3) Scissors"
    echo ""

    read -rp "Your choice (1/2/3): " input
    
    player_choice="${choices[$((input - 1))]}"
    cpu_choice="${choices[$((RANDOM % 3))]}"

    echo ""
    echo " You chose:      $player_choice"
    echo " Computer chose: $cpu_choice"
    echo ""

    if [[ "$player_choice" == "$cpu_choice" ]]; then
        echo " It's a tie!"
        (( ties++ ))
    elif [[ ( "$player_choice" == "Rock"     && "$cpu_choice" == "Scissors" ) ||
            ( "$player_choice" == "Paper"    && "$cpu_choice" == "Rock"     ) ||
            ( "$player_choice" == "Scissors" && "$cpu_choice" == "Paper"    ) ]]; then
        echo " You win this round!"
        (( player_score++ ))
    else
        echo " Computer wins this round!"
        (( computer_score++ ))
    fi

    (( games_played++ ))
done

echo "         FINAL RESULTS          "
echo " You:      $player_score wins"
echo " Computer: $computer_score wins"
echo " Ties:     $ties"
echo ""

if (( player_score > computer_score )); then
    echo " You win overall! Well played!"
elif (( computer_score > player_score )); then
    echo " Computer wins overall. Better luck next time!"
else
    echo " It's an overall tie!"
fi
