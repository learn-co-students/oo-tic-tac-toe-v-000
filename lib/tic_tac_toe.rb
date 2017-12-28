# require pry
class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [2,4,6],
    [0,4,8]
  ]

  def display_board #{} Define a method display_board that prints a 3x3 Tic Tac Toe Board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def input_to_index(user_input)
    integer = user_input.to_i
    index = integer - 1
  end
  def move(input_to_index, value="X")
    puts @board
    update_array_at_with(input_to_index, value)
  end

  def update_array_at_with(index, value="X")
    @board[index] = value
    return @board
  end
  def position_taken?(index)
    (@board[index] == " " || "")? false:true
    (@board[index] == "X" || @board[index] =="O")
  end
  def valid_move?(index)
    if position_taken?(index) == false && index.between?(0,8)
      return true
    else position_taken?(index) == true
        return false
    end
  end

  def position_taken?(index)
    (@board[index] == " " || "")? false:true
    (@board[index] == "X" || @board[index] =="O")
  end

  def turn_count # ["x", "o", "x", "X ", "o ", ... " "]
    turn_count_number = 0   #set a turn count variable
    @board.each do |spot|    #loop over each SPOT in the board array
      if spot == "X" || spot == "O"     #check if the SPOT is an "X" or an "O"
        turn_count_number += 1    #if it is, add one to turn count
      end
    end   #end of each loop
    return turn_count_number
  end

  def current_player
    if turn_count.even?
      return "X"
    else turn_count.odd?
      return "O"
    end
  end
      def turn
      puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    # input_to_index(user_input)
      if valid_move?(index) == true
        # display_board(board)
        update_array_at_with(index,current_player)
        display_board
      else
        turn
      end
    end
    def won?
      WIN_COMBINATIONS.detect do |win_combination|

        position_1 = @board[win_combination[0]]
        position_2 = @board[win_combination[1]]
        position_3 = @board[win_combination[2]]
        position_1 ==  position_2 && position_2 == position_3  && position_1 != " "
      end
    end
    def full?
      @board.all? do |position|
        position =="X"||position=="O"
      end
    end
    #draw?
    def draw?# returns false if there are any winning combinations
      if full? && !won?
          return true
      else
        return false
      end
    end
    #over?
    def over?
      if draw?|| won?|| full?
        return true
      end
    end
    #winner?
    def winner
      win = won?
    win ? @board[win[0]] : nil
    end
    def play
      until over?
        turn
      end
      if winner
        puts "Congratulations #{winner}!"
      else draw?
        puts "Cat's Game!"
      end
    end

end
