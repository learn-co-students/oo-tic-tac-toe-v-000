class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #left row
    [1,4,7], #middle row
    [2,5,8], #right row
    [0,4,8], #diagonal left to right
    [2,4,6] #diagonal right to left
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    (input.to_i) - 1
  end

  def move(position, token)
    @board[position] = token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index) ? true : false
  end

  def turn_count
    @board.count{|i| i == "X" || i == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    x = gets.strip.to_i - 1
    input_to_index(x)
    if valid_move?(x)
      move(x, current_player)
      display_board
      # won?
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      win_index_1 = combo[0]
      win_index_2 = combo[1]
      win_index_3 = combo[2]

      position_1 = @board[combo[0]]
      position_2 = @board[combo[1]]
      position_3 = @board[combo[2]]

      if (position_1 == "X" && position_2 == "X" && position_3 == "X")
        return combo
      elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return combo
      else
        false
      end
    end

    if @board == ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
      false
    end
  end

  def full?
    @board.select{|i| i == "X" || i == "O"}.length == 9
  end

  def draw?
    !won? && full? ? true : false
  end

  def over?
    if won? || full? || draw?
      true
    else
      false
    end
  end

  def winner
    if won? == nil
      nil
    elsif won? != false
      @board[won?[0]]
    end
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
