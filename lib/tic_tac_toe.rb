class TicTacToe

  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS =[
    [0, 1, 2], #Top row
    [3, 4, 5], #Middle row
    [6, 7, 8], #Bottom row
    [0, 4, 8], #Left diagonal
    [2, 4, 6], #Right diagonal
    [0, 3, 6], #Left column
    [1, 4, 7], #Middle column
    [2, 5, 8]  #Right column
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

  def move(index,player_token)
    @board[index] = player_token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end

  def current_player
    if turn_count.even?
      return "X"
    else
      return "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    player_token = current_player
    if valid_move?(index)
      move(index,player_token)
      display_board
    else
      turn
    end
  end

  def turn_count
    count = 0
    @board.each do |square|
      if square.include?("X") || square.include?("O")
        count += 1
      end
    end
    return count
  end

  def won?
    WIN_COMBINATIONS.any? do |win_index|
      if position_taken?(win_index[0]) && @board[win_index[0]] == @board[win_index[1]] && @board[win_index[1]] == @board[win_index[2]]
        return win_index
      end
    end
  end

  def full?
    @board.all? do |square|
      square == "X" || square == "O"
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if won? != false
        winning_square_1 = won?[0]
        return @board[winning_square_1]
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
