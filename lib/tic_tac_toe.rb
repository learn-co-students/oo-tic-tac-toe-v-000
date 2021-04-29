#The first test in 01_tic_tac_toe_spec.rb will ensure the requirement that when a new game of Tic Tac Toe
#is started — that is, when a new instance of TicTacToe is initialized — the instance of the game must set
#the starting state of the board, an array with 9 " " empty strings, within an instance variable named @board.
#In other words, your #initialize method should set a @board variable equal to a new, empty array that
#represents the game board.

class TicTacToe
  def initialize(board = nil)
  @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], #bottom row
    [0,3,6], #left column
    [1,4,7], #middle column
    [2,5,8], #right column
    [2,4,6], #first diagonal
    [0,4,8] #second diagonal
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

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    counter = 0
        @board.each do |turn|
            if turn == "X" || turn == "O"
              counter += 1
            end
        end
    return counter
  end

  def current_player
      if turn_count.even?
        return "X"
      else
        return "O"
      end
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

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1] # load the value of the board at win_index_1
      position_2 = @board[win_index_2] # load the value of the board at win_index_2
      position_3 = @board[win_index_3] # load the value of the board at win_index_3

      position_1 == position_2 && position_1 == position_3 && position_taken?(win_index_1)
    end
  end

  def full?
      @board.all? do |token|
        token == "X" || token == "O"
      end
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    @board[won?[0]] if won?
  end

  def play
    while !over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end
