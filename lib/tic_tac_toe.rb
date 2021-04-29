class TicTacToe

  def initialize
      @board = Array.new(9," ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def display_board
    puts " " + @board[0]  +  " | " + @board[1] + " | " + @board[2] + " "
    puts "-----------\n"
    puts " " + @board[3]  +  " | " + @board[4] + " | " + @board[5] + " "
    puts "-----------\n"
    puts " " + @board[6]  +  " | " + @board[7] + " | " + @board[8] + " "
  end

  def input_to_index(user_input)
    return (user_input.to_i - 1)
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

  def turn_count
    counter = 0

    @board.each do |position|
      if (position == 'X' || position == 'O')
        counter += 1
      end
    end

    return counter
  end

  def current_player
    turns_played = turn_count

    if (turns_played == 0)
      return 'X'
    elsif (turns_played == 1)
      return 'O'
    end

    if ((turns_played % 2) == 0)
      return 'X'
    elsif ((turns_played % 2) == 1)
      return 'O'
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if (position_1 == 'X' && position_2 == 'X' && position_3 == 'X') ||
        (position_1 == 'O' && position_2 == 'O' && position_3 == 'O')
        win = true
        return win_combination
      end
    end
    return false
  end

  def full?
    count = 0

    @board.each do |xo|
      if (xo == '' || xo == ' ')
        count += 1
      end
    end

    if (count > 0)
      return false
    else
      return true
    end
  end

  def draw?
    if (won? == false && full? == true)
      return true
    elsif (won? != false && full? == false)
      return false
    elsif (won? != false && full? == true)
      return false
    end
  end

  def over?
    if(won? != false || full? == true || draw? == true)
      return true
    elsif (full? == false)
      return false
    end
  end

  def winner
    if (won?)
      win_combo = won?

      if(@board[win_combo[0]] == 'X')
        return 'X'
      elsif(@board[win_combo[0]] == 'O')
        return 'O'
      else return nil
      end
    end
  end

  def play
    while (!over?)
        turn
    end

    if (won?)
      #puts "Congratulations " + "#{winner(board)}" + " !"
      if (winner == 'X')
        puts "Congratulations X!"
      elsif (winner == 'O')
        puts "Congratulations O!"
      end
    else #draw?(board)
      puts "Cats Game!"
    end
  end

end
