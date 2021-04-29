class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2], # top row
    [3,4,5], # middle row
    [6,7,8], # bottom row
    [0,3,6], # left column
    [1,4,7], # middle column
    [2,5,8], # right column
    [0,4,8], # top left to bottom right diagonal
    [2,4,6] # bottom left to top right diagnonal
  ]

  def initialize
    @board = Array.new(9," ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = (input.to_i) - 1
  end

  def move(index, character = "X")
    @board[index] = character
  end

  def position_taken?(index)
    taken = nil
      if (@board[index] == " " || @board[index] == "" || @board[index] == nil)
        taken = false
      else
        taken = true
      end
      taken
  end

  def valid_move?(index)
    valid = nil
    if (index.between?(0,8) && !position_taken?(index))
      valid = true
    else
      valid = false
    end
    valid
  end

  def turn
    index = 0
    again = false
    while (!again)
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
      again = valid_move?(index)
    end

    move(index, current_player)
    display_board
  end

  def turn_count
    turn_number = 0

    @board.each do |value|
      if (value == "X" || value == "O")
        turn_number += 1
      end
    end
    turn_number
  end

  def current_player
    (turn_count.even?) ? "X" : "O"
  end

  def won?
    #=>no: return false/nil
    #=>yes: return [] of winning positions
    array = nil
    WIN_COMBINATIONS.each { |set|

      win_index_1 = set[0]
      win_index_2 = set[1]
      win_index_3 = set[2]

      if position_taken?(win_index_1) && position_taken?(win_index_2) && position_taken?(win_index_3)
        char_1 = @board[win_index_1]
        char_2 = @board[win_index_2]
        char_3 = @board[win_index_3]
        char_array = [char_1, char_2, char_3]
        all_x = char_array.all? { |character|
          character == "X"
        }
        all_o = char_array.all? { |character|
          character == "O"
        }
        if all_x || all_o
          array = [win_index_1, win_index_2, win_index_3]
        end
      end
    }
    array
  end
  def full?
    #=> true if there are no nils or " "
    #=> false if there are nils or " "
    @board.none?{|i| i == " " }
  end

  def draw?
    #=> true if board has not been won and is full
    #=> false if board not won and board is not full
    #=> false if board won
    if won?
      false
    elsif full?
      true
    else
      false
    end
  end
  def over?
    #=> true if board won, is draw, or is full
    (won? || full? || draw?) ? true : false
  end
  def winner
    if(won?.class == Array)
      @board[won?[0]]
    end
  end

  def play
    while !over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end

  end


end
