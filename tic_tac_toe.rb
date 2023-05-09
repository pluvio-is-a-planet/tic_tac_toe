# board:
#   □□□
#   □□□
#   □□□

# first play is "X"
# check the last player to determine the next player
# if either player gets 3 squares in a row, column, or diagonal line, they win
#   get the position of where to place the shape
#   check if there's a winner at the end of every move made

# board class
# init array of arrays with positions
# board instance var
# current play instance var
# play method
# check winner method
class GameBoard
  attr_accessor :board

  def initialize
    @board = Array.new(3, Array.new(3, "-"))
    # print_board
  end
end
