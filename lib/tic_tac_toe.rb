class TicTacToe 
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]  
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
    index = input.to_i - 1 
  end 
    
  def move(index, token = "X")
    @board[index] = token 
  end 
    
  def position_taken?(index)
    if @board[index] == "O" || @board[index] == "X"
      true 
    else
      false 
    end 
  end 
    
  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
      true 
    else 
      false 
    end 
  end 
    
  def turn
    puts "Please enter a value between 1 and 9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, token = current_player)
      display_board
    else 
      puts "The position is already taken."
      turn
    end 
  end 
    
  def turn_count
  count = 0
  @board.each do |index|
    if index == "X" || index == "O"
      count += 1
    end
  end
  count
  end 
    
  def current_player
    turn_count.even? ? "X":"O"
  end 
    
  def won? 
    WIN_COMBINATIONS.each do |win_combination|
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
    false 
  end 
       
  def full?
    @board.all?{ |token| token == "X" || token == "O"}
  end
      
  def draw?
    if full? && !won?
      true
    else
      false
    end 
  end 
    
  def over?
    if full? || draw? || won?
      true
    else
      false 
    end 
  end 
    
  def winner 
    if won?
      return @board[won?[0]]
    end 
  end 
    
  def play 
    puts "Welcome to Tic Tac Toe!"
    until over? 
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end 