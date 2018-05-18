class TicTacToe

  def initialize(board=nil)
    @board = board || Array.new(9, " ")
  end
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]



  def display_board

    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(index)
    (@board[index] == " " || @board[index] == "" || @board[index] == nil) ? false : true
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0, 8) ? true : false
  end

  def turn_count
    counter = 0
    @board.each do |token|
      if token == "X" || token == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
      if !valid_move?(index)
        puts "Whoops! That's not a valid move!"
        turn
      end
    token = current_player
    move(index, token)
    display_board
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      position_1 = @board[win_combo[0]]
      position_2 = @board[win_combo[1]]
      position_3 = @board[win_combo[2]]

      position_1 == "X" && position_2 == "X" && position_3 == "X" ||
      position_1 == "O" && position_2 == "O" && position_3 == "O"
   end
  end

  def full?
    @board.all? do |position|
      position == "X" || position == "O"
    end
  end


  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    won? && @board[won?[0]]
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


  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
end
