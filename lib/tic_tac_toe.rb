class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [2, 4, 6],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    index = user_input.to_i - 1
  end

  def move(index, character = "X")
      @board[index] = character
  end


  def position_taken?(index)
    (@board[index] == " " || @board[index] == "" || @board[index] == nil) ?
      false : true
    end

    def valid_move?(index)
        index.between?(0, 8) && !position_taken?(index)
    end

    def turn_count
      @board.count{|character| character == "X" || character == "O"}
    end

    def current_player
      if turn_count.even?
         "X"
      else
         "O"
      end
    end

    def turn
      puts "Please enter 1-9:"
      user_input = gets.strip
      index = input_to_index(user_input)
      character = current_player
      if valid_move?(index)
        move(index, character)
        display_board
      else
        turn
      end
    end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && position_taken?(combo[0])
    end
  end

  def full?
    @board.all? do |box|
      box == "X" || box == "O"
    end
  end

  def draw?
    if full? && !won?
      return true
    else
      return false
    end
  end

  def over?
    if won? || draw? || full?
      return true
    else
      return false
    end
  end

  def winner
    if won? && @board[won?[0]] == "X"
      return "X"
    elsif won? && @board[won?[0]] == "O"
      return "O"
    else
      nil
    end
  end

  def play
    until over?
      turn
    end

    if over? && won?
      puts "Congratulations #{winner}!"
    elsif over? && draw?
      puts "Cat's Game!"
    end
  end

end
