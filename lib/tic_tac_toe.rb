class TicTacToe
  
  def initialize
    @board = Array.new(9," ")
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

  def move(index,player)
    @board[index] = player if !position_taken?(index)
  end

  def position_taken?(index)
    ["X","O"].include? @board[index]
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    index = input_to_index(gets.strip)
    if valid_move?(index)
      move(index,current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count{|i| ["X","O"].include? i}
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    x_pos = @board.each_index.select{|x| @board[x]=="X"}
    o_pos = @board.each_index.select{|o| @board[o]=="O"}
    combo = WIN_COMBINATIONS.select do |win|
      win.all?{|i| x_pos.include? i} || win.all?{|i| o_pos.include?   i}
    end
    combo.empty? ? false : combo[0]
  end

  def full?
    @board.all?{|i| ["X","O"].include? i}
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    return nil if !combo = won?
    x_pos = @board.each_index.select{|x| @board[x]=="X"}
    o_pos = @board.each_index.select{|o| @board[o]=="O"}
    if    combo.all?{|i| x_pos.include? i} then "X"
    elsif combo.all?{|i| o_pos.include? i} then "O"
    else nil
    end
  end

  def play
    turn until over?
    won? ? puts("Congratulations #{winner}!") : puts("Cat's Game!")
  end
  
end