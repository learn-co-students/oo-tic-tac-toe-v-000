class TicTacToe
  def initialize(board=Array.new(9, " "))
    @board = board
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, character)
    @board[index] = character
  end

  def position_taken?(index)
    !(@board[index] == " " || @board[index] == "" || @board[index] == nil)
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0, 8)
  end

  def turn()
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player())
      display_board()
    else
      turn()
    end
  end

  def turn_count()
    counter = 0
    @board.each do |board_space|
      if board_space == "X" || board_space == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player()
    turn_count() % 2 == 0 ? "X" : "O"
  end

  def won?()
    WIN_COMBINATIONS.detect do |win_combination|
      if @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[1]] == @board[win_combination[2]] && position_taken?(win_combination[0]) && position_taken?(win_combination[1]) && position_taken?(win_combination[2])
        return win_combination
      end
    end
    return false
  end

  def full?()
    @board.all? {|board_space| board_space == "X" || board_space == "O"}
  end

  def draw?()
    !won?() && full?()
  end

  def over?()
    won?() || draw?()
  end

  def winner()
    win_combination = won?()
    win_combination.class == Array ? @board[win_combination[0]] : nil
  end

  def play()
    until over?()
      turn()
    end
    won?() ? (puts "Congratulations #{winner()}!") : (puts "Cat's Game!")
  end
end
