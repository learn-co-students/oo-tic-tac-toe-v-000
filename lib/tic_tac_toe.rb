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

  def move(position, token = "X")
    @board[position.to_i - 1] = token
  end

  def position_taken?(position)
    if @board[position.to_i] == "X" || @board[position.to_i] == "O"
      true
    else
      false
    end
  end

  def valid_move?(position)
    if position_taken?(position.to_i - 1) == true || (position.to_i).between?(1, 9) == false
      false
    else
      true
    end
  end

  def turn
    display_board
    position = gets.strip
    if valid_move?(position) == false
      turn
    else
      position
    end
  end

  def turn_count
    index = 0
    turns = 0
    @board.each do |turn|
      if @board[index] == "X" || @board[index] == "O"
        turns += 1
      end
      index += 1
    end
    turns
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?
    winning_combination = []
    WIN_COMBINATIONS.each do |combination|
      win_index_1 = combination[0]
      win_index_2 = combination[1]
      win_index_3 = combination[2]

      if (@board[win_index_1] == "X" && @board[win_index_2] == "X" && @board[win_index_3] == "X") ||
        (@board[win_index_1] == "O" && @board[win_index_2] == "O" && @board[win_index_3] == "O")
        winning_combination = combination
      end
    end
    if winning_combination == []
      false
    else
      winning_combination
    end
  end

  def full?
    if turn_count >= 9
      true
    else
      false
    end
  end

  def draw?
    if full? == true && won? == false
      true
    else
      false
    end
  end

  def over?
    if draw? == true || won? != false
      true
    else
      false
    end
  end

  def winner
    if won? != false
      @board[won?[0]]
    else
      nil
    end
  end

  def play
    until over? == true
    puts "Enter a number between 1 and 9."
    move(turn, current_player)
    end
      if draw? == true
        display_board
        puts "Cats Game!"
      elsif won? != false
        display_board
        puts "Congratulations #{winner}!"
      else
        nil
    end
  end

end
