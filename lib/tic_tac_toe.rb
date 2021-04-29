class TicTacToe
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

    WIN_COMBINATIONS = [
     [0,1,2],
     [3,4,5],
     [6,7,8],
     [0,4,8],
     [2,4,6],
     [0,3,6],
     [1,4,7],
     [2,5,8]
    ]

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

    def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|player| player == "X" || player == "O"}
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0, 8)
  end

  def position_taken?(index)
   @board[index] == "X" || @board[index] == "O"
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, player)
    @board[index] = player
  end

    def turn
      print "Please enter 1-9:"
      user_input = gets.strip
      index = input_to_index(user_input)
      if valid_move?(index)
        player = current_player
        move(index, player)
      else
        turn
      end
      display_board
    end

  def won?
   WIN_COMBINATIONS.detect do |combo|
     @board[combo[0]] == @board[combo[1]] &&
     @board[combo[1]] == @board[combo[2]] &&
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
   won? || draw?
  end

  def winner
   if winner = won?
     @board[winner.first]
   end
  end

end
