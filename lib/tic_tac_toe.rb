class TicTacToe

  #board variable
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  #WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0, 1, 2], # top row
    [3, 4, 5], # mid row
    [6, 7, 8], # bottom row
    [0, 3, 6], # left col
    [1, 4, 7], # mid col
    [2, 5, 8], # right col
    [0, 4, 8], # l-to-r diagonal
    [2, 4, 6] # r-to-l diagonal
  ]

  #display ASCII board
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  #input to index
  def input_to_index(user_input)
    "#{user_input}".to_i - 1
  end

  # move
  def move(index, token = "X")
    @board[index] = token
  end

  # position taken?
  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      false
    else
      true
    end
  end

  # valid move?
  def valid_move?(index)
    if index.between?(0, 8)
      if position_taken?(index)
        false
      else
        true
      end
    end
  end

  #TURN
  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  #TURN_COUNT
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  #CURRENT_PLAYER
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  # did someone win?
  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      if @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[0]] == @board[win_combination[2]]
        if position_taken?(win_combination[0]) == true
          return win_combination
        end
      end
    end
  end

  # is the board full?
  def full?
    @board.all? do |full_board|
      full_board == "X" || full_board == "O"
    end
  end

  # was there a draw?
  def draw?
    not won? and full?
  end

  # is the game over?
  def over?
    won? or draw?
  end

  # who won?
  def winner
    if set = won?
      @board[set[0]]
    end
  end

  #PLAY
  def play
    while over? == false
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
