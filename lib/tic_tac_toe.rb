class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9," ")
  end


  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]


  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end


  def input_to_index(input)
    input = input.to_i
    input=(input - 1)
  end


  def move(index, current_player = "X")
    @board[index] = current_player
  end


  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end


  def valid_move?(index)
    if index.between?(0,8)
       if !position_taken?(index)
         true
       end
    end
  end


  def turn_count
    turns = 0
    @board.each do |index|
      if index != " "
        turns += 1
      end
    end
    return turns
  end


  def current_player
    if turn_count % 2 == 0
      current_player = "X"
    else turn_count % 2 != 0
      current_player = "O"
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
      puts "Please enter 1-9:"
        input = gets.strip
        index = input_to_index(input)
    end
  end


  def won?
    WIN_COMBINATIONS.detect do |win_combination_aray|
      if  @board[win_combination_aray[0]] == @board[win_combination_aray[1]] &&
          @board[win_combination_aray[1]] == @board[win_combination_aray[2]] &&
          position_taken?(win_combination_aray[0])
          winner = @board[win_combination_aray[0]]
          return win_combination_aray
      else false
        end
      end
      return false
    end


  def full?
    @board.all?{|token| token == "X" || token == "O"}
  end


  def draw?
     if !won? && full?
        return true
     else
        return false
     end
   end


   def over?
     if won?
       return true
     elsif draw?
       return true
     else
       return false
     end
   end


   def winner
     if draw?
       return nil
     elsif win_combination_aray = won?
       if @board[win_combination_aray[0]]== "X"
         return "X"
       else return "O"
       end
     end
   end


  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end


end
