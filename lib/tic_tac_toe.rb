class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],  #Horizontal
    [3, 4, 5],  #Horizontal
    [6, 7, 8],  #Horizontal
    [0, 3, 6],  #Vertical
    [1, 4, 7],  #Vertical
    [2, 5, 8],  #Vertical
    [6, 4, 2],  #Diagonal
    [0, 4, 8]   #Diagonal
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, token = "X")
    @board[position.to_i-1] = token
  end

  def position_taken?(position)
    if @board[position.to_i] == nil || @board[position.to_i]== " " || @board[position.to_i] == ""
      false
      else
      true
    end
  end

  def valid_move?(position)
    position.to_i.between?(1, 9) && position_taken?(position.to_i-1) == false
  end

  def turn
    puts "Please enter 1-9:"
    position = gets.strip
    until valid_move?(position) == true
      puts "Please enter 1-9:"
      position = gets.strip
    end
    move(position.to_i, current_player)
    display_board
  end

  def turn_count
    counter = 0
    @board.each do |turns_taken|
      if turns_taken == "X" || turns_taken == "O"
        counter += 1
      end
    end
      counter
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |win|
      @board[win[0]] == @board[win[1]] && @board[win[1]] == @board[win[2]] && position_taken?(win[0])
    end
  end

  def full?
    !won? && turn_count == 9
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    winner = won?
    if winner
      @board[winner[0]]
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