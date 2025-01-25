# Number Guessing Game

import random

def number_guessing_game():
    print("Welcome to the Number Guessing Game!")
    
    while True:
        # Generate a random number between 1 and 20
        secret_number = random.randint(1, 20)
        attempts = 3  # Number of attempts allowed
        
        print("\nI have chosen a number between 1 and 20. Can you guess it?")
        
        for attempt in range(1, attempts + 1):
            try:
                guess = int(input(f"Attempt {attempt}/{attempts}. Enter your guess: "))
                if guess < 1 or guess > 20:
                    print("Please guess a number between 1 and 20!")
                    continue
            except ValueError:
                print("Invalid input. Please enter a valid number.")
                continue

            # Check the guess
            if guess == secret_number:
                print(f"Congratulations! You guessed the number {secret_number} correctly.")
                break
            elif guess < secret_number:
                print("Too low! Try guessing a higher number.")
            else:
                print("Too high! Try guessing a lower number.")
        else:
            # If the player fails after all attempts
            print(f"Sorry, you've used all your attempts. The correct number was {secret_number}.")

        # Ask the player if they want to play again
        play_again = input("\nDo you want to play again? (yes/no): ").strip().lower()
        if play_again != 'yes':
            print("Thanks for playing! Goodbye!")
            break

# Run the game
if __name__ == "__main__":
    number_guessing_game()
