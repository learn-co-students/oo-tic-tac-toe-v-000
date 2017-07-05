class TicTacToe

  WIN_COMBINATIONS =[
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [1,4,7],
    [0,3,6],
    [2,5,8],
  ]

  def initialize(board = nil)
   @board = board || Array.new(9, " ")
  end
  def board
    @board
  end
  def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input_to_index=input.to_i - 1
  end

  def move(index, token="X")
    @board[index]=token
  end

  def position_taken?(index)
      @board[index]!= " " && @board[index]!= ""
    end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
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
  player_turn = 0
  @board.each do |turn|
    if turn == "X" || turn == "O"
      player_turn += 1
    end
  end
  player_turn
end
def current_player
  if turn_count % 2 == 0
    current_player = "X"
  else current_player = "O"
  end
end

def won?
  WIN_COMBINATIONS.find do |combo|
      @board[combo[0]] == @board [combo[1]] &&
      @board[combo[1]] == @board [combo[2]] &&
      position_taken?(combo[0])
  end
end
def full?
  @board.all? {|player| player=="X" || player=="O"}
end
def draw?
  full?&!won?
end
def over?
  draw?||won?
end
def winner
  if winning_player = won?
  @board[winning_player.first]
else nil
end
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
