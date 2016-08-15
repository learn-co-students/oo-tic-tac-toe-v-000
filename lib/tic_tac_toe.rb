class TicTacToe
  def initialize(board = nil)
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], # top row
    [3,4,5], # middle row
    [6,7,8], # bottom row
    [0,3,6], # first column
    [1,4,7], # second column
    [2,5,8], # third column
    [0,4,8], # top left to bottom right diagonal
    [2,4,6]  # top right to bottom left diagonal
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

  def move(input, char = "X")
    index = input_to_index(input)
    @board[index] = char
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
    if index.between?(0, 8) && (@board[index] == " " || @board[index] == "" || @board[index] == nil)
      return true
    else
      return false
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip

    while valid_move?(input) == false
      puts "Please enter 1-9:"
      input = gets.strip
    end

    char = current_player
    move(input, char)
    display_board
  end

  def turn_count
    occupied_spaces = @board.select{ |space| space == "X" || space == "O"}
    return occupied_spaces.length
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    x_wins = WIN_COMBINATIONS.select { |array| @board[array[0]] == "X" && @board[array[1]] == "X" && @board[array[2]] == "X"}
    o_wins = WIN_COMBINATIONS.select { |array| @board[array[0]] == "O" && @board[array[1]] == "O" && @board[array[2]] == "O"}
    if  x_wins != []
      return x_wins
    elsif  o_wins != []
      return o_wins
    else
      return false
    end
  end

  def full?
    @board.all? do |position|
      !(position.nil? || position == " ")
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
    if full? == true || draw? == true || won? != false
      return true
    else
      return false
    end
  end

  def winner
    x_wins = WIN_COMBINATIONS.select { |array| @board[array[0]] == "X" && @board[array[1]] == "X" && @board[array[2]] == "X"}
    o_wins = WIN_COMBINATIONS.select { |array| @board[array[0]] == "O" && @board[array[1]] == "O" && @board[array[2]] == "O"}
    if  x_wins != []
      return "X"
    elsif  o_wins != []
      return "O"
    else
      return nil
    end
  end

  def play
    while !over?
      turn
    end
      if won?
        puts "Congratulations #{winner}!"
      else
        puts "Cats Game!"
      end
  end
end
