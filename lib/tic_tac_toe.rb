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
  input.to_i - 1 
  end
  
  def move(index, player = "X")
    @board[index] = player
  end
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
   if index.between?(0,8) && !position_taken?(index)
     true
   else
     false
   end 
  end
  
  def turn_count
     @board.select { |index| index == "X" or index == "O"}.length 
  end 
    
  def current_player
    if turn_count % 2 == 0 
      return "X"
    else
      return "O"
    end 
  end 
  
  def won?
    WIN_COMBINATIONS.find do |wc|
    if @board[wc[0]] == "X" && 
       @board[wc[1]] == "X" && 
       @board[wc[2]] == "X"
       return wc
    elsif @board[wc[0]] == "O" && 
          @board[wc[1]] == "O" && 
          @board[wc[2]] == "O"
          return wc
    else 
      false 
    end
    end
  end

  def full?
    !@board.include?(" ")
  end 
  
  def draw?
    if won?
      false
    elsif full?
      true 
    else 
      false 
    end
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.chomp 
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else turn
    end
  end 
  
  
  def over?
    if won? || draw? || full?
      true
    else
      false
    end 
  end
  
  def winner
    if won?
      return @board[won?[0]]
    else 
      nil  
    end 
  end
  
  def play
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