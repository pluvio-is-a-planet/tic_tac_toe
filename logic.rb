# frozen_string_literal: false

require './display'

module TicTacToe
  def play_turn
    input_position = position
    row_pos = input_position[0].upcase.ord - 65
    col_pos = input_position[1].to_i - 1

    if valid_move?(row_pos, col_pos)
      update_board(row_pos, col_pos)
      check_win
      swap_turn
    else
      puts 'Invalid move, position already taken or does not exist.'
    end
  end

  def valid_move?(row, col)
    board.dig(row, col) && board[row][col] == '-'
  end

  def swap_turn
    temp = current_turn
    self.current_turn = last_turn
    self.last_turn = temp
  end

  def position
    puts "\nCurrent turn: #{current_turn}\nEnter position to make your move (Eg. 'a2')>>"
    gets.chomp
  end

  def play_game
    play_turn while game_is_active
  end

  def check_win
    # set to false if any of the conditions in brackets return true
    if check_horizontal || check_vertical || check_diagonal
      self.game_is_active = false
      puts "Player '#{current_turn}' wins!"
    elsif board.all? { |row| row.all? { |pos| pos != '-' } }
      self.game_is_active = false
      puts 'The game resulted in a tie!'
    end

    prompt_to_play if game_is_active == false
  end

  def check_horizontal
    board.any? do |row|
      row.all? { |pos| %w[X O].include?(pos) && pos == row[0] }
    end
  end

  def check_vertical
    3.times do |col|
      col_match = (0..2).map { |row| board[row][col] }
      return true if col_match.all? { |pos| %w[X O].include?(pos) && pos == col_match[0] }
    end

    false
  end

  def check_diagonal
    [top_to_bot, bot_to_top].any? { |row| row.all? { |pos| %w[X O].include?(pos) && pos == row[0] } }
  end

  def top_to_bot
    (0..2).map { |col| board[col][col] }
  end

  def bot_to_top
    (0..2).map { |col| board[2 - col][col] }
  end
end
