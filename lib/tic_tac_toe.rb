class TicTacToe

  WIN_COMBINATIONS = [
  [0,1,2], #top
  [2,5,8], #right
  [6,7,8], #bottom
  [0,4,8], #diagonal
  [2,4,6], #diagonal
  [3,4,5], #middle-hor
  [1,4,7], #middle-vert
  [0,3,6]  #left
]

  def initialize
    board = Array.new(9, " ")
    @board = board
  end

  def display_board

     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
     puts     "-----------"
     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
     puts     "-----------"
     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)

      input.to_i - 1
    end

    def move(index, current_player = "X")
      @current_player = current_player
      @board[index] = @current_player
    end

    def position_taken?(index)
      @board[index] != " " && @board[index] != ""
    end

    def valid_move?(index)
      index.between?(0,8) && !position_taken?(index)
    end

  def turn_count
    @board.count { |i| i == "X" || i == "O"}
  end

  def current_player
    if turn_count % 2 != 0
  	   return "O"
     elsif turn_count % 2 == 0
        return "X"
     end
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

  def won?
    WIN_COMBINATIONS.detect do |outer_elements| #matches any wins returning boolean
      @board[outer_elements[0]] == @board[outer_elements[1]] && @board[outer_elements[2]] == @board[outer_elements[0]] &&  @board[outer_elements[0]] != " "
   end
  end

  def full?
    if @board.all? { |i| i != " "} #true for draw
      true
    elsif @board.any? { |board_element| board_element != " " }  #false for in progress game
        false
      end
  end

  def draw?
       full? && !won?
  end

  def over?
    full? || won?
  end


  def winner
    WIN_COMBINATIONS.select do |e| #return winning char

      if @board[e[0]] == "X" && @board[e[1]] == "X" && @board[e[2]] == "X"
       return "X"
     elsif @board[e[0]] == "O" && @board[e[1]] == "O" && @board[e[2]] == "O"
       	return "O"
      end
    end
    if draw?
      nil
   end
  end

  def over?
    won? || draw?
  end

  def play
    until over?
      turn
    end
    if won?
      puts("Congratulations #{winner}!")
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
