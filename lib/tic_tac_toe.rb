class TicTacToe
  def initialize
  @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6],
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    "#{input}".to_i - 1
  end

  def move(index, value)
    @board[index] = value
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if position_taken?(index)
      puts "The position must be vacant, not currently taken by a player."
    elsif !(index).between?(0, 8)
      puts "You must move to a position within the tic-tac-toe board."
    else false
      true
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index) == true
      move(index, current_player) #!!!!!!!!!!!!!!!!!!!!!!!!!!!
    else
      turn
    end
    display_board
  end

  def turn_count
    counter = 0
    @board.each do |index|
      if index == "X"
        counter += 1
      elsif index == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player
    if turn_count % 2 == 0
      value = "X"
    else
      value = "O"
    end
    value
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[1]] == @board[win_combination[2]] && position_taken?(win_combination[0])
    end
  end

  def full?
    @board.all?{|index| index == "X" || index == "O"}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if won?
      @board[won?[0]]
    end
  end

  def play
    until over?
      turn
    end
     if won?
       puts "Congratulations #{winner}!"
     else draw?
       puts "Cat's Game!"
     end
  end




end
