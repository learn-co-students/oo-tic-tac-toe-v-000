class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [2, 4, 6],
    [0, 4, 8]
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

  def move(index, play = "X")
    @board[index] = play
  end

  def position_taken?(index)
      !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move? (index)
    if index.to_i.between?(0, 8) && !position_taken?(index)
      true
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
    else
       turn
    end
    display_board
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |win|
      position_taken?(win[0])
        if @board[win[0]] == "X" && @board[win[1]] == "X" && @board[win[2]] == "X"
           win
        elsif
         @board[win[0]] == "O" && @board[win[1]] == "O"  && @board[win[2]] == "O"
          win
        else
          false
        end
      end
  end

  def full?
    if @board.include?(" ")
      false
    else
      true
    end
  end

  def draw?
    if !won? && full?
       true
    end
  end

  def over?
    if won? || draw?
      true
    end
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
      if won?
        puts "Congratulations #{winner}!"
      else
        puts "Cat's Game!"
      end
  end

end
