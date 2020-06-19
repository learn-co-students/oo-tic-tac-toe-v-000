class TicTacToe

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

  def initialize
    @board=[" "," "," "," "," "," "," "," "," "]
  end

  def board
    @board
  end

  def board=(new_board)
    @board=new_name
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, current_player = "X")
    @board[location - 1] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(location)
    location = location.to_i - 1
    location.between?(0,8) && !position_taken?(location)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    location = input.to_i
    if valid_move?(location)
      move(location, current_player)
      display_board()
    else
      turn
    end
  end

  def turn_count
    @board.count {|x| x == "X" || x == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
  	row = []
  	WIN_COMBINATIONS.each do |win_combos|

  		row[0] = @board[win_combos[0]]
  		row[1] = @board[win_combos[1]]
  		row[2] = @board[win_combos[2]]

  		if row.all? {|token| token == "X"} || row.all? {|token| token == "O"}
  			return win_combos
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
  	!won? && full?
  end

  def over?
  	won? || full? || draw?
  end

  def winner
  	token_array = []
  	if won?
  		token_array = won?
  		token = token_array[0]
  		return @board[token]
  	end
  end

  def play
  	while !over? && turn_count < 9
  		turn
  	end
    if winner
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end
