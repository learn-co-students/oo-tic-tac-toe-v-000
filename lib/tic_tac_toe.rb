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

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player)
   @board[index] = current_player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if @board[index] == " " && index.between?(0 , 8)
      return true
    end
  end

  def turn_count
  count = 0
  @board.each do |player|
    if player == " "
      count += 0
    else count += 1
    end
  end
  turn_count = count
  end

  def current_player
    turn_count.even? == true ? current_player = "X" : current_player = "O"
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index) == true
      move(index, current_player)
      display_board
    else puts "Move is invalid"
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if @board[combo[0]] == "X" && @board[combo[1]] == "X" &&
         @board[combo[2]] == "X"
      return combo
    elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" &&
          @board[combo[2]] == "O"
      return combo
    else
      end
    end
    return false
  end

  def full?
   @board.none?{|position| position == " "}
  end

  def draw?
    if won? == false && full? == true
      return true
    else  full? == false
      return false
    end
  end

  def over?
    if draw? == true || won? != false
      return true
    elsif full? == false
      return false
    else
    end
  end

  def winner
    WIN_COMBINATIONS.each do |combo|
      if @board[combo[0]] == "X" && @board[combo[1]] == "X" &&
         @board[combo[2]] == "X"
      return "X"
    elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" &&
          @board[combo[2]] == "O"
      return "O"
    else
    end
   end
   return nil
  end

  def play
  until over? == true
    turn_count
    current_player
    turn
    end
    if won? != false && winner == "X"
      puts "Congratulations X!"
    elsif won? != false && winner == "O"
      puts "Congratulations O!"
    else draw? == true
      puts "Cat's Game!"
    end
  end
  
end