class TicTacToe
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end
  
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8], [0,4,8], [2,4,6]]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    integer =  input.to_i
    index = integer - 1
  end
  
  def move(index, character="X")
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
    if index.between?(0, 8) && (position_taken?(index) == false)
    return true
    else
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    until valid_move?(index) == true
    puts "Please enter 1-9:"
    input = gets.strip
    input_to_index(input)
    index = input_to_index(input)
    end
    move(index, current_player)
    display_board
  end

  def turn_count
    counter = 0
    @board.each do |position|
    if position == "O" || position == "X"
      counter += 1
    end
  end
    return counter
  end

  def current_player
    if turn_count % 2 == 0
      return "X" 
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if position_taken?(combo[0]) == true && (@board[combo[0]] == @board[combo[1]]) && (@board[combo[1]] == @board[combo[2]])
      return combo
      end
    end
    false
  end

  def full?
    @board.all? { |position| position == "X" || position == "O"}
  end

  def draw?
    if won? == false && full? == true
      return true
    end
      return false
  end

  def over?
    if ((won? != false) && (full? == false)) || draw? == true || ((won? != false) && (full? == true))
      true
    end
  end

  def winner
    if won? != false
      array = won?
      return @board[array[0]]
    end
  end

  def play
    until over? == true
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end