require 'pry'

class TicTacToe
  attr_reader :board
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def initialize(board = nil)
    @board = board || Array.new(9, ' ')
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
      return win_combo if win_combo.all? { |x| board[x] == 'X' }
      return win_combo if win_combo.all? { |x| board[x] == 'O' }
    end
    false
  end

  def full?
    board.all? { |sq| sq == 'X' || sq == 'O'  }
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    winning_line = won?
    !winning_line ? nil : board[winning_line[0]]
  end

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def move(position, token = 'X')
    board[position.to_i - 1] = token
  end

  def position_taken?(position)
    !board[position].strip.empty?
  end

  def valid_move?(position)
    indexed_position = position.to_i - 1
    indexed_position.between?(0,8) && !position_taken?(indexed_position)
  end

  def turn
    valid = false
    while !valid
      puts 'Please enter 1-9:'
      user_position = gets.chomp
      valid = valid_move?(user_position)
    end
    move(user_position, current_player)
    display_board
  end

  def turn_count
    board.each_index.count { |i| position_taken?(i) }
  end

  def play
    until over? do
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

  def current_player
    if turn_count.even?
      'X'
    else
      'O'
    end
  end

end
