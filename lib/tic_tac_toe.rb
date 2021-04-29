class TicTacToe
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
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

  def move(index, character = "X")
    @board[index] = character
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
  if position_taken?(index) == false && index.between?(0,8) == true
    true
  elsif position_taken?(index) == true || index.between?(0,8) == false
    false
  end
  end

  def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  character = current_player
  if !valid_move?(index) && !over?
    turn
  else
    move(index, character)
  end
  display_board
  end

  def turn_count
  counter = 0
  @board.each do |place|
    if place == "X" || place== "O"
      counter+=1
    end
  end
    return counter
  end

  def current_player
  turn_count.even? ? (return'X'):(return'O')
  end

  def won?
      WIN_COMBINATIONS.each do |set|
        position_1 = @board[set[0]]
        position_2 = @board[set[1]]
        position_3 = @board[set[2]]
        if (position_1 == "X" && position_2 == "X" && position_3 == "X")||(position_1 == "O" && position_2 == "O" && position_3 == "O")
          return [set[0], set[1], set[2]]
        end
    end
    return false
  end

  def full?
    index = 0
    while index<8
      if position_taken?(index) == false
        return false
      else
        index+= 1
      end
    end
    return true
  end

  def draw?
    if  !won? && full?
      return true
    end
  end

  def over?
  if won?|| draw?
    return true
  end
  end

  def winner
  if won? == false
    return nil
  else
    return @board[won?[0]]
  end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end


  
end 