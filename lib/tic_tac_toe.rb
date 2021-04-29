class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6],  # Left Column
    [1,4,7],  # Middle Column
    [2,5,8],  # Right Column
    [0,4,8],  # TL-BR Diagonal
    [2,4,6]   # TR-BL Diagonal
  ]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
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
      puts "Invalid move!\n Try again!"
      turn
    end
  end

  def turn_count
    count = 0
    @board.each do |token|
      if token === 'X' || token === 'O'
        count += 1
      end
    end
    count
  end

  def current_player
    turn_count.even? ? 'X' : 'O'
  end

  def won?
    WIN_COMBINATIONS.detect do |winarr|
      if @board[winarr[0]] == "X" && @board[winarr[1]] == "X" && @board[winarr[2]] == "X"
        winarr.to_a
      elsif @board[winarr[0]] == "O" && @board[winarr[1]] == "O" && @board[winarr[2]] == "O"
        winarr.to_a
      else
        false
      end
    end
  end

  def full?
    @board.none? { |token| token === ' ' }
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if player_win = won?
      @board[player_win.first]
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
