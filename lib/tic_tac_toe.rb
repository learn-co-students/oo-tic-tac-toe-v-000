class TicTacToe
def initialize(board = nil)
  @board = board || Array.new(9, " ")
end



  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

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


  def move(index,current_player)
    @board[index] = current_player
  end



  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end



  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end


  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index,current_player)
      display_board
    else
      turn
    end
  end



  def turn_count
    counter = 0
    @board.each do |space|
      if space == "X" || space == "O"
      counter += 1
    end
  end
    counter
  end



  def current_player
    if turn_count % 2 == 0
      "X"
    else "O"
  end
  end



  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      position_1 = @board[win_combination[0]]
      position_2 = @board[win_combination[1]]
      position_3 = @board[win_combination[2]]
      position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
    end
  end



  def full?
    @board.all? do |space|
      space == "X" || space == "O"
    end
  end



  def draw?
    full? && !won?
  end



  def over?
    won? || draw?
  end



  def winner
  if won? && @board[won?[0]] == "X" && @board[won?[1]] == "X" && @board[won?[2]] == "X"
      "X"
  elsif won? && @board[won?[0]] == "O" && @board[won?[1]] == "O" && @board[won?[2]] == "O"
    "O"
    end
  end


  def play
   while over? == false
     turn
    end
      if winner == "X"
        puts "Congratulations X!"
      elsif winner == "O"
        puts "Congratulations O!"
      elsif draw? == true
         puts "Cat's Game!"
    end
  end
end
