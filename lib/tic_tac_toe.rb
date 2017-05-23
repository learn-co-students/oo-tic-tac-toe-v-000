class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

WIN_COMBINATIONS=[
    [0,1,2], # top row(h)
    [3,4,5], # mid row (h)
    [6,7,8], # bottom row (h)
    [0,4,8], # left top bottom right (oblique)
    [2,4,6], # right top bottom left (oblique)
    [0,3,6], # left row (v)
    [2,5,8], # right row (v)
    [1,4,7] # mid row (v)
  ]

  def input_to_index(user_input)
    index=user_input.to_i - 1
  end


  def move(index,value)
  @board[index]=value
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end

  def turn
    puts "Please enter 1-9:"
    user_input=gets.strip
    index=input_to_index(user_input)
  if valid_move?(index)
      move(index,current_player)
      display_board
    else
      turn
  end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end


  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
  WIN_COMBINATIONS.find do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    pos_1 = @board[win_index_1]
    pos_2 = @board[win_index_2]
    pos_3 = @board[win_index_3]

    if pos_1 == "X" && pos_2 == "X" && pos_3 == "X"
      win_combination
    elsif pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
      win_combination
    end
  end
  end

  def full?
    @board.all? do |element|
        element=="X"||element=="O"
      end
  end


  def draw?
    !won? && full?
  end

  def over?
    won?|| draw? || full?
  end

  def winner
    if position = won?
      @board[position.first]
    end
  end


  def play
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end




end
