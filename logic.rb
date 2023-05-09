module TicTacToe
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
  end

  def check_win
    # set to false if any of the conditions in brackets return true
    if self.check_horizontal || self.check_vertical || self.check_diagonal
      self.game_is_active = false
      puts "Player '#{last_turn}' wins!"
    elsif board.all? { |row| row.all? { |pos| pos != "-"}}
      self.game_is_active = false
      puts 'The game resulted in a tie!'
    end
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
