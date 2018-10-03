class TicTacToe

  attr_accessor :board

  def initialize
    @board = [ " ", " ",  " ",  " ",  " ",  " ",  " ",  " ", " " ]
  end

  WIN_COMBINATIONS = [
    [0,1,2], #top
    [3,4,5], #Middle
    [6,7,8], #bottom
    [0,3,6], #left vert
    [1,4,7], #middle vertical
    [2,5,8], #right vertical
    [2,4,6], #diagonal
    [0,4,8]  #diagonal
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

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
      index.between?(0,8) && !position_taken?(index)
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
    count = 0
    @board.each do |turn|
      if turn == "X" || turn == "O"
        count += 1
      end
    end
    count
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
     if @board[combo[0]] != " " && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
      return combo
     end
    end
    false
  end

  def full?
    if @board.include?(" ")
      false
    else
      true
    end
  end

  def draw?
    if full? == true && won? == false
      true
    else
      false
    end
  end

  def over?
    if draw? == true
      return true
    elsif full? == true && won? != false
      return true
    elsif full? == false && won? != false
      return true
    else
      false
    end
  end

  def winner
    if winner = won?
      @board[winner[0]]
    end
  end

  def play
    until over? == true do
      turn
    end
      if winner == "X"
        puts "Congratulations X!"
      elsif winner == "O"
        puts "Congratulations O!"
      elsif draw? == true
        puts "Cat's Game!"
    end
  end










end # ends class TicTacToe
