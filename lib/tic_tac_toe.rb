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
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    location = input.to_i-1
  end

  def move(location, current_player = "X")
    location = input_to_index(location)
    @board[location] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(location)
    location = input_to_index(location)
    location.between?(0,8) && !position_taken?(location)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |position|
      if position == "X" || position == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else 
      return "O"
    end
  end

  def won?
    empty = @board.all? do |position|
      position == " "
    end
    if empty 
      return false
    end
    WIN_COMBINATIONS.each do |combo|
      position_1 = @board[combo[0]]
      position_2 = @board[combo[1]]
      position_3 = @board[combo[2]]
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return combo
      end
    end
    false
  end

  def full?
    @board.none?{|position| position == " "}
  end

  def draw?
    if !won? && full?
      return true
    end
  end

  def over?
    if won? != false
      return true
    elsif  draw? == true
      return true
    else
      false
    end
  end

  def winner
    WIN_COMBINATIONS.each do |combo|
      position_1 = @board[combo[0]]
      position_2 = @board[combo[1]]
      position_3 = @board[combo[2]]
      if (position_1 == "X" && position_2 == "X" && position_3 == "X")
        return "X"
      elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return "O"
      end
    end
    if won? != true
      return nil
    end
    false
  end

  def play
    counter = 0
    until over?
      turn
      counter += 1
    end
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    elsif winner != "X" || "O"
      puts "Cats Game!"
    end
  end
end






