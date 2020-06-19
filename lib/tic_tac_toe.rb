class TicTacToe
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [6, 4, 2],
    [0, 4, 8]
  ]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(index)
    index.to_i - 1
  end

  def move(index, character)
      @board[index] = character
  end

  def position_taken?(index)
    !(@board[index] == " ")
    # @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    @board.count {|spot| spot != " "}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      puts "invalid move"
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.find do |win_combo|
      win_combo.all? do |index|
        @board[win_combo[0]] == @board[index] && @board[index] != " "
        # @board[0] == @board[1] && @board[1] == @board[2] && @board[0] != " "
      end
    end
  end

  def full?
    @board.all? do |character|
      character != " "
    end
  end

  def draw?
    full? && !won?
  end
  
  # def over?
  #   won? || full? ? true : false
  # end

  def over?
      won? || draw?
    end

  def winner
    won? ? @board[won?[0]] : nil
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
