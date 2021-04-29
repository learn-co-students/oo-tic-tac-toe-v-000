

class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end



  def board
    @board
  end


  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, token = "X")
    @board[position.to_i - 1]  = current_player
  end 

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def position_taken?(position)
    @board[position] != " "
  end

  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i - 1)
  end

  def turn
    puts "Please enter a position on the board 1-9:"
    position = gets.strip
      if valid_move?(position)
        move(position, current_player)
        display_board
      else
        turn and return
      end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
      if @board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X" ||
         @board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O"
          return @board[win_combo[0]] #returns the contents of that location on the board, not the location, used for #winner?
      end
    end
    nil
  end

  def full?
    !@board.any? {|space| space == " "}
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won? || full?
  end

  def winner
    won?
  end

  def play
    display_board
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
