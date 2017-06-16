class TicTacToe

  def initialize(board = [" "," "," "," "," "," "," "," "," "])
    @board = board
  end

  def board
    @board
  end

  def board= (board)
    @board = board
  end


  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,4,8], #diagonal 1
    [2,4,6], #diagonal 2
    [0,3,6], #vertical 1
    [1,4,7], #vertical 2
    [2,5,8] #vertical 3
  ]

  def display_board()
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    make_int = user_input.to_i
    number = make_int-1
  end

  def move(index, value)
    @board[index] = value
  end

  def position_taken? (index)
    if (@board[index] == " ") || (@board[index] == "") || (@board[index] == nil)
    false
  else (@board[index] == "X") || (@board[index] == "O")
    true
  end
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
  counter = 0
  @board.each do|space|
    if space == "X" || space == "O"
      counter +=1
    end
  end
    counter
  end

  def current_player
    turn_count.odd? ? "O" : "X"
  end

  def won?()
    WIN_COMBINATIONS.detect do |combination| # combination on the first loop will equal [0,1,2], which is an array of index values
      @board[combination[0]] == @board[combination[1]] && @board[combination[1]] == @board[combination[2]] && @board[combination[0]] != " "
    end
  end

  def full?()
    # google all? array iterator
    @board.all? do|occupied|
      (occupied == "X" || occupied =="O") && (occupied != " ")
    end
  end

  def draw?
    if full? && ! won?
      true
    end
  end

  def over?
    if won? || full? || draw?
      true
    end
  end

  def winner
    if won?
      @board[won?[0]]
    end
  end

  def play
      while !over?
      turn
      end

      if won?
        puts "Congratulations #{winner}!"
      end
        if draw?
    puts "Cat's Game!"
    end
    end


end
