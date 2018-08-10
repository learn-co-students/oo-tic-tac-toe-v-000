class TicTacToe
  def initialize(board = nil)
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = input.to_i - 1
    return index
  end


  def move(index, player = "X")
    @board[index] = player
  end

  def position_taken?(index)
    if @board[index] == "" || @board[index] == " " || @board[index] == nil
      return false
    else
      return true
    end
  end

  def valid_move?(index)
    if position_taken?(index) == false && (index >= 0 && index <= 8)
      return true
    else
      return false
    end
  end

  def turn_count
    @board.count {|pos| pos == "X" || pos == "O"}
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def turn
    puts "Choose a space 1 - 9."
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
    winning_combo = WIN_COMBINATIONS.detect {|combo| @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && position_taken?(combo[0])}
    
  end

  def full?
    @board.all? {|pos| pos == "X" || pos == "O"}
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    if winning_combo = won?
      return @board[winning_combo[0]]
    else
      return nil
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end
