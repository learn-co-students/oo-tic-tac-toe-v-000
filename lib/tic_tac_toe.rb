require "pry"

class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  def board= (board)
    @board = board
  end
  def board
    @board
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def won?
    win_output = false

    WIN_COMBINATIONS.each do |winning_way|
      if winning_way.all? { |win_index| @board[win_index] == "X" }
        win_output = winning_way
        break
      end
    end

    WIN_COMBINATIONS.each do |winning_way|
      if winning_way.all? { |win_index| @board[win_index] == "O"}
        win_output = winning_way
        break
      end
    end
    win_output
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index (input)
    index = input.to_i - 1
  end

  def move (position, char = "X")
    index = input_to_index(position)
    @board[index] = char
  end

  def valid_move? (position)
    index = input_to_index(position)
    (index.between?(0, 8)) && !(position_taken?(index))
  end

  def position_taken?(index)
    !(@board[index].nil? || board[index] == " ")
  end

  def full?
    @board.all? { |e| e == "X" || e == "O" }
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    winning_char = nil
    if won?
      winning_char = @board[won?[0]]
    end
    winning_char
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    until valid_move?(user_input)
      puts "Invalid input. Please enter 1-9:"
      user_input = gets.strip
    end
    move(user_input, current_player)
    display_board
  end

  def turn_count
    count = 0
    @board.each do |idx|
      if idx != " "
        count += 1
      end
    end
    count
  end

  def current_player
    player_char = "X"
    if turn_count % 2 == 1
      player_char = "O"
    end
    player_char
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end
