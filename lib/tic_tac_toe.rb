class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def display_board
    puts " #{@board[0]} " + "|" + " #{@board[1]} " + "|" + " #{@board[2]} "
    puts "-"* 11
    puts " #{@board[3]} " + "|" + " #{@board[4]} " + "|" + " #{@board[5]} "
    puts "-"* 11
    puts " #{@board[6]} " + "|" + " #{@board[7]} " + "|" + " #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(position, char = "X")
    @board[position] = char
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0, 8) ? true : false
  end

  def turn_count
    count = 0
    @board.each do |position|
      if position != " "
        count += 1
      end
    end
    count
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)

    if valid_move?(index)
      move(index, current_player)
    else
      turn
    end

    display_board
  end

  def won?
    winning_combo = nil
    WIN_COMBINATIONS.each do |combo|
      win_index_1 = combo[0]
      win_index_2 = combo[1]
      win_index_3 = combo[2]

      if (@board[win_index_1] == "X" && @board[win_index_2] == "X" && @board[win_index_3] == "X")
        winning_combo = combo
      elsif (@board[win_index_1] == "O" && @board[win_index_2] == "O" && @board[win_index_3] == "O")
        winning_combo = combo
      else
        false
      end
    end

    winning_combo
  end

  def full?
    if @board.include?(" ")
      false
    else @board.include?("X" || "O")
      true
    end
  end

  def draw?
    if won?
      false
    elsif !(full?)
      false
    else full?
      true
    end
  end

  def over?
   won? || draw? || full? ? true : false
  end

  def winner
    winning_combo = won?

    winning_combo ? @board[winning_combo[0]] : nil
  end

  def play
    while !over?
      turn
    end

    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end
end
