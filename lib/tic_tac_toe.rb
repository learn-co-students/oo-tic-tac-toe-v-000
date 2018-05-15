class TicTacToe 
  WIN_COMBINATIONS = [
  [0, 1, 2], # top row
  [3, 4, 5], # middle row
  [6, 7, 8], # bottom row
  [0, 3, 6], # left column
  [1, 4, 7], # middle column
  [2, 5, 8], # right column
  [0, 4, 8], # diagonal 1
  [2, 4, 6]  # diagonal 2
]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
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
  
  def move(index, current_player = "X")
    @board[index] = current_player
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
      turn
    end
  end
  
  def turn_count
    counter = 0;
    
    @board.each do |position|
      if position == "X" || position == "O"
        counter += 1 
      end
    end
    
    counter
  end
  
  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
         (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination
      end
    end
    false
  end
  
  def full?
    @board.each do |position|
      if position == " " || position == "" || position == nil 
        return false
      end
    end
    true
  end
  
  def draw?
    !won? && full?
  end
  
  def over?
    if won? || draw? || full?
      return true
    end
  end
  
  def winner
    if !won?
      return nil
    end
    winning_combination = won?
    player = @board[winning_combination[0]]
    return player
  end
  
  def play
    count = 0
  
    while count < 9
      count += 1
      
      if !over?
        turn
      elsif won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
      
    end
    
  end



end 

