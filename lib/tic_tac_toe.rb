class TicTacToe

  def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = board
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

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == ""
      false
    else
      true
    end
  end

  def valid_move?(index)
    if position_taken?(index) == false && index.between?(0, 8)
      true
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9."
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index) == true
      move(index, token = "#{current_player}")
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |position|
      if position == "X" || position == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end

  def won?
    winning_combination = false
    WIN_COMBINATIONS.each do |win_combination|
      position_1 = @board[win_combination[0]]
      position_2 = @board[win_combination[1]]
      position_3 = @board[win_combination[2]]

      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
        winning_combination = win_combination
      end
    end
    winning_combination
  end

  def full?
    @board.all? do |positions|
      positions != " "
    end
  end

  def draw?
    if full? == true && won? == false
      true
    end
  end

  def over?
    if draw? == true || won? != false
      true
    end
  end

  def winner
    if won? != false
      array = won?
      @board[array[0]]
    end
  end

  def play
    until over? == true
      turn
    end

    if won? != false
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end
