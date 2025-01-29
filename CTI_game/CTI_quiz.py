import csv
import random
import os

# Set the working directory to the directory where the script is located
script_dir = os.path.dirname(os.path.abspath(__file__))
os.chdir(script_dir)

threat_csv = "hacker_groups.csv"
software_csv = "software.csv"

# Load data
def load_data(file, name_field, description_field):
    data = []
    with open(file, mode='r', encoding='utf-8') as f:
        reader = csv.DictReader(f, delimiter=';')
        for row in reader:
            data.append({"Name": row[name_field], "Description": row[description_field]})
    return data

# Introductory screen
def show_intro_screen():
    intro_banner = r"""

                             .+@@=@#..                     
                            -@@@@@@@*:-.                   
                          .-@@@@@@@@%..=                   
                          :@@@@@@@@@%..*:                  
                         .%@@@@@@@@@%..*@:                 
                        .*@@@@@@@@@@:..*@*                 
                       .*@@@@@@@@@@@@@@@@@*.               
                      :@@@@@- ..::... .-@@@@.              
                      *@@@@@#.        .*@@@@@.             
                      -@@@@@@-        -@@@@@=              
                        +@@@@@:......=@@@@@*               
                    ..:#@@@@@@@=    *@@@@@@@%*.           
                :#@@@@@@@@@@@@@@@+*@@@@@@@@@@@@@%*-.      
             .%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-     
             .*@-...................:::------====:.@*.    
             .+@+@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:%@-..   
            :@@@+@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#.@@@#.   
           .=@@@*#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*=@#+*+.  
           .%%#@%:@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-#@@*:#=. 
         .%%#@@@@**@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#-@@@@@@%== 
         #@@@@@@@%-@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-+@%%@##+++ 
         +@@@@@@@@=@@@@@@@@@@@@@@@@@@@@@@@@@@@@@.#@@@@@%+** 

   
                 CHECK THE INTEL * STOP THE ATTACK! 

  
     __________________________      __________________________
    |                          |    |                          |      
    |     <1 for SOFTWARE>     |    |   <2 for THREAT GROUPS>  |                            
    |__________________________|    |__________________________|
      
"""
    os.system('cls' if os.name == 'nt' else 'clear')
    print(intro_banner)

    while True:
        choice = input("\nChoose your game mode (1 or 2): ").strip()
        if choice in ['1', '2']:
            return int(choice)
        else:
            print("Invalid input. Please type 1 or 2.")

# Generate random question
def generate_question(data):
    correct = random.choice(data)  # Select a random entry
    incorrect_options = random.sample([d for d in data if d != correct], 3)  # Three incorrect options
    options = incorrect_options + [correct]  # Combine correct and incorrect options
    random.shuffle(options)  # Shuffle the options
    return correct, options

# Display a question with better spacing and a fixed lives counter
def ask_question(correct, options, question_count, lives, score):
    os.system('cls' if os.name == 'nt' else 'clear')  # Clear the terminal
    print(f"Lives: {lives} | Score: {score}")
    print(f"\n{'=' * 50}")  # Separator line
    print(f"** Question {question_count} **")
    print(f"\nDescription:\n{correct['Description']}\n")
    print("Options:")
    for i, option in enumerate(options, 1):
        print(f"  {i}. {option['Name']}")
    print(f"\n{'=' * 50}")  # Closing separator
    return correct, options

# Display the "YOU'VE BEEN PWND" ASCII art with a skull
def show_hacker_ascii():
    skull_ascii = r'''


        
          uu$$$$$$$$$$$$$$$$$uu
        u$$$$$$$$$$$$$$$$$$$$$$$u
       u$$$$$$$$$$$$$$$$$$$$$$$$$u
       u$$$$$$$$$$$$$$$$$$$$$$$$$u        
       "$$$$u"   "uu$uu"   "u$$$$"              
        $$$u       u$u       u$$$        
        $$$u      u$$$u      u$$$
         "$$$$uu$$$u|u$$$uu$$$$"
          "$$$$$$$"   "$$$$$$$"
            u$$$$$$$u$$$$$$$u
             u$"$"$"$"$"$"$u
  uuu        $$u$ $ $ $ $u$$       uuu
 u$$$$        $$$$$u$u$u$$$       u$$$$
  $$$$$uu                      uu$$$$$$
u$$$$$$$$$$$uu             uuuu$$$$$$$$$$
$$$$"""$$$$$$$$$$uuu   uu$$$$$$$$$"""$$$"
 """      ""$$$$$$$$$$$uu ""$"""
           uuuu ""$$$$$$$$$$uuu
  u$$$uuu$$$$$$$$$uu ""$$$$$$$$$$$uuu$$$
  $$$$$$$$$$""""           ""$$$$$$$$$$$"
   "$$$$$"                      ""$$$$""   
     $$$"                         $$$$" 


 /$$$$$$$  /$$      /$$ /$$   /$$ /$$$$$$$ 
| $$__  $$| $$  /$ | $$| $$$ | $$| $$__  $$
| $$  \ $$| $$ /$$$| $$| $$$$| $$| $$  \ $$
| $$$$$$$/| $$/$$ $$ $$| $$ $$ $$| $$  | $$ 
| $$____/ | $$$$_  $$$$| $$  $$$$| $$  | $$ 
| $$      | $$$/ \  $$$| $$\  $$$| $$  | $$ 
| $$      | $$/   \  $$| $$ \  $$| $$$$$$$/
|__/      |__/     \__/|__/  \__/|_______/ 

    '''
    os.system('cls' if os.name == 'nt' else 'clear')
    print(skull_ascii)

# Handle end-of-game options
def game_over(score, questions_answered):
    show_hacker_ascii()
    print(f"Game Over! You answered {questions_answered} questions with a final score of {score}.")
    while True:
        choice = input("restart? (yes/no): ").strip().lower()
        if choice in ['yes', 'y']:
            return True  # Restart the game
        elif choice in ['no', 'n']:
            print("Thank you for playing! Goodbye!")
            return False  # End the game
        else:
            print("Invalid input. Please type 'yes' or 'no'.")

# Main game logic
def play_game(data):
    score = 0
    lives = 3
    questions_answered = 0

    while lives > 0:
        questions_answered += 1
        correct, options = generate_question(data)
        correct, options = ask_question(correct, options, questions_answered, lives, score)

        # Ask the player for their answer
        try:
            answer = int(input("\nChoose an option (1-4): "))
            if options[answer - 1]['Name'] == correct['Name']:
                print("\nCorrect! 🎉")
                score += 1
            else:
                print(f"\nWrong! The correct answer was: {correct['Name']}")
                lives -= 1
        except (ValueError, IndexError):
            print("\nPlease choose a valid number between 1 and 4.")
            continue

    return score, questions_answered

# Run the program
if __name__ == "__main__":
    while True:
        choice = show_intro_screen()  # Show the introductory screen

        if choice == 1:
            # Play the software game
            software_data = load_data(software_csv, "software_name", "software_description")
            score, questions = play_game(software_data)
        elif choice == 2:
            # Play the threat groups game
            threat_data = load_data(threat_csv, "Name", "Description")
            score, questions = play_game(threat_data)

        # End of the game
        if not game_over(score, questions):
            break
