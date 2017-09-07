class TicTacToe
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

   WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    index = user_input.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    if (@board[index] == "X") || (@board[index] == "O")
      return true
    elsif (@board[index] == " ") || (@board[index] == "") || (@board[index] == nil)
    return false
    end
  end

  def valid_move?(index)
    if position_taken?(index)
      return false
    elsif index.between?(0,8)
      return true
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
    turn = 0
    @board.each do |space|
      if space == "X" || space == "O"
        turn += 1
     end
    end
    turn
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end


  def won?
    WIN_COMBINATIONS.each do |win_combination|
      if win_combination.all? {|i| @board[i] == "X"} ||  win_combination.all? {|i| @board[i] == "O"}
        return win_combination
      end
    end
    return false
  end

  def full?
    @board.all? { |square| square == "X" || square == "O" }
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || full? || draw?
  end

  def winner
      if win_index = won?
        @board[win_index.first]
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
