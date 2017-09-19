class TicTacToe

  def initialize(board = Array.new(9, " "))
    @board = board
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

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(user_input, player_token)
    @board[user_input] = player_token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |occupied|
      if occupied == "X" || occupied == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player
    if turn_count.even?
      "X"
    elsif turn_count.odd?
      "O"
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |winner| #[0, 1, 2]
        @board[winner[0]] == @board[winner[1]] && @board[winner[0]] == @board[winner[2]] && position_taken?(winner[0])
    end
  end

  def full?
    @board.all? do |board_position|
      board_position == "X" || board_position == "O"
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || (won? && full?) || (won? && !full?)
  end

  def winner
    if won?
      @board[won?[0]]
    end
  end

  def play
    until over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end

end
