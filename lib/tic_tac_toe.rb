class TicTacToe

  def initialize(board = [" "," "," "," "," "," "," "," "," "])
    @board = board
  end

WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6],
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

  def move(index, token = 'X')
  #  @index = index
    @board[index] = token
  end

  def position_taken?(index)
    if @board[index] == " "
      return false
    elsif @board[index] == "nil"
      return false
    else
      return true
    end
  end

  def valid_move?(index)
    if index < 0 || index > 8 || position_taken?(index) == true
      return false
    else
      return true
    end
  end

  def turn_count
    counter = 0;
    @board.each do |space|
      if space == "X" || space == "O"
        counter += 1;
      end
    end
    return counter
  end

  def current_player
    even_or_odd = turn_count
    if even_or_odd % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
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
    WIN_COMBINATIONS.each do |set|
      win_index_1 = set[0]
      win_index_2 = set[1]
      win_index_3 = set[2]
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      if position_1 == position_2 && position_2 == position_3 && position_taken?(win_index_1)
        return set
      end
    end
    return false
  end

  def full?
    @board.none? do |space|
      if space != "X" && space != "O"
        return false
      end
    end
  end

  def draw?
    if full? && (won? == false)
      return true
    else
      return false
    end
  end

  def over?
    if draw? || full? || won?
      return true
    else
      return false
    end
  end

  def winner
    if won?
      return @board[won?[0]]
    end
  end

  def play
    until over?
      turn
    end
    if over? == true
      if won? != false
          puts "Congratulations " + winner + "!"
      elsif draw? == true
          puts "Cat's Game!"
      end
    end
  end

end
