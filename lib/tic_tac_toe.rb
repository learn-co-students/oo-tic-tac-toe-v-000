class TicTacToe

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def board=
    @board = board
  end

  def board
    @board
  end

  WIN_COMBINATIONS = [
   [0,1,2], #Top row win
   [3,4,5], #Middle row win
   [6,7,8], #Bottom row win
   [0,3,6], #Left column win
   [1,4,7], #Middle column win
   [2,5,8], #Left column win
   [0,4,8], #Left top to bottom right diagonal win
   [2,4,6]  #Right top to bottom left diaganon win
 ]

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index (string)
    index = string.to_i - 1
  end

  def move (index, token)
    @board[index] = token
  end

  def position_taken? (index)
   @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    @board.count do |position|
    position != " "
    end
  end

  def current_player
     turn_count % 2 == 0 ? "X" : "O"
   end

   def turn
      puts "Hello! Welcome to Tic Tac Toe!
      Please pick a number from 1 - 9"
        user_input = gets.strip
        index = input_to_index(user_input)
      if valid_move?(index)
        token = current_player
        move(index, token)
        display_board
      else
        puts "Oops! That is not a valid move.
        Please pick another number between 1-9."
        turn
      end
   end

   def won?
      WIN_COMBINATIONS.detect do |combo|
        board[combo[0]] == board[combo[1]] &&
        board[combo[1]] == board[combo[2]] &&
        position_taken?(combo[0])
      end
    end

    def full?
      @board.all?{|token| token == "X" || token == "O"}
    end

    def draw?
      !won? && full?
    end

    def over?
      won? || full? || draw?
    end

    def winner
        won? && board[won?[0]]
    end

    def play
      until over?
        turn
      end
      if won?
        puts "Congratulations #{winner}!"
      else
        puts "Cat's Game!"
      end
    end
end
