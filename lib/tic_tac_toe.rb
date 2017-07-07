class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def input_to_index(input)
      index = input.to_i - 1
  end
  def move(index,char)
        @board[index] = char
  end
  def position_taken? (index)
    if @board[index]=="X" || @board[index]=="O"
       true
    else
       false
     end
  end
  def valid_move?(index)
     if index >= 0 && index-1 <= 8 && position_taken?(index) == false
       true
     else
      false
     end
  end
  def turn_count()
    counter = 0
    @board.each do |turn|
        if turn == "X" || turn == "O"
        counter += 1
        end
      end
    counter
    end
  def current_player ()
    if turn_count().even?
     "X"
    else
     "O"
    end
  end
  def turn()
    input=gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index,current_player())
      puts display_board()
    else
      turn()
    end
  end
  def won? ()
    WIN_COMBINATIONS.each do |win_combination|
      if win_combination.all? {|win_index|@board[win_index] == "X"}
        return win_combination
      elsif win_combination.all? {|win_index|@board[win_index] == "O"}
        return win_combination
      end
    end
    false
  end
  def full? ()
    @board.all? do |move|
      move == "X" || move == "O"
    end
  end
  def draw? ()
    if won?()== false && full?() == true
      true
    else
      false
    end
  end
  def over?()
    if won?() != false || full?() == true || draw?() == true
      true
    else
      false
    end
  end
  def winner()
    WIN_COMBINATIONS.each do |win_combination|
     if win_combination.all? {|win_index|@board[win_index] == "X"}
      return "X"
    elsif win_combination.all? {|win_index|@board[win_index] == "O"}
     return "O"
   else
     nil
      end
    end
    nil
  end
  def play()
    while over?() == false
      turn()
    end
    if won?() != false && winner() == "X"
      puts "Congratulations X!"
    elsif won?() != false && winner() == "O"
      puts "Congratulations O!"
    elsif draw?() == true
      puts "Cat's Game!"
    end
  end
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [0,4,8]
]
