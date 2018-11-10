
class TicTacToe

def initialize(board = [" "," "," "," "," "," "," "," "," "])
  @board = board
end

 WIN_COMBINATIONS = [
  [0,1,2], #Top Hor WIN
  [3,4,5], #Mid Hor WIN
  [6,7,8], #Bot Hor WIN
  [0,3,6], #Left Vert WIN
  [1,4,7], #Mid Vert WIN
  [2,5,8], #Right Vert WIN
  [0,4,8], #DR Diag WIN
  [2,4,6], #DL Diag WIN
  ]

  def display_board=(display_board)
    @display_board = display_board
  end
  def display_board
    @display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts " -----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts " -----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, token)
  @board[index] = token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index. between?(0,8) && position_taken?(index) == false
end

def turn_count
  counter = 0
  @board.each do |boardnum|
    if boardnum != " "
    counter += 1
    end
    end
counter
end

def current_player
  if turn_count % 2 == 0
    return  "X"
  else
   "O"
  end
end

def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
if valid_move?(index)
  move(index, token = current_player)
  display_board
else
  puts "This is not a valid move."
  turn
end
end

def won?
  WIN_COMBINATIONS.each do |combo| # combo =[3, 4, 5]
    position = combo[0] #postion = 3
    position_2 = combo[1] #postion = 4
    position_3 = combo[2] #postion = 5

    cell = @board[position] # "X" || "O"
    cell_2 = @board[position_2]
    cell_3 = @board[position_3]

    if cell == cell_2 && cell_2 == cell_3 && position_taken?(position)
      return combo[0],combo[1],combo[2]
    end
  end
  false
end

def full?
  @board.all? { |empty| empty != " "}
end

def draw?
  if won? == false && full? == true
  return true
  end
end

def over?
  if draw? == true || won? != false
     return true
  end
end

def winner
  WIN_COMBINATIONS.each do |combo|
    position = combo[0]
    position_2 = combo[1]
    position_3 = combo[2]

    cell = @board[position]
    cell_2 = @board[position_2]
    cell_3 = @board[position_3]

    if cell == cell_2 && cell_2 == cell_3 && position_taken?(position)
    return "#{cell}"
    end
  end
  else
    return nil
    end


    def play
      while !over?
        turn
      end
      if won? != false
        puts "Congratulations #{winner}!"
      elsif draw? == true
        puts "Cat's Game!"
      
      end
    end

end #Class End
