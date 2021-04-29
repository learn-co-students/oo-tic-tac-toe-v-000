class TicTacToe
    
  def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = board
  end
  
  def board=(board)
    @board = board
  end
  
  def board
    return @board
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
    seperator = "-----------"
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts seperator
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts seperator
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end
  
  def move(input, char = "X")
    board[input.to_i - 1] = char
  end
  
  def position_taken?(position)
    if position < 0 || position > 9
      return nil
    elsif board[position] == "" || board[position] == " " || board[position] == "  "
      return false
    elsif board[position] == "X" || board[position] = "O"
      return true
    end
  end
  
  def valid_move?(position)
  realPosition = position.to_i - 1
  if position_taken?(realPosition) == true || position_taken?(realPosition) == nil
    return false
  else
   return true
  end
end

def turn
  input = gets.strip
  until valid_move?(input)
    puts "Invalid entry."
    display_board
    input = gets.strip
  end
  move(input, current_player)   
end

def turn_count
  turnCount = 0
  board.each do |spot|
    if spot == "X" || spot == "O"
        turnCount += 1
    end
  end
  return turnCount
end

def current_player
  turnCount = turn_count
  if turnCount % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?
  if WIN_COMBINATIONS.none? do |streak|
        (board[streak[0]] == "X" && board[streak[1]] == "X" && board[streak[2]] == "X") || (board[streak[0]] == "O" && board[streak[1]] == "O" && board[streak[2]] == "O")
    end
  return false
  else WIN_COMBINATIONS.each do |streak|
      if (board[streak[0]] == "X" && board[streak[1]] == "X" && board[streak[2]] == "X") || (board[streak[0]] == "O" && board[streak[1]] == "O" && board[streak[2]] == "O")
        return streak
      end
    end
  end
end

def full?
  if board.all? do |spot|
    spot == "X" || spot == "O"
    end
    return true
  else
    return false
  end
end

def draw?
  if won? == false && full? == true
    return true
  else
    return false
  end
end

def over?
  if won? != false || full? == true || draw? == true
    return true
  else
    return false
  end
end

def winner
  if won? == false 
    return nil
  else WIN_COMBINATIONS.each do |streak|
      if (board[streak[0]] == "X" && board[streak[1]] == "X" && board[streak[2]] == "X")
        return "X"
      elsif (board[streak[0]] == "O" && board[streak[1]] == "O" && board[streak[2]] == "O")
        return "O"
      end
    end
  end
end

def play
    until over? == true
        display_board
        turn
    end
    display_board
    puts "Thank you for playing!"
    if won? != false
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
end

end
