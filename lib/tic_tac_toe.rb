
class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [6,4,2],
    [0,4,8]
  ]

  def input_to_index(number)
    number.to_i - 1
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end


  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end


  def move(location, token = "X")
    #location = location.to_i - 1
    @board [location] = token
  end

  def position_taken?(input)
    #input.to_i - 1
    if @board[input] == "X" ||  @board[input] == "O"
      true
    else
      false
    end
  end

  def valid_move?(input)
    if input.between?(0, 8) && !position_taken?(input)
      true
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    num = gets.strip
    valid_num = input_to_index(num)
    if valid_move?(valid_num)
      move(valid_num, current_player)
      display_board
    else
      turn

    end
  end

  def won?

    WIN_COMBINATIONS.find do |w|

      win_index_1 = w[0]
      win_index_2 = w[1]
      win_index_3 = w[2]
      @board[win_index_1] == @board[win_index_2] && @board[win_index_2] == @board[win_index_3] &&  position_taken?(win_index_1)
    end
  end

  def full?
    @board.all? do |token|
      token == "X" || token == "O"
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    if draw?
      true
    elsif won?
      true
    else
      false
    end
  end

  def winner
    if won?
      @board[won?[0]]
    end
  end

  def play
    while !over?
      turn
    end

    if winner == "X" || winner == "O"
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"

    end
  end
end
