class TicTacToe

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8],
  [0,3,6], [1,4,7], [2,5,8],
  [0,4,8], [6,4,2]]

  def initialize(board = Array.new(9," "))
    @board = board
  end
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
#get input from user
def index= (new_index)
    @index = new_index
end
def index
  @index
end
  def valid_move?(index)
    index = index.to_i - 1
    if index.between?(0,8)
      if !(position_taken?(index))
        return true
      end
    else
      return false
    end
  end
  def position_taken?(index)
    if @board[index] == " "
      return false
    elsif @board[index] == ""
      return false
    elsif @board[index] == nil
      return false
    elsif @board[index] == "X"
      return true
    elsif @board[index] == "O"
      return true
    end
  end
  def move(number, value = "X")
    @index = input_to_index(number)
    @board[index] = value
  end
  def input_to_index(number)
    @index = (number.to_i) - 1
  end
  def turn
    until valid_move?(index)
      puts "Please enter 1-9"
      @index = gets.strip
    end
    move(index, current_player)
    display_board
  end

  def current_player
    if turn_count % 2 == 0
       "X"
    else
       "O"
    end
  end
  def turn_count
    @counter = 0
    @board.each do |value|
      if value != " "
        @counter +=1
      end
    end
    return @counter
  end
  def won?

    if WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

        if position_1 == "X" && position_2 == "X" && position_3 == "X"
          return win_combination
        elsif position_1 == "O" && position_2 == "O" && position_3 =="O"
          return win_combination
        end
    end
    else
      false
    end
  end
  def full?
    @board.all? do |i|
      if i == "X" || i == "O"
       true
      else
       false
      end
    end
  end
  def draw?
     if !(won?) && full?
       return true
     else
       return false
     end
  end
  def over?
    if won?|| full? || draw?
      true
    elsif !(won? || full? ||draw?)
      return false
    end
  end
  def winner
    if won?
      @board[won?[0]]

    end
  end
  def play
    until over?
      turn
    end
    winner
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    else
      false
    end
  end
end
