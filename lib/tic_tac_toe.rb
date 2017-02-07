
class TicTacToe
  attr_accessor :board
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8], #Bottom row
    [0,3,6],  # Left horizontal row
    [1,4,7],#center horzontal row
    [2,5,8], #right horizontal row
    [0,4,8], #diagonal down left
    [2,4,6] #diagonal down right
    # ETC, an array for each win combination
  ]


  def initialize(board = nil)
    @board =board || Array.new(9, " ")
  end

  def display_board
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
 end

 def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end


  def turn
  puts "Please enter 1-9:"
  input = gets.strip
    #  input_to_index(user_input)
    if !valid_move?(input)
      turn
    end
      move(input, current_player)
      display_board
  end


  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def move(input, token)
    @board[input.to_i-1] = token
  end

  def valid_move?(index)
      input_to_i.between?(1,9) && !position_taken?(index.to_i-1)
  end

  def position(location)
    @board[location.to_i]
  end

  def position_taken?(location)
    board[location] != " " && board[location] != ""
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !position_taken?(input.to_i-1)
  end

    def won?
      WIN_COMBINATIONS.detect do |strategy|
        board[strategy[0]] == board[strategy[1]] &&
        board[strategy[1]] == board[strategy[2]] &&
        position_taken?(strategy[0])
      end
    end


  def full?
      @board.all? { |token| token == "X" || token == "O"}
  end

  def draw?
    !won? && full?
  end

  def over?
    draw? || won?
  end

  def winner
    if wining = won?
    @winner = position(wining.first)
    end
  end

  def play
    while !over?
      turn
    end
    if  won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
     end
  end


end
