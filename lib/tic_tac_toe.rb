class TicTacToe
  def initialize(board = Array.new(9, " "))
  @board = board
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
  
  def input_to_index(number)
  number.to_i - 1
  end
  
  def move(index, character)
  @board[index] = character
  end
  
  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil 
    return false 
  else 
    return true
  end
  end

  def valid_move?(index)
    if @board[index] == " " && index.between?(0,8)
    return true
  end
  end 
  
  def turn_count
  count = 0 
  @board.each do |space|
    if space =="X" || space =="O"
      count = count + 1
    end
  end
  return count
  end
  
  def current_player
   if turn_count.even? 
    return "X"
  else
    return "O"
  end
  end
  
  def turn
  puts "Please enter 1-9:"
  index = gets.chomp 
  index = input_to_index(index)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else 
    turn
  end
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1=win_combination[0]
      win_index_2=win_combination[1]
      win_index_3=win_combination[2]
      position_1=@board[win_index_1]
      position_2=@board[win_index_2]
      position_3=@board[win_index_3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      else
        false 
      end
    end
  false
  end 
  
  def full?
  @board.all? do |space|
    space != " "
  end
end

  def draw?
  won? == false && full? == true 
  end

  def over?
  won? || draw? || full?
  end

  def winner
    if won?
    return @board[won?[0]]
  else 
    return nil
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