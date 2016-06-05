class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def play
    while !over?  do
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

  # code your input_to_index and move method here!
  def input_to_index(int)
    return int.to_i
  end

  # Define your WIN_COMBINATIONS constant
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

#  def move(index, char = "X")
#    if valid_move?(index)
#      @board[index] = char
#    else
#      invalid_move
#    end
#  end

  def move(index, char = "X")
    @board[index.to_i-1] = current_player
    #@board[index] = char
  end

  def position_taken?(location)
      @board[location] != " " && @board[location] != ""
    end

  # code your #valid_move? method here
  def valid_move?(position)
     position.to_i.between?(1, 9) && !position_taken?(position.to_i - 1)
   end

  def turn
    puts "Please enter 1-9:"
    index = gets.strip
    index = input_to_index(index)
    if valid_move?(index)
      move(index)
    else
      puts "That move is invalid!\n"
      turn
    end
    display_board
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    counter = 0
    @board.each do |position|
      if position != "" && position != " " && position != nil
        counter += 1
      end
    end
    return counter
  end

  ## count how many spaces are taken
  def won?
    win_set = nil
    win_set = WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
    end
     if win_set == nil
      win_set = WIN_COMBINATIONS.detect do |combo|
        @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
      end
    end
    return win_set
  end

  def full?
    counter = 0
    9.times do |index|
      if position_taken?(index)
        counter +=1
      end
    end
    return counter == 9
  end

  def draw?
    full = full?
    won = won? == nil
    return  full && won
  end

  def over?
    return draw? || won? != nil
  end

  def winner
    win_X = WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
    end
    win_Y = WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
    end
    if win_X != nil
      return "X"
    end
    if win_Y != nil
      return "O"
    end
    return nil
  end

end
