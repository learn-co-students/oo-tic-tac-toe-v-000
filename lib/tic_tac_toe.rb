class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
  end

  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #1st column
    [1,4,7], #2nd column
    [2,5,8], #third column
    [0,4,8], #1 diagonal
    [2,4,6] #2nd diagonal
  ]

  def display_board
    puts " #{@board[0]} " + "|" + " #{@board[1]} " + "|" + " #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} " + "|" + " #{@board[4]} " + "|" + " #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} " + "|" + " #{@board[7]} " + "|" + " #{@board[8]} "
  end

  def input_to_index(input)
    index = input.to_i - 1
  end

  def move(index, player = "X")
    @board[index] = player
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == ""
       false
    elsif @board[index] == "O" || @board[index] == "X"
       true
     elsif @board[index] == nil
       false
    end
  end

  def valid_move?(index)
    if position_taken?(index)
      false
    elsif index.between?(0, 8)
      true
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end

  end

  def turn_count
    counter = 0
    @board.each do |space|
      if space == "X" || space == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
       if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
         return combo
       elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
         return combo
       else
       end
    end
    return false
  end

  def full?
    all_full = false
    @board.all? do |space|
      if space == "X" || space == "O"
        all_full = true
      end
    end
  end

  def draw?
    if won?
      false
    elsif full?
      true
    else
      false
    end
  end

  def over?
    if won?
      true
    elsif draw?
      true
    else
      false
    end
  end

  def winner
    WIN_COMBINATIONS.each do |combo|
       if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
         return "X"
       elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
         return "O"
       else
       end
    end
    return nil
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations " + winner + "!"
    end
    if draw?
      puts "Cat's Game!"
    end
  end

end
