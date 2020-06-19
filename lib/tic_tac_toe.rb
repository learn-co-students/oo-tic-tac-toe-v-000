class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

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

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end


  def move(user_input, value = "X")
    @board[user_input.to_i-1] = value
  end

  def position_taken?(user_input)
    @board[user_input.to_i] == "X" || @board[user_input.to_i] == "O"
  end

  def valid_move?(user_input)
    !position_taken?(user_input.to_i-1) && user_input.to_i.between?(1, 9)
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    if valid_move?(user_input)
      move(user_input, current_player)
      display_board
    else turn
    end
  end


  def won?

  WIN_COMBINATIONS.each do |combination|
    position_1 = @board[combination[0]]
    position_2 = @board[combination[1]]
    position_3 = @board[combination[2]]

    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
      return combination
    end
  end
  false
  end

  def full?
  @board.none? {|board_element| board_element == " "}
  end

  def draw?
    if full? && !won?
      return true
    elsif won?
      return false
    end
  end

  def over?
    @board.each do |board_element|
    if full? || won? || draw?
      return true
    end
  end
  false
  end


  def winner
    WIN_COMBINATIONS.each do |combination|
      position_1 = @board[combination[0]]
      position_2 = @board[combination[1]]
      position_3 = @board[combination[2]]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return "X"
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return "O"
      end
    end
    nil
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
