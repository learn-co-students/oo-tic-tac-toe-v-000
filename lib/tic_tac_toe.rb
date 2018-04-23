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

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(index)
    if @board[index] == "O" || @board[index] == "X"
      true
    else
      false
    end
  end

  def valid_move?(index)
    if position_taken?(index)
      false
    else
      return true if index.between?(0,8)
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    player = current_player
    if valid_move?(index)
      move(index, player)
      display_board
    else
      turn
    end
  end

  def turn_count
    count = 0
    @board.each do |play|
      if play == "O" || play == "X"
        count +=1
      end
    end
    count
  end

  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end

  def won?
    winner = nil
    WIN_COMBINATIONS.each do |combo|
      if combo.all? {|idx| @board[idx] == "X"}
        winner = combo
      elsif combo.all? {|idx| @board[idx] == "O"}
        winner = combo
      else
        false
      end
    end
    if winner != nil
      winner
    else
      false
    end
  end

  def full?
    @board.all? {|token| token == "X" || token == "O"}
  end

  def draw?
    if full? && !(won?)
      true
    else
      false
    end
  end

  def over?
    if draw? || won? || full?
      true
    else
      false
    end
  end

  def winner
    WIN_COMBINATIONS.each do |combo|
      if combo.all? {|idx| @board[idx] == "X"}
        return "X"
      elsif combo.all? {|idx| @board[idx] == "O"}
        return "O"
      end
    end
    nil
  end

  def play
    display_board
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
