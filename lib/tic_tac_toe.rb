class TicTacToe
  def initialize()
    @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2], # top row
    [3,4,5], # middle row
    [6,7,8], # bottom row
    [0,3,6], # left column
    [1,4,7], # middle column
    [2,5,8], # right column
    [0,4,8], # back diagonal
    [2,4,6]  # forward diagonal
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    index = input.to_i - 1
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      true
    else
      false
    end
  end
  
  def valid_move?(position)
    if !position_taken?(position) && position.between?(0,8)
      true
    else
      false
    end
  end
  
  def turn
    token = current_player
    puts "Enter a valid position(1-9): "
    input = gets.strip
    index = input_to_index(input)
    
    if valid_move?(index)
      move(index, token)
    else
      until valid_move?(index)
         puts "Enter a valid position(1-9): "
        input = gets.strip
        index = input_to_index(input)
      end
      move(index, token)
    end
    display_board
  end
  
  def turn_count
    count = 0
    @board.each do |element|
      if element == "X" || element == "O"
        count += 1
      end
    end
    return count
  end
  
  def current_player
    count = turn_count
    if count.even?
      token = "X"
    else 
      token = "O"
    end
  end
  
  def won?
    WIN_COMBINATIONS.detect do |combo|
      index_one = combo[0]
      index_two = combo[1]
      index_three = combo[2]
      
      first_pos = @board[index_one]
      second_pos = @board[index_two]
      third_pos = @board[index_three]
      
      if first_pos == "X" && second_pos == "X" && third_pos == "X"
        true
      elsif first_pos == "O" && second_pos == "O" && third_pos == "O"
        true
      else
        false
      end
    end
  end
  
  def full?
    @board.none? do |element|
      if element != "X" && element != "O"
        true
      else
        false
      end
    end
  end
  
  def draw?
    if full? && !won?
      true
    else 
      false
    end
  end
  
  def over?
    if full? || won? || draw?
      true
    else
      false
    end
  end
  
  def winner
    winning_combo = won?
    if winning_combo.class != Array
      nil
    else 
      winning_position = winning_combo[0]
      winning_token = @board[winning_position]
    end
  end
  
  def play 
    until over?
      turn
    end
    
    if winner != nil
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end 