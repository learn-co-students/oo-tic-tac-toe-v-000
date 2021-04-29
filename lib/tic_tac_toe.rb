class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
  [0, 1, 2], 
  [3, 4, 5], 
  [6, 7, 8], 
  [0, 4, 8], 
  [2, 4, 6],
  [0, 3, 6], 
  [1, 4, 7], 
  [2, 5, 8]
  ]
  
  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(string)
   string.to_i - 1
  end
  
 def move(index, value = "X")
  @board[index] = value
  end
  
  def position_taken?(index)
  @board[index] == "X" || @board[index] == "O"
  end
  
  def valid_move?(index)
  index.between?(0, 8) && !position_taken?(index)
  end
  
  def turn_count
  @board.count { |turn1| turn1 == "X" || turn1 == "O" }
  end 

  def current_player
  turn_count % 2 == 0? "X" : "O"
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

  def won?
   WIN_COMBINATIONS.find do |win_combination|
        @board[win_combination[0]] == @board[win_combination[1]]  && @board[win_combination[0]] == @board[win_combination[2]] && position_taken?( win_combination[0])
  end
  end
  
  def full?
     @board.all? do |i| 
       i == "X" || i == "O" 
   end
  end 
  
  def draw?
   !won? && full?
  end
  
  def over?
   won? || draw?    
  end
  
   def winner
   if winner1 = won?
      @board[winner1[0]]
   end 
   end 
   
    def play
      while !over?
      turn
    end 
    if won?
        puts "Congratulations #{winner}!"
      else draw?
        puts "Cat's Game!"
    end 
 end 

end 