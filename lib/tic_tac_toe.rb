class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end
  WIN_COMBINATIONS = [[0,1,2],
                     [3,4,5],
                     [6,7,8],
                     [0,3,6],
                     [1,4,7],
                     [2,5,8],
                     [0,4,8],
                     [2,4,6]]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    position = user_input.to_i - 1
  end
  
  def move(position, player)
    @board[position] = player
  end
  
  def position_taken?(position)
    @board[position] != " "
  end
  
  def valid_move?(position)
    !position_taken?(position) && position.between?(0,8)
  end
  
  def turn_count
    @board.count{|c| c != " "} 
  end
  
  def turn
    puts "Please enter a number (1-9):"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      player = current_player
      move(index, player)
    else
      turn
    end
    display_board
  end
  
  def current_player
    turn_count.even? ? "X" : "O"
  end
  
  def won?
    WIN_COMBINATIONS.each do |combo|
      win_in_1 = combo[0]
      win_in_2 = combo[1]
      win_in_3 = combo[2]
      
      pos_1 = @board[win_in_1]
      pos_2 = @board[win_in_2]
      pos_3 = @board[win_in_3]
      if (pos_1 == "X" && pos_2 == "X" && pos_3 == "X") || (pos_1 == "O" && pos_2 == "O" && pos_3 == "O" )
        return combo
      end
    end
    return false
  end
  
  def full?
    @board.all? {|i| (i == "X" || i == "O")}
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    won? || draw?
  end

  def winner
   if combo = won?
     @board[combo[0]]
   end
  end

  def play
    until over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end 
  
end