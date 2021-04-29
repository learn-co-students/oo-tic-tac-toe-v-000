class TicTacToe

  def initialize

    @board = Array.new(9, " ")
    
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6],
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

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
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

  def turn_count
    counter = 0
    @board.each do |move|
      if move == "X" || move == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player

    if turn_count.even? == true
      "X"
    else
      "O"
      
    end
  end


  def won?

   WIN_COMBINATIONS.find do
    |combo|

    position_1 = @board[combo[0]]
    position_2 = @board[combo[1]]
    position_3 = @board[combo[2]]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      combo
    else
      false
    end
   end
  end

  
  def full?
    @board.all? do |space|
       space == "X" || space == "O"
    end
  end


  def draw?

    if full? == true && won? == nil
      true

    end
  end


  def over?

   if won? || draw? || full? 
    true
   end
  end


  def winner 

  combo = won?

   if combo
     @board[combo[0]]
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