class TicTacToe

  def initialize  #assigns an instance variable @board to an array with 9 blank spaces " "
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  WIN_COMBINATIONS = [
    [0,1,2],  #top row horizontal
    [3,4,5],  #middle row horizontal
    [6,7,8],  #bottom row horizontal
    [0,3,6],  #left vertical
    [1,4,7],  #center vertical
    [2,5,8],  #right vertical
    [0,4,8],  #diagonal
    [6,4,2]   #diagonal
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, token)
      @board[input_to_index(index)] = token
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      true
    else
      false
    end
  end

  def valid_move?(input)
    input.to_i.between?(1, 9) && !position_taken?(input.to_i - 1)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    #index = input_to_index(input)
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |element|
      if element != " "
      counter += 1
      end
    end
    counter
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.find do |win_combination|
      if @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X"
        return win_combination
      elsif @board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"
        return win_combination
      else
        false
      end
    end
  end

  def full?
    @board.all?{|positions| positions == "X" || positions == "O"}
  end

  def draw?
    !won? && full?
  end

  def over?
   won? || draw?
  end

  def winner
    WIN_COMBINATIONS.find do |win_combination|
      if @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X" #why && and not ||? Because with &&, you are combining the three indexes as a check if the board contains an X. With ||, it'll check each of those indexes seperately for an X, then move on to the next || condition.
        return "X"
      elsif @board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"
        return "O"
      else
        nil
      end
    end
  end

  def play
    until over?
      turn
    end
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    end
    if draw?
      puts "Cats Game!"
    end
  end

end
