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
    [6, 4, 2]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, player = "X")
    location = location.to_i
    @board[location - 1] = player
  end

  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end

  def valid_move?(location)
    location = location.to_i
    location.between?(1,9) && !position_taken?(location - 1)
  end

  def turn
    puts "Please enter a number between 1 and 9: "
    input = gets.to_i
    if !valid_move?(input)
      turn
    end
    move(input, current_player)
    display_board
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      position_taken?(win_combo[0]) && (@board[win_combo[0]] == @board[win_combo[1]]) && (@board[win_combo[1]] == @board[win_combo[2]])
    end
  end

  def full?
    WIN_COMBINATIONS.all? do |tokens|
      position_taken?(tokens[0])
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    WIN_COMBINATIONS.detect do |winner|
      if position_taken?(winner[0]) && (@board[winner[0]] == "X") && (@board[winner[1]] == "X") && (@board[winner[2]] == "X")
        return "X"
      elsif position_taken?(winner[0]) && (@board[winner[0]] == "O") && (@board[winner[1]] == "O") && (@board[winner[2]] == "O")
        return "O"
      end
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end