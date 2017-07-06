class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [0, 3, 6],
    [0, 4, 8],
    [1, 4, 7],
    [2, 5, 8],
    [2, 4, 6],
    [3, 4, 5],
    [6, 7, 8],
  ]

  def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(user_input, char)
    @board[user_input] = char
  end

  def position_taken?(index)
    if @board[index] == " "
      false
    elsif @board[index] == ""
      false
    elsif @board[index] == nil
      false
    else @board[index] = "X"
      true
    end
  end

  def valid_move?(index)
      if index.between?(0, 8) && @board[index] == " "
        true
      else position_taken?(index) == nil && @board[index] == "X"
        false
      end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
        puts "Please enter 1-9:"
        user_input = gets.strip
        index = input_to_index(user_input)
      if valid_move?(index) == true
        move(index, current_player)
        display_board
      else
        turn
      end
  end

  def won?
    WIN_COMBINATIONS.each do |win|
      if win.all? {|y| @board[y] == "X"}
        return win
      elsif win.all? {|y| @board[y] == "O"}
        return win
      end
    end
    return false
  end

  def full?
    @board.all? do |position|
      position == "X" || position == "O"
    end
  end

  def draw?
    !(won?) && (full?)
  end

  def over?
    if full? == true
      return true
    else full? == false
      return false
    end
  end

  def winner
    if (draw?) || !full? && !won?
      return nil
    elsif (@board[won?[0]] == "X")
      return "X"
    else (@board[won?[0]] == "O")
      return "O"
    end
  end

  def play
    while !over? && !won? && !draw?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    end

    if draw?
      puts "Cat's Game!"
    end
  end
end
