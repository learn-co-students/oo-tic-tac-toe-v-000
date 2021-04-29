class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0, 1, 2],#top
  [3, 4, 5],#mid
  [6, 7, 8],#bot
  [0, 3, 6],#left vert
  [1, 4, 7],#mid vert
  [2, 5, 8],#right vert
  [0, 4, 8],#slash1
  [2, 4, 6]#slash2
]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(index, current_player)
    @board[index - 1] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(position)
    position.to_i.between?(0,8) && @board[position.to_i - 1] == " " && position.to_i != 0
  end

  def input_to_index(position)
    position.to_i - 1
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    turn_count = 0

    @board.each do |x|
      if x != " "
        turn_count += 1
      end
    end
    return turn_count
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.strip

    index = position.to_i
    input_to_index(position)

      if valid_move?(index) == true
        move(index, current_player)
        display_board
      else
        turn
      end
  end

  def won?

    win_arr = []

    return false if @board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]

    WIN_COMBINATIONS.each do |array|

      if (@board[array[0]] == "X" && @board[array[1]] == "X" && @board[array[2]] == "X") || (@board[array[0]] == "O" && @board[array[1]] == "O" && @board[array[2]] == "O")
        win_arr << array
      end
    end

    if win_arr.length == 0
      return false
    else
      return win_arr[0]
    end
  end

  def full?
    if @board.none? {|i| i == " "}
      return true
    else
      return false
    end
  end

  def draw?
    if (!won? == true) && (full? == true)
      true
    else
      false
    end
  end

  def over?
    if won? != false
      return true
    elsif draw? == true
      return true
    elsif full? == true
      return true
    else
      return false
    end
  end


  def winner

    if won? != false && draw? == false

      WIN_COMBINATIONS.each do |array|

        if (@board[array[0]] == "X" && @board[array[1]] == "X" && @board[array[2]] == "X")
          return @board[array[0]]
        elsif (@board[array[0]] == "O" && @board[array[1]] == "O" && @board[array[2]] == "O")
          return @board[array[0]]
        else
          false
        end
      end
    end
  end


  def play
  #start a loop and call turn. 9 turns
        until over? == true
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
