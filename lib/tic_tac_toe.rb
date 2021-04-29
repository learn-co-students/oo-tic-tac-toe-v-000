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

  def move(index, player_token = "X")
    @board[index] = player_token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      puts "Invalid Input. Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
    end
  end

  def turn_count
  counter = 0
    @board.each do |element|
      if element == "X" || element == "O"
      counter += 1
      end 
    end
    return counter
  end
  
  def current_player 
    if turn_count.even?
      player = "X"
    elsif turn_count.odd?
      player = "O"
    end
    return player
  end

  def play
    until over? 
      turn
    end
    if draw?
      puts "Cat's Game!"
    end
      puts "Congratulations #{winner}!"
  end

  def won?
    WIN_COMBINATIONS.detect do |winning_combo|
    @board[winning_combo[0]] == @board[winning_combo[1]] &&
    @board[winning_combo[1]] == @board[winning_combo[2]] &&
    position_taken?(winning_combo[0])
    end
  end

  def full?
    @board.all? do |free|
    free == "X" || free == "O"
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if won?
      @board[won?.first]
    else
      nil
    end
  end

end


