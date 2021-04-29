class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
 
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  WIN_COMBINATIONS =[
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [2,4,6],
    [0,4,8]
  ]

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(index)
     if @board[index] == "X" || @board[index] == "O"
      true
    else @board[index] == " " || "" || nil
      false
    end
  end

  def valid_move?(index)
     if index.between?(0, 8) == true && position_taken?(index) == false
  return true
  else
    return false
   end
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
    WIN_COMBINATIONS.each do |combination|
      win_index_1 = combination[0]
      win_index_2 = combination[1]
      win_index_3 = combination[2]
  
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
  
      if position_1 == position_2 && position_2 == position_3 && position_1 != " "
        return combination
      end
    end
    return false
  end

  def full?
      if @board.all? {|value| value == "X" || value == "O"}
        true
     else
        false
     end
  end

  def draw?
    if !won? && full?
      return true
    else
      return false
    end
  end

  def over?
    if won? || full? || draw?
      return true
    else
      return false
    end
  end

  def winner
    if won?
      @board[won?[0]]
    else return nil
    end
  end

  def play
     while !over?
    turn
  end
  if won?
    puts"Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
  end
  
end 