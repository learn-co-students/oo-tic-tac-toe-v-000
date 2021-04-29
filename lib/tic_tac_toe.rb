class TicTacToe
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
    
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    index = input.to_i-1
  end
  
  def move(index, token="X")
    if valid_move?(index)
      @board[index] = token
    end
  end
  
  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false
    else
      return true
    end
  end
  
  def valid_move?(index)
    if position_taken?(index) || @board[index] == "X" || @board[index] == "O" || index < 0 || index > 8
      return false
    else
      return true
    end
  end

  def turn_count
    count = 0
    @board.each do|turn|
      if turn == "X" || turn == "O"
        count += 1
      end
    end
    return count
  end

  def current_player
    if turn_count % 2 == 0 || turn_count == 0
      return "X"
    else
      return "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    index = input_to_index(gets.strip)
    if index < 9 && index >= 0
      move(index, current_player)
      display_board
    else turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do|combination|
      win_index1 = combination[0]
      win_index2 = combination[1]
      win_index3 = combination[2]
      
      position1 = @board[win_index1]
      position2 = @board[win_index2]
      position3 = @board[win_index3]
      
      if (position1 == "X" && position2 == "X" && position3 == "X") ||
         (position1 == "O" && position2 == "O" && position3 == "O") 
        return combination
      end
    end
    return false
  end
  
  def full?
    @board.all?{|i| i == "X" || i == "O"}
  end
  
  def draw?
    return !won? && full?
  end
  
  def over?
    return won? || draw?
  end
  
  def winner
    if won?
     won?.all? do|position|
       if @board[position] == "X"
         return "X"
       else
         return "O"
       end
     end
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
