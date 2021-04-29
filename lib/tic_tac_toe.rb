class TicTacToe

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  attr_accessor :board

  def initialize()
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, character)
    @board[index] = character
    @board
  end

  def position_taken?(index)
    pos = @board[index]
    ["X", "O"].include? pos
  end

  def valid_move?(i)
    i.between?(0, 8) && !position_taken?(i)
  end

  def current_player()
    turn_count().even? ? "X" : "O"
  end

  def turn_count()
    counter = 0
    @board.each { |cell| counter += 1 if cell == "X" || cell == "O" }
    counter
  end

  def turn()
    puts "Please enter 1-9:"
    array_index = input_to_index(gets.strip)
    if valid_move?(array_index)
      move(array_index, current_player())
      display_board()
    else
      turn()
    end
  end

  def won?()
    WIN_COMBINATIONS.detect do |win_combination|
      if win_combination.all? {|i| position_taken?(i)}
        if win_combination.all? {|i| @board[i] == "X"}
          true
        elsif win_combination.all?{|i| @board[i] == "O"}
          true
        end
      end
    end
  end

  def full?()
    @board.all? {|i| i != " "}
  end

  def draw?()
    !won?() && full?()
  end

  def over?()
    draw?() || full?() || won?()
  end

  def winner()
     return nil if not won?()

     board_array = won?().map {|e| @board[e] }
     board_array.detect {|e| e == "X" || e == "O"}
  end

  def play()
    turn() until over?()

    if winner()
      puts "Congratulations #{winner()}!"
    elsif draw?()
      puts "Cat's Game!"
    end
  end

end
