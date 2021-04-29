require 'pry'

class TicTacToe
#------BOARD----------------------
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def board
    @board
  end
#-----WIN COMBOS----------------------
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
#--------DISPLAY BOARD--------------------


    def display_board
        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts "-----------"
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts "-----------"
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
    end
#----------INPUT TO INDEX------------------
    def input_to_index(user_input)
        user_input.to_i - 1
    end

#----------MOVE-----------------------


    def move(new_input, char = "X")
      board[new_input] = char
    end

#-----------POSITION TAKEN----------------------

    def position_taken?(index)
       if board[index] == " " || board[index] == "" ||  board[index] == nil
         false
       else
         true
      end
    end

#-----------VALID MOVE----------------------

    def valid_move?(index)
        if index.between?(1,9)
        if !position_taken?(index)
        true
      end
    end

      index.between?(0,8) && !position_taken?(index)
    end

    def position_taken?(index)
      board[index] != " "
    end

  #-----------TURN COUNT----------------------

    def turn_count
      counter = 0
      board.each do |element|
          if element == "X" || element == "O"
            counter += 1
          end
      end
      counter
    end

#-----------CURRENT PLAYER----------------------

    def current_player
      count = turn_count
      count % 2 == 0 ? "X" : "O"
    end

#-----------TURN----------------------

    def turn
      char = current_player
      puts "Please enter 1-9:"
      user_input = gets.strip
      index = input_to_index(user_input)
      if valid_move?(index)
        move(index, char)
        display_board
      else
        turn
      end
    end

#-----------WON----------------------

    def won?
      WIN_COMBINATIONS.detect do |win_combination|
          win_index_1 = win_combination[0]
          win_index_2 = win_combination[1]
          win_index_3 = win_combination[2]

          position_1 = board[win_index_1]
          position_2 = board[win_index_2]
          position_3 = board[win_index_3]

          position_1 == "X" && position_2 == "X" && position_3 == "X" ||
          position_1 == "O" && position_2 == "O" && position_3 == "O"
      end
    end
#-----------FULL----------------------

    def full?
      board.all? {|check| check == "X" || check == "O"}
    end

#-----------DRAW----------------------

    def draw?
      full? && !won?
    end

#-----------OVER----------------------

    def over?
      full? || won? || draw?
    end

#-----------WINNER----------------------
    def winner
      win = won?
        if win
          board[win[0]]
        else
          nil
      end
    end

#-----------PLAY----------------------

    def play
      until over?
    	turn
      end
      if draw?
        puts "Cat's Game!"
      else winner
        puts "Congratulations #{winner}!"
      end
    end
    
  end
