class TicTacToe
  # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  def initialize(board = [" ", " "," "," "," "," "," "," "," "])
    @board = board
  end
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

  def position_taken?(index)
    if(@board[index] != "X" && @board[index] != "O")
      return false
    end
    return true
  end

  def valid_move?(index)
    if(index >= 0 && index <= 8)
      return !(position_taken?(index))
    end
    return false;
  end

  def turn
    puts "Please enter 1-9:"
    input = gets
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  # Define your play method below
  def turn_count
    turn = 0
    @board.each do |mark|
      if(mark == "X" || mark == "O")
        turn += 1
      end
    end
    return turn
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?
    win_combo = [" "," "," "]
    WIN_COMBINATIONS.each do |combo|
      if((@board[combo[0]] == "X" &&
        @board[combo[1]] == "X" && @board[combo[2]] == "X") ||
        (@board[combo[0]] == "O" &&
          @board[combo[1]] == "O" && @board[combo[2]] == "O"))
        win_combo[0] = combo[0]
        win_combo[1] = combo[1]
        win_combo[2] = combo[2]
        return win_combo
      end
    end
    return nil
  end

  def full?
    @board.each do |cell|
      if(cell != "X" && cell != "O")
        return false
      end
    end
    return true
  end

  def draw?
    if(!won? && full?)
        return true
    end
    return false
  end

  def over?
    if(won? || draw?)
      return true
    end
    return false
  end

  def winner
    win_combo = won?
    if(win_combo != nil)
      return @board[win_combo[0]]
    end
    return nil
  end


  def play
    until over?
      turn
    end

    if(won?)
      puts "Congratulations #{winner[0]}!"
    else
      puts "Cat's Game!"
    end
  end
end
