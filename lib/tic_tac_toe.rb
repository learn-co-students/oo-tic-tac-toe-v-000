class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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

  def input_to_index(input)
    index = input.to_i - 1
  end

  def move(index, current_player="X")
    @board[index] = current_player
  end

  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    counter = 0
    while counter < 10
      @board.each do | space |
        if space == "X" || space == "O"
          counter += 1
        end
      end
      return counter
    end
  end

  def current_player
    if turn_count == 0
      return "X"
    elsif turn_count.odd?
      return "O"
    elsif turn_count.even?
      return "X"
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
    WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      position_1 == position_2 && position_2 == position_3 && position_taken?(win_index_1)
    end
  end

  def full?
    @board.all? do | space |
      space == "X" || space == "O"
    end
  end

  def draw?
    if full?
      if won?
        return false
      else
        return true
      end
    end
  end

  def over?
    if full? || won? || draw?
      return true
    elsif full? == false
      return false
    else
      return false
    end
  end

  def winner
    if won?
      winner_character = won?
      return @board[winner_character[0]]
    else
      return nil
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner[0]}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
