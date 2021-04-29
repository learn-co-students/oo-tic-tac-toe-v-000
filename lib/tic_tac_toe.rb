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

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      return true
    end
    false
  end

  def valid_move?(index)
    return true if index.between?(0,8) && position_taken?(index) == false
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
end

  def current_player
    turn_count % 2 == 0 ? "X":"O"
  end


  def turn
    puts "Select 1-9: "
    input = gets.strip
    index = input_to_index(input)
    token = current_player

    if valid_move?(index) == true
      move(index, token)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      arr = [@board[combo[0]], @board[combo[1]], @board[combo[2]]]
      return combo if arr == ["X","X","X"] || arr == ["O","O","O"]
    end
    false
  end

  def full?
    @board.all? {|space| space != " "}
  end

  def draw?
    won? == false && full? == true ? true : false
  end

  def over?
    won? || draw? ? true : false
  end

  def winner
    return @board[won?[0]] if won?
    return nil if draw?
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end


  end

end
