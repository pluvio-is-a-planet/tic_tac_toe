# frozen_string_literal: false

require_relative 'display'

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
      puts 'Invalid move, position already taken or does not exist. Make sure you used the right format.'
    end
  end

  def valid_move?(row, col)
    board.dig(row, col) && board[row][col] == '-'
  end

  def swap_turn
    self.current_turn, self.last_turn = last_turn, current_turn
  end

  def position
    puts "\nCurrent turn: #{current_turn}\nEnter position to make your move (Eg. 'a2')>>"
    gets.chomp
  end

  def play_game
    play_turn while game_is_active
  end

  def check_win
    if win?
      self.game_is_active = false
      puts "Player '#{current_turn}' wins!"
    elsif tie?
      self.game_is_active = false
      puts 'The game resulted in a tie!'
    end

    prompt_to_play unless game_is_active
  end

  private

  def win?
    check_horizontal || check_vertical || check_diagonal
  end

  def tie?
    board.all? { |row| row.none?('-') }
  end

  def check_horizontal
    board.any? { |row| row.uniq.size == 1 && %w[X O].include?(row[0]) }
  end

  def check_vertical
    (0..2).any? { |col| (0..2).all? { |row| board[row][col] == board[0][col] && %w[X O].include?(board[row][col]) } }
  end

  def check_diagonal
    top_to_bot = (0..2).map { |col| board[col][col] }
    bot_to_top = (0..2).map { |col| board[2 - col][col] }
    [top_to_bot, bot_to_top].any? { |row| row.uniq.size == 1 && %w[X O].include?(row[0]) }
  end
end
