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
    [2,4,6],
    ]
    
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
   end
   
  def input_to_index(user_input)
    converted_input = user_input.to_i-1
  end
  
  def move(index, value)
    @board[index] = value
  end
  
  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end
  
  
  def valid_move?(index)
    if !position_taken?(index) && (index).between?(0, 8)
      return true
    end
    false
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      value = current_player
      move(index, value)
      display_board
   else 
      turn
    end
  end
  
  def turn_count
    counter = 0
    @board.each do |turn|
     if turn == "X" || turn == "O"
        counter += 1
        puts "#{counter}"
      end
   end
    counter
  end
  
  def current_player
    if turn_count.even?
    return "X"
    else
    return "O"
    end
  end
  
  def won?
  WIN_COMBINATIONS.each do |line|
    if (@board[line[0]]) == "X" && (@board[line[1]]) == "X" && (@board[line[2]]) == "X"
      return line
    elsif (@board[line[0]]) == "O" && (@board[line[1]]) == "O" && (@board[line[2]]) == "O"
      return line
      end
    end
    false
  end
  
  def full?
    @board.all? {|input| input == "X" || input == "O"}
  end
  
  def draw?
    if !won? && full?
      return true
    end
    false
  end

  def over?
    if won? || full?|| draw?
     return true
    end
    nil
  end

  def winner
    if won?
      return @board[won?[0]]
    end
    nil
  end
  
  def play
    until over?
      puts turn
    end
    if won? 
      puts "Congratulations #{winner}!"
    else
    puts "Cat's Game!"
    end
  end
    
end