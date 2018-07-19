
class TicTacToe
  def initialize
    @board = Array.new(9, " ")
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

  def input_to_index(user_input)
    @index =  user_input.to_i - 1
  end
  
  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    @index = input_to_index(input)
    if valid_move?(@index)
      move(@index, current_player)
      display_board
    else 
      puts "Invalid input. Please try again."
      turn
    end
  end 
  
  def turn_count
    counter = 0 
    @board.each { |turn| counter +=1 if turn != " " }
    counter
  end
  
  def current_player
    if turn_count % 2 == 0 
      return "X"
    else 
      return "O"
    end
  end
  
  def won?
    WIN_COMBINATIONS.any? do |index| 
  
    if @board[index[0]] == "X" && 
      @board[index[1]] == "X" && 
      @board[index[2]] == "X" || 
      @board[index[0]] == "O" && 
      @board[index[1]] == "O" && 
      @board[index[2]] == "O"
      return index
    else
      false
    end
  end
  end
  
  def full?
    if @board.any? {|i| i == " "}
      false
    else
      true
    end
  end
  
  def draw?
    !won? && full?
  end 
  
  def over?
    won? || draw?
  end
  
  def winner
    if won?
       winning_line = won?
       return @board[winning_line[0]]
    end
  end
  
  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end 