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
    index = input.to_i - 1
  end

  def move(index,value)
    @board[index]= value
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false
    else return true
    end
  end


  def valid_move?(index)
    if index.between?(0,8)  && !position_taken?(index)
      return true
    else false
    end
  end


  def turn
    puts "Please enter 1-9:"
    input = gets
    index = input_to_index(input)
    if valid_move?(index)
    move(index,value =current_player)
    display_board
  else turn
    end
  end

  def turn_count
    return @board.count{|x|x != " "}
  end

  def current_player
    if turn_count.even?
      return "X"
    else return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.detect do|win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = @board[win_index_1] # load the value of the @board at win_index_1
      position_2 = @board[win_index_2] # load the value of the @board at win_index_2
      position_3 = @board[win_index_3] # load the value of the @board at win_index_3
    (position_1 == "X" && position_2 == "X" && position_3 == "X")||(position_1 == "O" && position_2 == "O" && position_3 == "O")
  end
  end

  def full?
    @board.all? do |zi|
      !(zi.nil? || zi == " ")
    end
  end

  def draw?
    if won?
      false
    elsif full?
      true
    else
      false
    end
  end

  def over?
    if won? || draw? || full?
      true
    else
      false
    end
  end

  def winner
    if won? == nil
      return nil
    else
    position = won?[0]
    return @board[position]
  end
  end

  def play
    while !over?
      print "where do you want to put it?"
      input = gets
      index = input_to_index(input)
      move(index,current_player)
      display_board
    end
    if draw?
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end

end
