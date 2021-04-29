class TicTacToe
  def initialize(board = nil)
    @board = board
    @board = [" "," "," "," "," "," "," "," "," "]
  end
  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #left columns
    [1,4,7], #middle columns
    [2,5,8], #right columns
    [0,4,8], #diagonal 1
    [2,4,6] #diagonal 2
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
  end

  def move(input, character = "X")
    position = input.to_i
    @board[position - 1] = character
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(input) == true
      character = current_player
      move(input, character)
    else
      turn
    end
    display_board
  end

  def turn_count
    counter = 0
    @board.each do |count|
      if count != " "
        counter += 1
      end
    end
    return counter
  end

  def current_player
  counter = turn_count
    turn_count
    if counter.even? == true
      return "X"
    elsif counter == 0
      return "X"
    else
      return "O"
    end
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false
    else
      return true
    end
  end

  def valid_move?(input)
    index = input_to_index(input)
    if position_taken?(index) == false && index.between?(0,8) == true
      return true
    else
      return false
    end
  end



  def won?
      if WIN_COMBINATIONS.detect do |win_combination|
  		    if @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[1]] == @board[win_combination[2]] && @board[win_combination[0]] != " "
            return win_combination
          end
      end
      else
        false
      end
  end

  def full?
    @board.all? do |position|
      position != " "
    end
  end

  def draw?
    !won? && full?
  end



  def over?
    won? != false || draw? == true
  end

  def winner
    WIN_COMBINATIONS.detect do |win_combination|
      if @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[1]] == @board[win_combination[2]] && @board[win_combination[0]] != " "
        return @board[win_combination[0]]
      else
        nil
      end
    end
  end




  def play
    until over? == true
    turn
    end
    if won? != false
      character = winner
      puts "Congratulations #{character}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end
