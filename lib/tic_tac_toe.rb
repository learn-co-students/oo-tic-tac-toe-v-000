class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  WIN_COMBINATIONS =[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(string)
    string.to_i - 1
  end

  def move(index, value= "X")
    @board[index] = value
  end

  def position_taken?(index)
    if (@board[index] == " " || @board[index] == "" || @board[index] == nil)
      return false
    else
      return true
    end
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end

  def turn
    puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
      if !valid_move?(index) # when writing a conditional statement, in most cases the eval is implicit.
        turn
      else
        move(index, value = current_player) # needed to define value in order for the method to work. set to current player to determine correct character
      end
      display_board
    end

  def turn_count
        counter = 0
      @board.each do | i|
        if i == "X" || i == "O"
        counter += 1
    end
    end
      counter
    end

  def current_player
      if turn_count % 2 == 0
        return "X"
      else
        return "O"
      end
    end

  def won?
      WIN_COMBINATIONS.detect do |variable|
        win_index_1 = variable[0]
        win_index_2 = variable[1]
        win_index_3 = variable[2]

        position_1 = @board[win_index_1]
        position_2 = @board[win_index_2]
        position_3 = @board[win_index_3]

    if position_1 == position_2 && position_2 == position_3 && position_1 != " "
      return variable # this return just the 3 winning indexes
        end
      end
    end

    def full?
      @board.all?{|char| char if char == "X" || char == "O"}
    end


    def draw?
      !won? && full?
    end
    def over?
      draw?|| won?
    end

    def winner
      if winner_board = won?
        @board[winner_board.first]
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
