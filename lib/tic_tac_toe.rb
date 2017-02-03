class TicTacToe
  def initialize
    @board = Array.new(9," ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],[3,4,5],[6,7,8],
    [0,3,6],[1,4,7],[2,5,8],
    [0,4,8],[2,4,6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9 for your next move:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    count = 0
    @board.each do |temp|
      if temp == 'X' || temp == 'O'
        count +=1
      end
    end
    return count
  end

  def current_player
    if turn_count%2 ==0
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |array|
      @board[array[0]] == @board[array[1]] && @board[array[1]] == @board[array[2]] && (@board[array[0]]=='X' ||@board[array[0]]=='O')
    end
  end

  def full?
    @board.all? do |x|
      x == 'X' || x == 'O'
    end
  end

  def draw?
    won = won?
    full = full?
    if full && !won
      return true
    elsif won
      return false
    elsif !full && !won
      return false
    end
  end

  def over?
    if draw? || won?
      return true
    end
  end

  def winner
    if won?
      array_won = won?
      return @board[array_won[0]]
    end
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