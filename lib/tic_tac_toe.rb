class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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
    return index
  end

  def move(index, token='X')
    @board[index] = token
    return @board
  end

  def position_taken?(index)
    if (@board[index] == 'X' || @board[index] == "O")
      return true

    else
      return false
    end
  end

  def valid_move?(index)
    if (position_taken?(index) == false)
      if (0 <= index && index <= 8)
        return true
      else
        return false
      end

    else
      return false
    end
  end

  def turn
    puts "Please enter 1-9"
    input = gets.strip
    index = input_to_index(input)
    token = current_player

    if (valid_move?(index) == true)
      move(index, token)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count{|token| token == 'X' || token == 'O'}
  end

  def current_player
    turn_count.even? ? 'X' : 'O'
  end


  def won?
    WIN_COMBINATIONS.any? do |win_combination|
      if win_combination.all?{|index| @board[index] == 'X'} || win_combination.all?{|index| @board[index] == 'O'}
        return win_combination
      end
    end
  end

  def full?
    full_board = @board.all?{|token| token == 'X' || token == 'O'}

    if (full_board)
      return true

    else
      return false
    end
  end

  ## Checks to see if the game is a draw
  def draw?
    full_board = full? == true
    won = won? != false

    if ( !won ) && (full_board) #full board and no one won
      return true

    elsif ( !won ) && ( !full_board ) #game still in progress
      return false

    elsif ( won ) #someone won
      return false
    end
  end

  ## Checks to see if the game is over
  def over?
    full_board = @board.all? {|position| position == 'X' || position == 'O'}
    won = won? != false
    draw = draw? == true

    if (won && full_board)
      return true

    elsif (won && !full_board)
      return true

    elsif (draw)
      return true

    else
      return false
    end
  end

  def winner
    number_x = @board.count{|token| token == 'X'}
    number_o = @board.count{|token| token =='O'}

    if (number_x > number_o)
      return "X"
    elsif (number_x < number_o)
      return "O"
    else
      return nil
    end
  end

  def play
    while (over? == false)
      turn
    end

    if (won? != false)

      if (winner == "X")
        puts "Congratulations X!"
        return
      elsif (winner == "O")
        puts "Congratulations O!"
        return
      end

    elsif (draw? == true)
      puts "Cat's Game!"
      return
    end
  end

end
