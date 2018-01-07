class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],  # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6],  # 1st column
    [1,4,7],  # 2nd column
    [2,5,8],  # 3rd column
    [0,4,8],  # diagonal down
    [2,4,6]   # diagonal up
  ]

  def input_to_index(input)
    input.to_i-1
  end

  def move(index,value="X")
    @board[index] = value
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  # code your #valid_move? method here
  def valid_move?(index)
    (position_taken?(index) == true || index.between?(0,8) == false)? false : true
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
    else
      puts "That's not valid input"
      turn
    end
    display_board
  end

  def current_player
    return (turn_count % 2 == 0)? "X":"O"
  end

  def turn_count
    #This could be a problem - Can I run @board.select? Will be an interesting experiment
    return @board.select {|index| index != "" && index != " "}.size
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      positions = [@board[combo[0]],@board[combo[1]],@board[combo[2]]]
        if (positions[0] == "X" && positions[1] == "X" && positions[2] == "X") || (positions[0] == "O" && positions[1] == "O" && positions[2] == "O")
          return combo
        end
    end
    return false
  end

  def full?
    @board.all? {|position| !(position.nil? || position == " ")}
  end

  def draw?
    (won? == false && full? == true)? true : false
  end

  def over?
    (won? != false || draw? == true)? true : false
  end

  def winner
    won? == false ?  nil : @board[won?[0]]
  end

  def play
    until over? == true
      turn
    end
    (won? != false)? (puts "Congratulations #{winner}!" ): (puts "Cat's Game!")
  end

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
end
