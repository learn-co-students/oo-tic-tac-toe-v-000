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

  def input_to_index(input)
    index = input.to_i - 1
  end

  def move(index,value)
    @board[index] = value
  end

  def position_taken?(index)
    return true if @board[index] != " "
    false
  end

  def valid_move?(index)
    return true if !position_taken?(index) && index.between?(0,8)
    false
  end

  def turn_count
    @board.count{|value| value == "X" || value == "O"}
  end

  def current_player
    return "X" if turn_count%2 == 0
    "O"
  end

  def turn
    input = gets.strip
    index = input_to_index(input)

    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    board_collection_X = @board.each_index.select {|i| @board[i] == "X"}
    board_collection_O = @board.each_index.select {|i| @board[i] == "O"}

    WIN_COMBINATIONS.each do |element|
      return element if (element - board_collection_X).empty? ||
                        (element - board_collection_O).empty? #array - array available
      end
    return false
  end

  def full?
    @board.none?{|element| element == " "}
  end

  def draw?
    if full? && !won?
      true
    else
      false
    end
  end

  def over?
    arr = [won?,draw?,full?]
    arr.any?{|arr_ele| arr_ele == true}
  end

  def winner
    if winning_array = won?
      @board[winning_array[0]]
    end
  end

  def play
    until over? || won? do
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
