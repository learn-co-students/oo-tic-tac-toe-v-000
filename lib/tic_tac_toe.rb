class TicTacToe
  def initialize(board=nil)
    @board = board || Array.new(9, " ")
  end
    WIN_COMBINATIONS=[
                    [0,1,2],
                    [3,4,5],
                    [6,7,8],
                    [0,3,6],
                    [1,4,7],
                    [2,5,8],
                    [0,4,8],
                    [6,4,2]
   ]
  # print abritary arrangements of the board
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  #Adding Player Move to the Game Board
  def move(location, token ="X")
    @board[(location.to_i) -1 ]=token
  end

  # check if a position omn the board has been taken
  def position_taken?(position)
    if @board[position] == "" || @board[position] == " " || @board[position] == nil
        return false
     elsif @board[position] == "X" || @board[position] == "O"
        return true
    end
  end

  #check if player made a valid move
  def valid_move?(position)
    @index = position.to_i-1
    if @index.between?(0,8) && !position_taken?(@index)
      return true
     else
      return false
     end
    end
    #counts occupied position
    def turn
      puts "Please enter 1-9:"
      @user_input = gets
      if valid_move?(@user_input)
        move(@user_input)
        display_board
        return true
      else
        turn
      end
    end
    # This method returns the number of turns that have been played based on the board in @board.
    def turn_count
      counter = 0
      @board.each do | occupied_positions |
        if  occupied_positions == "X" ||  occupied_positions =="O"
          counter+=1
        end
      end
        counter
    end
    #The current_player method should use the #turn_count method to determine if it is "X"'s turn or "O"'s.
    #WON?

    def current_player
      turn_count
        if turn_count % 2 == 0
           return "X"
         else
           return "O"
        end
      end

      # method should return false/nil if there is no win combination present in the
      # board and return the winning combination indexes as an array if there is a win.
      def won?
        WIN_COMBINATIONS.detect do | win_combination |
          # win_combination = [0,1,2], [3,4,5], [0,4,8], ... [2,4,6]

          win_index_1 = win_combination[0] # 0, 3
          win_index_2 = win_combination[1] # 1, 4
          win_index_3 = win_combination[2] # 2, 5

          position_1 = @board[win_index_1] # "X", "O"
          position_2 = @board[win_index_2] # "O", "X"
          position_3 = @board[win_index_3] # "X", "O"

          if position_1 ==  position_2 && position_2 ==  position_3 && position_1 != " "
            return win_combination # return the win_combination indexes that won.
          else
            false
          end
        end
    end

    #The full? method should return true if every element in the board contains either an "X" or an "O".
    def full?
      @board.none? do | position |
        position == " "
      end
    end

    # Build a method draw? that returns true if the board has not been won and is full
    # and false if the board is not won and the board is not full, and false if the board is won.
    def draw?
      !won? && full?
    end

    # Build a method #over? returns true if the board has been won, is a draw, or is full.
    def over?
      won? || draw?
    end

    # The winner method should return the token, "X" or "O" that has won the game given a winning board.
    def winner
      win_combination = won?
      if win_combination
        win_index = win_combination[0]
        @board[win_index]
      end
    end

    #Play method is responsible for the game loop
    def play
      while !over?
        turn
      end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cats Game!"
      end
    end
end
