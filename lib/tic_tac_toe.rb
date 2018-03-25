

class TicTacToe 
  
  def initialize (board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  
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
    puts " #{@board[index] = token} | #{@board[index] = token} | #{@board[index] = token} "
    puts "-----------"
    puts " #{@board[index] = token} | #{@board[index] = token} | #{@board[index] = token} "
    puts "-----------"
    puts " #{@board[index] = token} | #{@board[index] = token} | #{@board[index] = token} "
  end 
  
  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end
  
  def valid_move?(index)
    index.between?(0,8) && position_taken?(index) == false
  end
  
  def turn_count
    x = 0 
    @board.each do |i|
      if i == "X" || i == "O"
        x = x + 1 
      end
    end
      return x 
  end
  
  def current_player
    if turn_count % 2 == 0
      return "X"
    else 
      return "O"
    end
  end
  
  def turn 
    puts "Please enter a number 1-9"
     i = gets.to_i
     index = input_to_index(i)
    if valid_move?(index)
      move(index, current_player)
    else
      turn 
    end
    display_board
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
       @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && position_taken?(combo[0]) 
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
     won?  || full? || draw?
  end

  def winner
    if won? != nil 
    winner = @board[won?[0]]
    else
      return nil
    end
  end 

  def play
      while over? == false
        turn
      end
      if won?
        puts "Congratulations #{winner}!"
      else
        puts "Cat's Game!"
      end
  end 




end











