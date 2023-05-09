# Tic-Tac-Toe

This is a command-line based Tic-Tac-Toe game, coded entirely in Ruby.
Completed for The Odin Project's "<strong>Ruby</strong>" course.

This program consists of 4 files:
 - 'main.rb'
 - 'logic.rb'
 - 'board.rb'
 - 'display.rb'

# The main.rb file
  This is the file where the 'start_game' function exists, which creates
  the 'game' object of the Board class. Linked to the 'logic.rb',
  'board.rb', and 'display.rb' files.

# The logic.rb file
  This is where the main functionality of the game is handled, like
  allowing the user to make their move by entering a
  coordinate (Eg. 'a2'). This is also where the validity of the
  player's input is checked, and where the program keeps track of the
  state of the game.

# The board.rb file
  This is where the 'Board' class exists, which is used to create the
  'game' object in the start_game method inside the main.rb file. This
  is also where the user chooses which player makes the first move by
  entering 'X' or 'O', the program ensures that the player enters
  either 'X' or 'O' as the first character of their input.

# The display.rb file
  This is where the state of the game is displayed.
