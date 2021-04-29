class TicTacToe
  def initialize
    @board = [' ', ' ',' ',' ',' ',' ',' ',' ',' ']
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2],
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

  def move(index, token = 'X')
    @board[index] = token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    return true if (0..8) === index && !position_taken?(index)
    false
  end

  def turn
    puts 'Please enter 1-9:'
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
    t = 0
    @board.each do |value|
      t += 1 if ['X', 'O'].include?(value)
    end
    t
  end

  def current_player
    turn_count.even? ? 'X' : 'O'
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      a, b, c = combo
      return [a, b, c] if @board[a] == @board[b] && @board[b] == @board[c] && ['X', 'O'].include?(@board[a])
    end
    false
  end

  def full?
    @board.all? do |value|
      ['X', 'O'].include?(value)
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || full? || draw?
  end

  def winner
    a, b, c = won?
    a ? @board[a] : nil
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
