
# **Guess the Hacker** 🎮

**Guess the Hacker** is an interactive terminal game where players take on the role of cybersecurity analysts. Your mission is to identify hacker groups and software based on their descriptions. Do you have what it takes to outsmart cybercriminals and protect the digital world?

---

## 📖 **How to Play**

1. **Start the Game**:
   - Upon starting the game, an ASCII banner will display the title "GUESS THE HACKER".
   - The game will present a description of a hacker group or software.

2. **Objective**:
   - Identify the correct hacker group or software from 4 options.
   - Correct answers earn points, while incorrect answers cost you a life.

3. **Lives and End of the Game**:
   - You start with 3 lives.
   - Losing all lives ends the game, and you will be shown a "YOU'VE BEEN PWND" message.

4. **Post-Game Options**:
   - After losing all lives, you can choose to restart the game or quit.

---

## 🛠️ **Installation and Local Execution**

Follow these steps to download and run the game on your machine:

### 1. Clone the Repository
Open your terminal and clone the GitHub repository:
```bash
git clone https://github.com/your-username/guess-the-hacker.git
```
Navigate to the project directory:
```bash
cd guess-the-hacker
```

### 2. Install Dependencies
Ensure you have **Python 3.7+** installed on your system.

There are no external dependencies required for this game as it only uses Python's built-in modules.

### 3. Run the Game
Execute the `guess_the_hacker.py` file from the terminal:
```bash
python guess_the_hacker.py
```

---

## 🧑‍💻 **How It Works**

The game uses a dataset of hacker groups and software to generate random questions. Here's the main flow:

1. A hacker group or software is randomly chosen as the correct answer.
2. The player is presented with four options (one correct and three incorrect).
3. The player selects an option by typing a number between 1 and 4.
4. If the selection is incorrect, the player loses a life. If correct, they gain a point.

---

## 📂 **Project Structure**

```
guess-the-hacker/
│
├── guess_the_hacker.py     # Main game code
├── hacker_groups_cleaned.csv  # Dataset with hacker group information (optional)
├── software_cleaned.csv      # Dataset with software descriptions (optional)
└── README.md               # This file
```

---

## 🚀 **Game Features**

- **Narrative Descriptions**: Based on real cybersecurity data.
- **Lives System**: Lose lives for incorrect answers.
- **ASCII Art**: Adds a retro touch to the game.
- **Random Questions**: Dynamic questions from both hacker groups and software for replayability.
- **Restart Option**: Start a new game after "Game Over".

---

## 🏆 **Can You Win?**
See how many hacker groups or software you can identify before losing all your lives! Share your score and challenge your friends.

---

Do you have suggestions or improvements? Feel free to contribute! 🎉

---

## 📜 **License**

This project is licensed under the [MIT License](LICENSE). Feel free to use, modify, and share it.
