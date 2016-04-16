class TicTacToe
  def initialize(board= nil)
    @board = board || Array.new(9, " ")
  end


  WIN_COMBINATIONS = 
        [
            [0,1,2],
            [3,4,5],
            [6,7,8],
            [0,3,6],
            [1,4,7],
            [2,5,8],
            [0,4,8],
            [6,4,2]
          ]

    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def move(location, player = "X")
     @board[location.to_i - 1] = player
    end


    def position_taken?(position)
  if (@board[position.to_i] == " ") || (@board[position.to_i] == "") 
    false
  elsif (@board[position.to_i] == nil)
    false
  elsif (@board[position.to_i] == "X") || (@board[position.to_i] == "O") 
    true
  end
end
    def valid_move?(position)
      if position_taken?(position.to_i - 1)  
      false
      elsif (position.to_i.between?(1,9))
       true
      end
    end

    def turn
    player = current_player
    puts "Please enter 1-9:"
    input = gets.strip
      if valid_move?(input) 
      move(input, player)
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
      WIN_COMBINATIONS.each do |position|
        if (@board[position[0]] == "X" && @board[position[1]] == "X" && @board[position[2]] == "X") || (@board[position[0]] == "O" && @board[position[1]] == "O" && @board[position[2]] == "O")
         return position
         end
      end
      false
     end

     def full?
    status = true
     @board.each do |element|
        if !won? && (element == "X" || element == "O")
        status 
        elsif element == " " 
        status = false
        end
     end
    status
  end
  
  def draw?
    d_status = false
    if (full? && !won?)
      d_status = true
    end
    d_status
  end

  def over?
    if won? || full? || draw?
      return true
    end
    false
  end

  def winner
      winning_comination = won?
      if winning_comination
      return @board[winning_comination[0]]
  end
  #nil
end

def play
  while !over? && turn_count <= 9 do
    turn
    end
     if won? 
      win = winner
      puts "Congratulations #{win}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

#final end below   
end
