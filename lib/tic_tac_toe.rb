class TicTacToe

  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5],
    [6,7,8], [0,3,6],
    [1,4,7], [2,5,8],
    [0,4,8], [6,4,2]
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

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    @board.select{|token| token == "X" || token == "O"}.length
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    tokens_x = 9.times.select {|token| @board[token] == "X"}
    tokens_o = 9.times.select {|token| @board[token] == "O"}
    WIN_COMBINATIONS.find do |win_combo|
      win_combo - tokens_x == [] || win_combo - tokens_o == []
    end
  end

  def full?
    @board.all? {|spaces| spaces == "X" || spaces == "O"}
  end

  def draw?
    if won?
      false
    elsif full?
      true
    end
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      @board[won?[0]]
    end
  end

  def play
    display_board
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

  def turn
    print "Please enter 1-9: "
    index = input_to_index(gets.strip)
    if valid_move?(index)
      move(index, current_player)
      puts " "
      display_board
    else
      turn
    end
  end

end
