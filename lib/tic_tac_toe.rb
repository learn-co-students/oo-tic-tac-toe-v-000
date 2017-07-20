class TicTacToe
  def initialize (board = nil)
    @board = board || Array.new(9, " ")
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
  def input_to_index(s)
    s.to_i - 1
  end
  def move(s, value = "X")
    @board[s] = value
  end
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  def turn
    puts "Please enter 1-9:"
    index = gets.strip
    index=input_to_index(index)
    if valid_move?(index)
      token=current_player
      move(index, token)
      display_board
    else turn
    end
  end
  def won?
    WIN_COMBINATIONS.each do |win_combo|
      if @board[win_combo[0]] == 'X' && @board[win_combo[1]] == 'X' && @board[win_combo[2]] == 'X'
        return win_combo
      elsif @board[win_combo[0]] == 'O' && @board[win_combo[1]] == 'O' && @board[win_combo[2]] == 'O'
        return win_combo
      end
    end
    false
  end
  def full?
    @board.all? do |position|
      position == "X" || position == "O"
    end
  end
  def draw?
    full? && !won?
  end
  def over?
    draw? || won?
  end
  def winner
    if won?
      @board[won?[0]]
    end
  end
  def current_player
    turn_count % 2 == 0? "X" : "O"
  end
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def play
    while !over?
      turn
    end
   if won?
     puts "Congratulations #{winner}!"
   elsif draw?
     puts "Cat's Game!"
  end
  end
end
