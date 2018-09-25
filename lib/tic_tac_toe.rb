class TicTacToe
  
 
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
    ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  
  def position_taken?(index)
    if @board[index] != " "
      true 
    else 
      false 
    end 
  end 
  
  def valid_move?(index)
    if index.between?(0, 8) && position_taken?(index) == false 
      true 
    else 
      false
    end 
  end 
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
 
    
  def won?
    WIN_COMBINATIONS.each do |combo|
     if @board[combo[0]] != " " && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
      return combo 
     end 
    end 
    false 
  end 
  
  
  def full?
   @board.all? do |position|
     position != " "
   end 
  end 
    
  
  
  def draw?
    if full?
      if won? == false
        return true 
      end 
    end 
  end 
  
  def over?
    if won? != false || draw? == true 
      true 
    end 
  
  end 
  
  def winner 
    index = []
    index = won?
    if index == false
      return nil
    else
      if @board[index[0]] == "X"
        return "X"
      else
        return "O"
      end
    end
  end

 
  
 
  def play 
    until over? do
      turn 
    end 
    if winner == "X" or winner == "O" 
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end 
  end 
  
  def turn
    puts "Please enter 1-9"
    index = input_to_index(gets.strip)
    token = current_player
    if valid_move?(index) 
      move(index, token)
      display_board
    else 
      turn 
    end 
  end 

  
  
  def input_to_index(user_input)
    index =-1 + user_input.to_i
  end 
  
  def move(index, token = "X")
    @board[index] = token 
  end 
  
  
  
# end of class 
end 





