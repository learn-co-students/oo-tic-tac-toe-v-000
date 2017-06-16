#!/usr/bin/env ruby
class TicTacToe
  def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " ", ])
    @board = board
  end

  def board
    @board
  end

  def board= (board)
    @board = board
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], # Top rows
    [3, 4, 5], # middle row
    [6, 7, 8], # bottom row
    [0, 4, 8], # Left diagonal
    [2, 4, 6], # Right diagonal
    [0, 3, 6], # Left column
    [1, 4, 7], # middle column
    [2, 5, 8] # Right column
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

  def position_taken?(position)
    @board = board

    if @board[position] == " " || @board[position] == "" || @board[position] == nil
      false
    else @board[position] == "X" || @board[position] == "O"
      true
    end
  end

  def move(index, current_player = "X")
    @board =  board
    #index = input_to_index(index)
    @board[index] = current_player
  end

  def valid_move?(index)
    @board = board
  #  input = index.to_i - 1
    if position_taken?(index) == false && index.between?(0,8)
      true

    end
  end

  def turn
    @board = board
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
    @board = board
    board.count("X") + board.count("O")

  end

  def current_player
    @board = board
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?
    @board = board
    WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = @board[win_index_1] # load the value of the board at win_index_1
      position_2 = @board[win_index_2] # load the value of the board at win_index_2
      position_3 = @board[win_index_3] # load the value of the board at win_index_3
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
  end

  def full?
    @board = board
    @board.all? do |token|
      if token == "X" || token == "O"
      true
      end
    end
  end

  #draw?(board) method
  def draw?
    @board = board
    if !won? && full?
      true
    end
  end

  #over?(board) method
  def over?
    @board = board
    if won? || draw?
      true
    end
  end

  #winner method
  def winner
    @board = board
    token = won?
    if token != nil
      return @board[token[0]]
    else
      nil
    end
  end

  #play(board) method
  def play
    @board = board
    while !over? do
      turn
    end
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    else
      puts "Cat's Game!"
    end
  end

end
