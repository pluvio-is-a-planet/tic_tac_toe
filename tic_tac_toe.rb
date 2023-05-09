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
  attr_accessor :board, :game_is_active, :current_turn, :last_turn

  def initialize
    @board = Array.new(3) { Array.new(3, "-") }
    @game_is_active = true

    puts "Which player starts first? 'X' or 'O'"
    starting_turn = gets.chomp.upcase
    @current_turn = starting_turn
    @last_turn = (current_turn == "X") ? "O" : "X"

    print_board
  end

  def print_board
    puts "   123"
    board.each_with_index do |row, index|
      str = "#{(index + 65).chr}: "
      row.each { |col| str += col}
      puts str
    end
  end

  def play
    puts "Enter position to make your move (Eg. 'a2')>>"

    position = gets.chomp
    row_pos = position[0].upcase.ord - 65
    col_pos = position[1].to_i - 1

    if board[row_pos][col_pos] == "-"
      board[row_pos][col_pos] = current_turn
      print_board

      temp = self.last_turn
      self.last_turn = self.current_turn
      self.current_turn = temp
      # check_win
    else
      puts "You cannot play here, position already taken."
    end

  end
end
