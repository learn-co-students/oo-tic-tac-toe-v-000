class TicTacToe
  def initialize(board = Array.new(9," "))
    @board = board
  end
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row

    [0,3,6], #left horizontal column
    [1,4,7], #Middle horizontal column
    [2,5,8], #Right horizontal column

    [0,4,8], #left to bottom right diagonal
    [2,4,6] #right to bottom left diagonal

  ]
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(userInput)
    @input = userInput.to_i - 1
  end

  def move(index,token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    if @board[index] === " " || @board[index] === "" || @board[index] === nil
      false
    else
      true
    end
  end

  def valid_move?(index)
    if position_taken?(index)
      false
    elsif index.between?(0,8)
      true
    end
  end

  def turn_count
     @board.count{
       |token|
     token == "X" || token == "O"}

  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)

    valid_move = valid_move?(index)

    if valid_move
      move(index,current_player)
      display_board
    else
      turn
    end

  end

  def won?
    WIN_COMBINATIONS.detect do |array|
     if @board[array[0]] == "X" && @board[array[1]] == "X" && @board[array[2]] == "X"
        return array

   elsif @board[array[0]] == "O" && @board[array[1]] == "O" && @board[array[2]] == "O"
        return array
      else
        false
      end
    end
  end

  def full?
    @board.all? do |index|
      index != " "
    end
  end

  def draw?
    if won?
      false
    elsif full?
      true
    end
  end

  def over?
    if draw? || full? || won?
      true
    else
      false
    end
  end

  def winner
    if won?
      @board[won?[0]]
      @board[won?[1]]
      @board[won?[2]]
    else
      nil
   end
  end

  def play
    until over?
      turn
       end

      if draw?
        puts "Cat's Game!"
      else
        puts "Congratulations #{winner}!"
      end
  end

end
