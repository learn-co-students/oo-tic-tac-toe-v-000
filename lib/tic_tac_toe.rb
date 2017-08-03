class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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
    row_dashes = "-----------"
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "#{row_dashes}"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "#{row_dashes}"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    return "#{user_input}".to_i - 1
  end

  def move(index, character)
    @board[index] = character
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      false
    else
      true
    end
  end

  def valid_move?(index)
    if position_taken?(index)
      false
    elsif index < 0 || index > 8
      false
    else
      true
    end
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    player = current_player
    if valid_move?(index)
      move(index, character = player)
      display_board
    else
      puts "Please enter 1-9:"
      user_input = gets.strip
      index = input_to_index(user_input)
    end
  end

  def turn_count
    counter = 0
    @board.each do |index|
      if index == "X" || index == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player
    if turn_count.even?
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
  end

  def full?
    @board.none?{|i| i == nil || i == " " || i == ""}
  end

  def draw?
    if !won? && full?
      true
    else
    end
  end

  def over?
    if won? || draw?
      true
    end
  end

  def winner
    win_index = won?
    if win_index != nil
      return @board[win_index[0]]
    else
    end
  end

  def play
    until over?
      turn
    end
    if won?
      winner
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
