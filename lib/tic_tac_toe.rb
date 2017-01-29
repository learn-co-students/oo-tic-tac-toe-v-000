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

  def input_to_index(input)
    index = input.to_i-1
  end

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(index)
    !(@board[index] == " ")
  end

  def valid_move?(index)
    !(position_taken?(index)) && index < 9 && index > -1
  end

  def turn_count
    @board.count {|marker| marker == "X" || marker == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      @board[index] = current_player
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      @win_array = [@board[win_combination[0]], @board[win_combination[1]], @board[win_combination[2]]]
      @win_array.all? { |token| token == "X" } || @win_array.all? { |token| token == "O" }
    end
  end

  def full?
    @board.none? { |token| token == " " }
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      if @win_array.all? { |token| token == "X" }
        return "X"
      elsif @win_array.all? { |token| token =="O" }
        return "O"
      end
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end #end of class TicTacToe
