class TicTacToe

  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

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
  #
  #
  #
  def display_board
    board = @board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end
  #
  def valid_input
    input = gets.strip
    if input.to_i.between?(1, 9)
      input.to_i
    else
      false
    end
  end
  #
  #
  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player = "X")
    @board[(index-1)] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(input)
    index = input_to_index(input)
    index.between?(0,8) && !position_taken?(index)
  end
  #
  def turn
    valid = false
    current_player = ""
    if turn_count.even?
      current_player = "X"
    else
      current_player = "O"
    end
    until valid == true
      input = false
      until input != false do
        puts "Please enter 1-9:"
        input = valid_input
      end
      # index = input_to_index(input)
      if valid_move?(input)
        move(input, current_player)
        display_board
        valid = true
      end
    end
  end

  def turn_count
    count = 0
    @board.each do |move|
      if move == "X" || move == "O"
        count += 1
      end
    end
    count
  end

  def current_player
    moves = turn_count
    if moves.even?
      "X"
    else
      "O"
    end
  end
  #
  def winner_array
    counter = 0
    xs = []
    os = []
    @board.each do |move|
      if move == "X"
        xs << counter
      elsif move == "O"
        os << counter
      end
      counter += 1
    end
    won = false
    winner_arr = []
    WIN_COMBINATIONS.each do | combo |
      won = combo.all? do | i |
        xs.include?(i)
      end
      if won == true
        winner_arr = ["X", combo]
        return winner_arr
        break
      else
        won = combo.all? do | i |
          os.include?(i)
        end
        if won == true
          winner_arr = ["O", combo]
          return winner_arr
          break
        end
      end
    end
    won
  end
  #
  def won?
    if winner_array == false
      false
    else
      winner_array[1]
    end
  end
  #
  def full?
    @board.all? do | space |
      space == "X" || space == "O"
    end
  end

  def draw?
  !won? && full?
  end
  #
  def over?
    draw? || won?
  end

  def winner
    if winner_array == false
      nil
    else
      winner_array[0]
    end
  end
  #
  def play
    until over? do
      turn
    end
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    else
      puts "Cats Game!"
    end
  end
end
