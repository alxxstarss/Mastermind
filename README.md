# Mastermind

Mastermind game made in Motorola 68k Assembly

# Mastermind in 68k Assembly

A classic Mastermind game developed entirely in Motorola 68000 Assembly. The game runs in a custom graphical interface and handles the logic for comparing secret combinations.

## Game Overview

<img width="1118" height="904" alt="{64B65AF1-F526-4D9D-A5EE-7C9DE7F59D51}" src="https://github.com/user-attachments/assets/138b611c-2b3f-43dc-9f1e-65f194146804" />

## How to Run the Project

This project requires the **EASy68K** emulator to be assembled and executed.

1. **Download and install** [EASy68K](http://www.easy68k.com/).
2. **Open the main source file** in the EASy68K editor.
3. **Assemble the code** by pressing `F9` (Project > Assemble).
4. **Launch the simulator** by pressing `F10` (Project > Execute).
5. Press the **Play** button in Sim68K to start the game. A 900x700 pixel window with a green background will open to display the game.

## Code Logic

The game uses a modular architecture separating graphical calls from the game logic.

### Secret Code Random Generation

The secret code is not fixed. Each new game generates a new combination:

* **Time-based seed:** The `TIMER_SEED` routine calls the system (Trap #15) to retrieve the system clock time and use it as the initial seed.
* **Random calculation:** The `INIT_RANDOM_SEED` routine then uses this seed to perform a mathematical calculation (multiplication, addition, and division by 10) to isolate the remainder and obtain a random digit between 0 and 9.

### Checking Algorithm (Correct Position / Wrong Position)

To compare the player's guess with the secret code, the program uses two passes and markers (`PLACE_SECRET` and `PLACE_CHOISI`) to prevent duplicates:

1. **Correctly placed elements:** The `BIEN_PLACE` routine compares the indices one by one[cite: 3]. If an exact match is found, the position is "marked" in both the secret array and the player's array with a "1".
2. **Incorrectly placed elements:** The `MAL_PLACE` routine compares the remaining digits while systematically ignoring those that were previously marked during the previous step.

## Game Rules

* The computer generates a secret code consisting of 5 digits (from 0 to 9).
* You have 10 attempts to guess it.
* Enter a combination of 5 digits and press Enter. Input is validated and only numeric characters are accepted.
* The game tells you how many digits are in the correct position and how many are correct but in the wrong position.
