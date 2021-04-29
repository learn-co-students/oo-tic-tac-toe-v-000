class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], #Top row
    [3, 4, 5], #Middle row
    [6, 7, 8], #Bottom row
    [0, 3, 6], #Left verticle row
    [1, 4, 7], #Middle verticle row
    [2, 5, 8], #Right verticle row
    [0, 4, 8], #L to R diagonal row
    [2, 4, 6]  #R to L diagonal row
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, player = "X")
    @board[index] = player
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    index = index.to_i
    if index.between?(0, 8) && position_taken?(index) == false
      true
    else position_taken?(index) == true
      false
    end
  end

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

  def turn_count
    counter = 0
    @board.each do |turn|
      if turn == "X" || turn == "O"
        counter += 1
      end
    end
     counter
  end

  def current_player
    turn_count.even? ? "X" : "O"
    #Same as
    #if turn_count(board) % 2 == 0
      # "X"
    #else
      #"O"
    #end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      position_taken?(win_combination[0]) && @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[2]] == @board[win_combination[0]]
    end
  end

  def full?
    @board.all? {|full_board| full_board == "X" || full_board == "O"}
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      @board[won?.first]
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations " + winner + "!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
