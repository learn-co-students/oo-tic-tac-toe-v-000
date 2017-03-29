class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # bottom row
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6],
    # ETC, an array for each win combination
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
   def move(index, current_player)
     @board[index] = current_player
   end

   def position_taken?(index)
     !(@board[index].nil? || @board[index] == " ")
   end
   def valid_move?(index)
     index.between?(0,8) && !position_taken?(index)
   end
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end





  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index) == true
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def won?
    draw_flag = 0
    if turn_count != 0

     WIN_COMBINATIONS.each do |win_combination|
       x_flag = 0
       o_flag = 0
       win_combination.each do |win_combination_each|
         if position_taken?(win_combination_each)
            if @board[win_combination_each] == "X"
                 x_flag = x_flag + 1
                 if x_flag == 3
                   return win_combination
                 end

            elsif @board[win_combination_each] == "O"
                 o_flag = o_flag + 1
                 if o_flag == 3
                   return win_combination
                 end
            end
          end #position_taken
         end #combination

       end #combinations
      draw_flag = 1
    elsif turn_count == 0
      false

    end #turn_count
   if draw_flag = 1
     false
   end
  end # won

  def full?
    if turn_count == 9
     true
   else
     false
   end
  end

  def draw?

    #  if won?(board) != true
    #    if full?(board) == true
    #          true
    #    else
    #         false
    #    end
    #  else
    #    false
    #  end

   !won? && full?

  end

  def over?
    if full? || draw? || won?
       true
    else
      false
    end
  end

  def winner
    if won?
      index = won?
      position = index[0]
      return @board[position]
    else
      nil
    end
  end

  def play
     until over?
       turn
     end

    if won? != false
        name = winner
        puts "Congratulations #{name}!"
    end
    if draw? == true
        puts "Cat's Game!"
    end
  end
end
