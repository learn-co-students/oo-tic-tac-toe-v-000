class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    index = 0
  end 

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
   index =  user_input.to_i - 1
  end

  def move(index, player = "X")
   @board[index] = player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    position_taken?(index) == false && index.between?(0, 8)
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input.to_i)
    if valid_move?(index) == true &&  position_taken?(index) == false
      player = current_player
      move(index, player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @counter = 0
    @board.each do |move|
    if move == 'X' || move == 'O'
      @counter += 1
    end
  end
  return @counter
  end

  def current_player
    turn_count
     @counter.to_i.even? == true ? 'X' : 'O'
  end

  def won?
    WIN_COMBINATIONS.detect { |index_array|
       index_array.all? {|i| @board[i] == "X"} || index_array.all? {|i| @board[i] == "O"}}
  end

  def full?
      @board.all? { |i| !(i == ' ' || i.nil?) }
  end

  def draw?
     !(won?) && full?
  end

  def over?
    full? || won? || draw?
  end

  def winner
    if won?
      if WIN_COMBINATIONS.any? { |index_array| index_array.all? {|i| @board[i] == "X" }}
         @winner = 'X'
       else @winner = 'O'
     end
    end
  end

  def play
    until over?
     turn
    end
    if draw?
      puts 'Cat\'s Game!'
    else
      winner
      puts "Congratulations #{@winner}!"
    end
  end
end