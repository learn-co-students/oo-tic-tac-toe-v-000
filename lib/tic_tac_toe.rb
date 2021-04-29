class TicTacToe

  def initialize(board = Array.new(9, " "))
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
    [2,4,6],
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

  def move(index, character)
    @board[index] = character
  end

  def position_taken?(index)
    (@board[index] ==  " " || @board[index] == "" || @board[index] == nil) ?
        false : true
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    counter = 0
    @board.each do |play|
      if play == "X" || play == "O"
        counter += 1
      end
    end
    return counter
  end

    def current_player
      character = "X"
      if turn_count % 2 == 1
        character = "O"
      else character = "X"
      end
    end

    def turn
    character = current_player
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index) == true
       move(index, character)
       display_board
    else
      turn
    end
  end

    def won?
    WIN_COMBINATIONS.each do |win_combination|
      position_1 = @board[win_combination[0]]
      position_2 = @board[win_combination[1]]
      position_3 = @board[win_combination[2]]
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination
      end
    end
    return false
  end

  def full?
    @board.all? do |pos|
      pos == "X" || pos == "O"
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw? || full?
  end

  def winner
  if won?
    @board[won?.first]
  end
end

  def play
    until over?
      turn
    end
    if
      won?
        puts "Congratulations #{winner}!"
      end
    if
      draw?
        puts "Cat's Game!"
    end
  end
end
