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
    [0,4,8],
    [2,4,6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(value)
    integer = value.to_i
    index = integer - 1
  end

  def move(index, character = "X")
    @board[index] = character
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      false
    else
      true
    end
  end

  def valid_move?(index)
    if index.between?(0, 8) && position_taken?(index) == false
      true
    else
      false
    end
  end

  def turn_count
    count = 0
    @board.each do |character|
      if character == "X" || character == "O"
        count += 1
      end
    end
    return count
  end

  def current_player
    turn = turn_count
    player = turn.even? ? "X" : "O"
      return player
  end

  def turn
    puts "Please enter 1-9:"
    character = current_player
    input = gets.strip
    play = input_to_index(input)
    if valid_move?(play) == true
      move(play, character)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if combo.all? {|token| @board[token] == "X"}
        return combo
      elsif combo.all? {|token| @board[token] == "O"}
        return combo
      end
    end
    return false
  end

  def full?
    if @board.all? {|move| move == "X" || move == "O"}
      return true
    else
      return false
    end
  end

  def draw?
    if won? == false && full? == true
      return true
    else
      return false
    end
  end

  def over?
    if won? != false || draw? == true || full? == true
      return true
    else
      return false
    end
  end

  def winner
    combo = won?
    if over? == true && combo.all? {|token| @board[token] == "X"}
      return "X"
    elsif over? == true && combo.all? {|token| @board[token] == "O"}
      return "O"
    else
      return nil
    end
  end

  def play
    until over? == true
      turn
    end
    if won? != false
      player = winner
      puts "Congratulations #{player}!"
    elsif draw? == true
      puts "Cat's Game!"
    end
  end
end
