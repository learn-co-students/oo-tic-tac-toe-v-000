class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, char)
    @board[position.to_i - 1] = char
  end

  def position_taken?(position)
    position = position.to_i
    if @board[position] == "" || @board[position] == " " || @board[position] == nil
      return false
    elsif @board[position] == "X" || @board[position] == "O"
      return true
    end
  end

  def valid_move?(position)
    position = position.to_i - 1
    if position >= 0 && position <= 8
      if position_taken?(position)
        return false
      else
        return true
      end
    else
      return false
    end
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.strip
    if valid_move?(position)
      player = current_player
      move(position, player)
      display_board
    else
      turn
    end
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def won?
    win_flag = false
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0] #note that win_combination is an array of 3 positions
      win_index_2 = win_combination[1] # and win_index will store the position
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1] # load the value of the board at win_index_1
      position_2 = @board[win_index_2] # load the value of the board at win_index_2
      position_3 = @board[win_index_3] # load the value of the board at win_index_3

      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
        win_flag = true
        return win_combination # return the win_combination indexes that won.
      end
    end

    if win_flag == false
      return false
    end

  end

  def full?
    @board.all? {|spot| spot == "X" || spot == "O"}
  end

  def draw?
    return !won? == true && full? == true
  end

  def over?
    if won? == true || draw? == true || full? == true
      return true
    else
      return false
    end
  end

  def winner
    winner = won?
    if winner == false
      return nil
    else
      return @board[winner[0]]
    end
  end

  def play
    until over? do
      if won?
        puts "Congratulations #{winner}!"
        return true
      end
      turn
    end
    if draw?
      puts "Cats Game!"
    end
  end
end
