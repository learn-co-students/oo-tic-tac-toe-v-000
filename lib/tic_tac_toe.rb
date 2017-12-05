#################### BEFORE GAME START #################
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

  def input_to_index(user_input)
    user_input.to_i - 1
  end
######################## GAME START ####################
  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location].strip.size == 1
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    count = 0
    @board.each { |pos| if pos.strip.size == 1; count += 1; end }
    count
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
  puts "Please enter 1-9:"
  index = input_to_index(gets.strip)
  if valid_move?(index)
    move(index, current_player)
    puts "You Chose Postion #{index + 1}"
    display_board
  else
    turn
  end
end

######################### GAME END #####################
  WIN_COMBINATIONS = [
    [0,1,2], #Top_row [0]
    [3,4,5], #Middle_row [1]
    [6,7,8], #Bottom_row [2]

    [0,3,6], #Left_Column [3]
    [1,4,7], #Middle_Column [4]
    [2,5,8], #Right_Column [5]

    [0,4,8], #Diagonal_0-8 [6]
    [2,4,6]  #Diagonal_2-6 [7]
  ]

  def won?
    WIN_COMBINATIONS.detect { |win_combination|
      @board[win_combination[0]] == @board[win_combination[1]] &&
      @board[win_combination[1]] == @board[win_combination[2]] &&
      position_taken?(win_combination[0])
    }
  end

  def full?
    @board.all? { |i| i == "X" || i == "O" }
  end

  def draw?
    !won? && full?
  end

  def over?
    draw? || won?
  end

  def winner
    if win_combo = won?
      @board[win_combo[0]]
    end
  end
######################## PLAY GAME! ####################
  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
