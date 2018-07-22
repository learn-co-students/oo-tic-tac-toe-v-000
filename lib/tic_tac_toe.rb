class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9," ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2], # top row win
    [3,4,5], # middle row win
    [6,7,8], # bottom row win
    [0,3,6], # left column win
    [1,4,7], # middle column win
    [2,5,8], # right column win
    [0,4,8], # left diagonal win
    [2,4,6]  # right diagonal win
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
    return index
  end
  
  def move(index, token)
    @board[index] = token
  end
  
  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      return true
    else @board[index] != " " || @board[index] != "" || @board[index] != nil
      return FALSE
    end
  end
  
  def valid_move?(index)
    if index.between?(0,8) && (position_taken?(index) == FALSE)
      return true
    end
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets
    index = input_to_index(input)
    if valid_move?(index)
      move(index,current_player)
    else
      while !valid_move?(index)
        puts "Please enter 1-9:"
        input = gets
        index = input_to_index(input)
      end
      move(index,current_player)
    end
    display_board
  end
  
  def turn_count
    count = 0
    @board.each do |token|
      if token == "O" || token == "X"
        count += 1
      end
    end
    return count
  end

  def current_player
    if turn_count == 0
      return "X"
    elsif turn_count.even?
      return "X"
    else turn_count.odd?
      return "O"
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    position_1 = @board[win_index_1] # load the value of the board at win_index_1
    position_2 = @board[win_index_2] # load the value of the board at win_index_2
    position_3 = @board[win_index_3] # load the value of the board at win_index_3
    
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination
      end
    end
    return false
  end

  def full?
    @board.each do |i|
      if i == "" || i == " " || i == nil
        return FALSE
      end
    end
  end
  
  def draw?
    return full? && won? == FALSE
  end

  def over?
    won? || draw?
  end

  def winner
    combination = won?
    if(combination)
      if(@board[combination[0]] =='X') 
        return 'X'
      else 
        return 'O'
      end
    else
      nil
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