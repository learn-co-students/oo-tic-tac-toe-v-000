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
  [2,4,6]
]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = input.to_i - 1
  end

  def move(index, character)
    @board[index] = character
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if index.between?(0,8) && position_taken?(index) == false
      true
    else
      false
    end
  end

  def turn_count
    counter = 0
    @board.each do |item|
      if item == "X" || item == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)

    if valid_move?(index)
      move(index, character = current_player)
      display_board
    else
      turn
    end
  end

  def won?
    winning_combo = []

    WIN_COMBINATIONS.each do |combo|
      if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" ||  @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
        winning_combo += combo
      end
    end

    if winning_combo == []
      false
    else
      winning_combo
    end
  end

  def full?
    full = true
    if @board.any?{|space| space == " "}
      full = false
    end
    full
  end

  def draw?
    draw = false
    if won? == false && full? == true
      draw = true
    end
    draw
  end

  def over?
    over = false
    if won? != false
      over = true
    elsif draw? == true
      over = true
    end
    over
  end

  def winner
    if won?.kind_of?(Array)
      win = won?
      @board[win[0]]
    else
      nil
    end
  end

  def play
    until over? == true
      turn
    end
    if over? == true && won? != false
      puts "Congratulations #{winner}!"
    elsif draw? == true
      puts "Cat's Game!"
    end
  end


end
