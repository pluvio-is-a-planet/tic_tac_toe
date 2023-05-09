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
    play_game
  end

  private

  def print_board
    puts "\n   1 2 3"
    board.each_with_index do |row, index|
      row_str = "#{(index + 65).chr}: " # Get the alphabetical representation of the index
      row_pos_str = ""
      row.each { |col| row_pos_str += col}
      row_pos_str = row_pos_str.split("").join(" ") # Add a space between all the available positions
      puts row_str += row_pos_str
    end
  end

  def play_turn
    puts "\nCurrent turn: #{current_turn}"
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
      check_win
    else
      puts "You cannot play here, position already taken."
    end

  end

  def play_game
    while game_is_active
      play_turn
    end

    puts "Player '#{last_turn}' wins!"
  end

  def check_win
    # set to false if any of the conditions in brackets return true
    self.game_is_active = !(self.check_horizontal || self.check_vertical || self.check_diagonal)
  end

  def check_horizontal
    board.any? do |row|
      row.all? { |pos| pos == "X" } || row.all? { |pos| pos == "O" }
    end
  end

  def check_vertical
    for col in 0..2 do
      result = false
      col_match = Array.new()

      for row in 0..2 do
        col_match.push(board[row][col])
      end

      if col_match.all? { |pos| pos == "X" } || col_match.all? { |pos| pos == "O" }
        result = true
        break
      end

    end

    result
  end

  def check_diagonal
    top_to_bot = Array.new()
    bot_to_top = Array.new()

    reverse_index = 2
    for col in 0..2 do
      top_to_bot.push(board[col][col])
      bot_to_top.push(board[reverse_index][col])
      reverse_index -= 1
    end

    result = (top_to_bot.all? { |pos| pos == "X" } || top_to_bot.all? { |pos| pos == "O" }) ||
    (bot_to_top.all? { |pos| pos == "X" } || bot_to_top.all? { |pos| pos == "O" })

    result
  end
end
