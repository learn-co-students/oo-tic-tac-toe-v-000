class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def turn_count
    @board.count{|space| space == "X" || space == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    index = user_input.to_i - 1
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

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if index < 0 || index > @board.length
      return false
    elsif @board[index] == " " || @board[index] = nil
      return true
    else
      return false
    end
  end

  def turn
    puts "Please enter 1-9: "
    user_input = gets.strip
    index = input_to_index(user_input)
    if !valid_move?(index)
      turn
    else
      move(index, current_player)
      display_board
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_arr|
      position_taken?(win_arr[0]) && @board[win_arr[0]] == @board[win_arr[1]] && @board[win_arr[1]] == @board[win_arr[2]]
    end
  end

  def full?
    if @board.any? { |e| e == " " }
      return false
    else
      return true
    end
  end

  def draw?
    if full? && !won?
      return true
    end
  end

  def over?
    if draw? || won?
      return true
    else
      return false
    end
  end

  def winner
    if won?
      return @board[won?[1]]
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
      return
    elsif draw?
      puts "Cat's Game!"
      return
    end
  end
end
