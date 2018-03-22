class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9," ")
  end

  WIN_COMBINATIONS = [
      [0,1,2], # TopWin
      [3,4,5], # MiddleWin
      [6,7,8], # BottomWin
      [0,3,6], # LeftRowWin
      [1,4,7], # MiddleRowWin
      [2,5,8], # RightRowWin
      [0,4,8], # LeftAcrossWin
      [6,4,2], # RightAcrossWin
    ]

  def display_board
    puts  " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts  "-----------"
    puts  " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts  "-----------"
    puts  " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index (user_input)
      user_input.to_i-1
  end

  def position_taken? (index)
    if @board[index] == "" || @board[index] == " " || @board[index]== nil
      return false
    else
      return true
    end
  end

  def move (user_input, token = "X")
      @board[user_input] = token
  end

  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end

  def turn
    puts "Please choose 1-9"
    user_input = gets.strip
    input = input_to_index(user_input)

    if valid_move?(input)
      move(input, current_player)
    else
      turn
    end
    display_board
  end

  def turn_count
    turn = 0
    @board.each do |token|

      if token == "X" || token == "O"
        turn+= 1
      end
    end
    turn
  end

  def current_player
    turn_count % 2 == 0? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |combination|
      @board[combination[0]] == @board[combination[1]] &&
      @board[combination[1]] == @board[combination[2]] &&
      position_taken?(combination[0])
    end
  end

  def full?
    @board.all?{|token| token =="X" || token == "O"}
  end

  def draw?
    !won? && full?
  end

  def over?
    draw? || won?
  end

  def winner
    if winning_combo = won?
      @board[winning_combo.first]
    end
  end

  def play
    until over? do
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat\'s Game!"
    end

  end
end
