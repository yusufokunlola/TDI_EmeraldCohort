# Rock, Paper and Scissors Game

import random

# function to get user choice
def get_user_choice():
    while True:
        choice = input("Type rock, paper or scissors: ").lower()
        if choice in ["rock", "paper", "scissors"]:
            return choice
        print("Invalid choice. Please try again.")

# function to get computer choice;
def get_computer_choice():
    return random.choice(["rock", "paper", "scissors"])

def determine_winner(user, computer):
    if user == computer:
        return "It's a tie!"
    if (user == "rock" and computer == "scissors") or \
       (user == "scissors" and computer == "paper") or \
       (user == "paper" and computer == "rock"):
        return "You win!"
    return "Computer wins!"

def play_game():
    print("Welcome to Rock, Paper and Scissors Game!")
    while True:
        user_choice = get_user_choice()
        computer_choice = get_computer_choice()
        
        print(f"\nYou chose: {user_choice}")
        print(f"Computer chose: {computer_choice}\n")
        
        result = determine_winner(user_choice, computer_choice)
        print(result)
        
        play_again = input("\nDo you want to play again? (yes/no): ").lower()
        if play_again != 'yes':
            break

# Run the game
play_game()
