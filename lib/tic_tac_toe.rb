class TicTacToe
  WIN_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [6, 4, 2]
    ]

  def initialize
    @board = Array.new(9, " ")
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

  def valid_move?(index)
    !position_taken?(index) && index.between?(0, 8) ? true : false
  end

  def position_taken?(index)
     @board[index] == " " || @board[index] == "" || @board[index] == nil ? false : true
  end

  def move(index, character)
    @board[index] = character
  end

  def turn
    puts "Please enter 1-9:"
      user_input = gets.strip
      index = input_to_index(user_input)
      character = current_player
      if valid_move?(index) == false
        turn
      else move(index, character)
      end
      display_board
  end

  def turn_count
    counter = 0
    @board.each do |board|
      if board == "X" || board == "O"
        counter +=1
    end
  end
  return counter
  end

  def current_player
    if turn_count%2 == 0
      current_player = "X"
    else
      current_player = "O"
  end
  return current_player
  end

  def won?
      WIN_COMBINATIONS.each do |winning_combo|
      if  @board[winning_combo[0]] == @board[winning_combo[1]] && @board[winning_combo[1]] == @board[winning_combo[2]] && position_taken?(winning_combo[0])
        return winning_combo
      else
        false
      end
    end
    return false
  end

  def full?
    @board.all? {|board_full| board_full == "X" || board_full == "O"}
  end

  def draw?
    if !won? && full?
      return true
    elsif won?
      return false
    end
  end

  def over?
    if draw? || won?
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
    until over? == true
      turn
    end
    if winner == "X"
        puts "Congratulations X!"
      elsif winner == "O"
        puts "Congratulations O!"
      elsif draw?
        puts "Cat's Game!"
      end
  end


end
