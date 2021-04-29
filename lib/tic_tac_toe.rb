class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def board=(board)
    @board = board
  end

  def board
    @board
  end

    WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #left column
    [1,4,7], #middle column
    [2,5,8], #right column
    [2,4,6], #diagonal up
    [0,4,8] #diagonal down
    ]

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(user_input)
    index = user_input.to_i - 1
  end

  def move(user_input, token)
    board[user_input] = token
  end

  def position_taken?(index)
    !(board[index].nil? || board[index] == " ")
  end

  def valid_move?(index)
    # index - 1
    if index.between?(0,8) != position_taken?(index)
      true
    end
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else turn
    end
  end

  def turn_count
    counter = 0
    board.each do |turn|
      if turn == "O" || turn == "X"
        counter += 1
        # puts "This is turn number #{counter}."
      end
    end
    counter
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won? #returns the winning board array index, e.g. [0,1,2] for a top row win.
      WIN_COMBINATIONS.find do |wins|
        board[wins[0]] == board[wins[1]] && board[wins[0]] == board[wins[2]] && position_taken?(wins[0])
    end
  end

  def full?
    WIN_COMBINATIONS.all? do |wins|
      position_taken?(wins[0])
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end


  def winner #returns "X" or "O"
    if !won?
    else board[won?.first]
    end
  end

  def play
    until over?
      turn
    end #end until loop before beginning new condition.
    if winner
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end
