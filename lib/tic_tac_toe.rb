class TicTacToe

  attr_accessor :board
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

  def initialize(board=nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input = input.to_i - 1
  end

  def move(index, value)
    board[index] = value
  end

  def position_taken?(index)
    board[index] != " "
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end

  def turn_count
    board.count {|turn| turn.include?("X") || turn.include?("O")}
  end

  def turn
    puts "Please enter 1-9"
    input = gets.strip
    index = input_to_index(input)
    if !valid_move?(index)
      turn
    else
      move(index, current_player)
    end
    display_board
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if combo.all? {|play| board[play] == "X"} || combo.all? {|play| board[play] == "O"}
        return combo
      end
    end
    false
  end

  def full?
    !board.include?(" ") ? true : false
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if won = won?
      board[won.first]
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
