class TicTacToe

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

  def initialize(board = Array.new(9, " "))
    @board = board
  end


  #########
  # TOOLS #
  #########

  def input_to_index(user_input)
    user_input.to_i - 1
  end


  ###################
  # BOOLEAN METHODS #
  ###################

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(position)
    index = input_to_index(position)
    !position_taken?(index) && index.between?(0,8)
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if position_taken?(combo[0]) &&\
         @board[combo[0]] == @board[combo[1]] &&\
         @board[combo[0]] == @board[combo[2]]
        return combo
      end
    end
    nil
  end

  def full?
    @board.none? {|pos| pos == " "}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end


  ###########
  # POLLING #
  ###########

  def turn_count
    @board.count {|pos| pos == "X" || pos == "O"}
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def winner
    won? ? @board[won?[0]] : nil
  end


  ##########
  # ACTION #
  ##########

  def move(position, token = "X")
    index = input_to_index(position)
    @board[index] = token
  end


  ########
  # PLAY #
  ########

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      turn
    end
  end

  def play
    display_board
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
end
