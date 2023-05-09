module Display
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
end
