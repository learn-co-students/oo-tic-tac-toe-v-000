class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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

  def display_board
    puts " #{@board[0]} " + "|" + " #{@board[1]} " + "|" + " #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} " + "|" + " #{@board[4]} " + "|" + " #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} " + "|" + " #{@board[7]} " + "|" + " #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
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
    @board.count {|token| token != " "}
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if all_won?("X", combo)
        return combo
      elsif all_won?("O", combo)
        return combo
      end
    end
    else
      false
  end

  def all_won?(token, win_combo)
    win_combo.all? do |position|
      @board[position] == token
    end
  end

  def full?
    @board.all? {|token| token == "X" || token == "O"}
  end

  def draw?
    if full? && !won?
      true
    else
      false
    end
  end

  def over?
    won? ||  draw? || full? ? true : false
  end


  def winner
    if over?
      return @board[won?.first]
    else
      nil
    end
  end

  def play
    until over?
      turn
    end
    if won? != false
      puts "Congratulations " + winner + "!"
    end
    if draw?
      puts "Cat's Game!"
    end
  end

end
