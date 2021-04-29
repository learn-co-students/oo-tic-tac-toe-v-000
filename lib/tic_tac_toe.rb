class TicTacToe
  def initialize
    @board = []
    9.times do
      @board.push(' ')
    end
  end
  WIN_COMBINATIONS = [ [3, 4, 5], [6, 7, 8], [0, 3, 6], [0, 1, 2], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]]

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
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] != ' '
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end

  def turn_count
    @board.count{|position| position != " " }
  end

  def current_player
    turn_count.even? ? 'X' : 'O'
  end

  def turn
    puts 'Please enter a number 1-9:'
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      token = current_player
      move(index, token)
    else
      turn
    end
    display_board
  end

  def won?
    WIN_COMBINATIONS.any? do |winboard|
      if position_taken?(winboard[0]) && @board[winboard[0]] == @board[winboard[1]] && @board[winboard[1]] == @board[winboard[2]]
        return winboard
      end
    end
  end

  def full?
    @board.all? { |position| position != ' '}
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    winboard = won?
    if winboard
      return @board[winboard[0]]
    end
  end

  def play
    while !over?
      turn
    end
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end
end