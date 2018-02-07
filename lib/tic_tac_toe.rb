class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  def board
    @board
  end
WIN_COMBINATIONS= [
      [0,1,2], # Top row
      [3,4,5],  # Middle row
      [6,7,8],  # Bottom row
      [0,3,6],  # First column
      [1,4,7],  # Second column
      [2,5,8],  # Third column
      [0,4,8],  # diagonal 1
      [2,4,6]  # diagonal 2
      #an array for each win combination
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

  def move(index, token = "X")
    @board[index] = token
  end

  def valid_move?(index)
    position_taken?(index)== false && index.between?(0,8)
  end

  def turn
    puts "Please enter 1-9:"
    input = input_to_index(gets.strip)
      if valid_move?(input)
        token = current_player
        move(input,token)
        display_board
      else turn
    end
  end

  def turn_count
      @board.count{|token| token == "X" || token == "O"}
    end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def won?
    WIN_COMBINATIONS.detect do |combination|
      if combination.all? {|i| @board[i] == "X"}
          return combination
      elsif combination.all? {|i| @board[i] == "O"}
          return combination
      end
    end
  end

  def full?
    @board.all? {|i| i == "X" || i == "O"}
  end

  def draw?
    #method accepts a board and returns true if the board has not been won and is full
    #and false if the board is not won and the board is not full
    #and false if the board is won.
    won? == nil && full? == true
  end

  def over?
    # method accepts a board and returns true if the board has been won, is a draw, or is full
    won? != nil || draw? == true || full? == true
  end

  def winner
    #method should accept a board and return the token, "X" or "O" that has won the game given a winning board.
    if won? != nil
      @board[won?[0]]
  end
  end

  def play
    until over? == true
      turn
    end
    if draw? == true
      puts "Cat's Game!"
    elsif won? != nil
        puts "Congratulations #{winner}!"
    end
  end

end
