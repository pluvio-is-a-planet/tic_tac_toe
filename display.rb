# frozen_string_literal: false

require_relative 'logic.rb'
require 'io/console'

module Display
  include TicTacToe

  def print_board
    $stdout.clear_screen
    puts "\n   1 2 3"
    board.each_with_index do |row, index|
      row_str = "#{(index + 65).chr}: " # Get the alphabetical representation of the index
      row_pos_str = ''
      row.each { |col| row_pos_str += col }
      row_pos_str = row_pos_str.split('').join(' ') # Add a space between all the available positions
      puts row_str + row_pos_str
    end
  end

  def update_board(row, col)
    board[row][col] = current_turn
    print_board
  end

  def prompt_to_play
    puts 'Would you like to play another game of Tic-Tac-Toe? (y/n)>>'
    user_yes_no = gets.chomp.downcase

    if user_yes_no == 'y'
      Board.new
    else
      puts 'Thank you for playing!'
    end
  end
end
