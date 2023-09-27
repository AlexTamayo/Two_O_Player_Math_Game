# Two'O Player Math Game

## Overview

Two'O Player Math is a CLI-based game built in Ruby where multiple players can play together, solving math problems to gain points. The game keeps track of each player's score and lives. The aim is to achieve a high score without losing all of your lives.

## How to Run

1. Open your terminal and navigate to the `two_o_player_math_game` directory.
2. Run `ruby main.rb`.

## Media

https://github.com/AlexTamayo/Two_O_Player_Math_Game/assets/3316856/e78a3454-e20d-4c47-8501-3e519bef9207

## Files and Classes

### `main.rb`

This is the entry point for the game. It requires other Ruby files and initiates the `GameLogic` class.

### `player.rb`

Defines the `Player` class, which includes attributes like score, lives, and name. Methods for updating score and lives are also included.

### `math_problem.rb`

Defines the `MathProblem` class, which generates math problems and verifies answers. It supports four operations: addition, subtraction, multiplication, and division.

### `game_logic.rb`

This is where the main game logic resides. It takes care of:

- Number of players
- Player creation
- Scoring system
- Player turns
- Game over condition

## Gameplay

1. The game will prompt for the number of players.
2. Each player will enter their name (or use a default name).
3. Players will take turns to solve math problems.
4. Each correct answer earns a point.
5. Each wrong answer results in the loss of a life.
6. A player gets eliminated after losing all lives.
7. The game ends when only one player remains or when a player reaches a high score.
