
# **CTI Quiz** 🎮

**CTI Quiz** is an interactive terminal game where you, as a cybersecurity analyst, face the challenge of identifying hacker groups or software based on descriptions. You need to be quick and precise in your choices to uncover cyber threats and avoid getting caught by attacks.

---

## **How to Play**

1. **Start the Game**:
   - The game will present an ASCII banner with the title "CHECK THE INTEL * STOP THE ATTACK!".
   - You'll choose between two game modes: identifying **Software** or **Threat Groups**.

2. **Objective**:
   - For each round, you will be given a description and four options: one correct answer and three incorrect options.
   - Your goal is to select the correct option, which could either be a hacker group or software.

3. **Lives and End of the Game**:
   - You start with 3 lives.
   - If you select the wrong answer, you lose a life. If you lose all your lives, the game ends with an ASCII "YOU'VE BEEN PWND" message.

4. **Post-Game Options**:
   - After losing all your lives, you can choose to restart the game or exit.

---

## **Installation and Running Locally**

Follow these steps to download and run the game on your machine:

### 1. Clone the Repository
Open your terminal and clone the GitHub repository:
```bash
git clone https://github.com/your-username/cyber-intel.git
```
Navigate to the project directory:
```bash
cd cyber-intel
```

### 2. Install Dependencies
Ensure that you have **Python 3.7+** installed on your system.

No external dependencies are required for this game, as it only uses Python's built-in modules.

### 3. Run the Game
Execute the `cyber_intel.py` file from the terminal:
```bash
python cyber_intel.py
```

---

## **How the Game Works**

1. You will be prompted to choose between **Software** or **Threat Groups**.
2. The game will randomly select a description from a dataset (either software or hacker group).
3. You will receive four options: one correct answer and three incorrect ones.
4. If you select the correct answer, you earn points. If not, you lose a life.
5. The game ends once you run out of lives, and you'll be shown your score.

---

## 📂 **Project Structure**

```
cyber-intel/
│
├── cyber_intel.py           # Main game logic
├── hacker_groups.csv        # Dataset containing hacker group information
├── software.csv             # Dataset containing software descriptions
└── README.md                # This file
```

---

## **Game Features**

- **Real Data Descriptions**: Based on real cybersecurity data.
- **Lives System**: Lose lives for incorrect answers.
- **ASCII Art**: Adds a retro touch with unique visuals.
- **Random Questions**: Both software and hacker group questions for varied gameplay.
- **Restart Option**: Start fresh after a "Game Over".


---

## 📜 **License**

This project is licensed under the [MIT License](LICENSE). Feel free to use, modify, and share it. Feel free to contribute!
