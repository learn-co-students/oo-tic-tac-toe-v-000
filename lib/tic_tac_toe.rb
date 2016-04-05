class TicTacToe
  attr_reader :board

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,4,8], [6,4,2], [0,3,6], [1,4,7], [2,5,8]]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def move(location, current_player = "X")
    board[location.to_i-1] = current_player
  end

  def position_taken?(location)
    !(board[location].nil? || board[location] == " ")
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip

    until valid_move?(input)
      puts "Invalid Entry"
      display_board
      input = gets.strip
    end

    move(input, current_player)
  end

  def turn_count
    counter = 0
    board.each do |position|
      unless (position.nil? || position == " ")
        counter += 1
      end
    end
    counter
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      return combination if (combination.all? {|position| board[position] == "X"}) || (combination.all? {|position| board[position] == "O"})
    end
    false
  end

  def full?
    board.each do |character|
      return false unless character == "X" || character == "O"
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    full? || won? || draw?
  end

  def winner
    return board[won?.first] if won?
  end

  def play
    until over?
      turn
    end
    if draw?
      puts "Cats Game!"
    else
      puts "Congratulations #{winner}!"
    end
  end
end
