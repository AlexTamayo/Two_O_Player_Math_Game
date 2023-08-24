=begin

Example prompt

Player 1: What does 5 plus 3 equal?
> 9
Player1: Seriously? No!

P1: 2/3 vs P2: 3/3
----- NEW TURN -----
Player 2: What does 2 plus 6 equal?
> 8
Player 2: YES! You are correct.
----- NEW TURN -----
... some time later ...
Player 1 wins with a score of 1/3
----- GAME OVER -----
Good bye!

Task 1: Extract Nouns for Classes
Player
MathProblem
Renderer

Task 2: Write their roles

Player - will keep information about the player, like lives and score.
MathProblem - Will produce the various math problems and their respective solutions.
Renderer - Will render the information from Player and MathProblem into the console.

=end

require "./player"