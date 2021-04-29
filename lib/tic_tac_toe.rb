class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [6,4,2],
    [0,4,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
  ]

  def initialize(board=nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    line = "-" * 11
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} \n#{line}\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n#{line}\n #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def turn_count
    turns = []
    @board.each do |element|
      if element != " "
        turns << element
      end
    end
    occupied = turns.count
    return occupied
  end

  def current_player
    occupied = turn_count
    if occupied % 2 == 1
      current_player = "O"
      return current_player
    elsif occupied % 2 == 0
      current_player = "X"
      return current_player
    end
  end

  def move(user_input, current_player = "X")
    index = user_input.to_i - 1
    @board[index] = current_player
  end

  def position_taken?(position)
    position = position.to_i
    @board[position] != " "
  end

  def valid_move?(user_input)
    index = user_input.to_i
    position_taken?(index.to_i - 1) != true && index.between?(1,9)
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    if valid_move?(user_input)
      move(user_input, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    outcome = []
    WIN_COMBINATIONS.each do |combo|
      if combo.all?{|i| @board[i] == "X"} || combo.all?{|i| @board[i] == "O"}
        combo.each do |n|
          outcome << n
        end
      end
    end
    if outcome.empty?
      return false
    else
      return outcome
    end
  end

  def full?
    @board.all?{|x| x != " "}
  end

  def draw?
    full? && won? == false
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      return @board[won?[0]]
    else
      return nil
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
