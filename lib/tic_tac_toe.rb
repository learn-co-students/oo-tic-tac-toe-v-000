class TicTacToe
  def initialize(board=nil)
    @board = board || Array.new(9, " ")
  end


# Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0, 1, 2],  #Top row
    [3, 4, 5],  #Middle row
    [6, 7, 8],  #Bottom row
    [0, 3, 6],  #Left column
    [1, 4, 7],  #Middle column
    [2, 5, 8],  #Right column
    [0, 4, 8],  #First diagonal
    [6, 4, 2]   #Second diagonal
    ]


  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end



  def move(location, current_player = "X")
    @board[location.to_i-1] = current_player
  end



  def position_taken?(location)
    !(@board[location].nil? || @board[location] == " ")
  end


  def valid_move?(position)
    position.to_i.between?(1,9) && !position_taken?(position.to_i-  1)
  end


  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    player = current_player
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
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]  #load the value of the board at win  _index_1
      position_2 = @board[win_index_2]  #load the value of the board at win_index_2
      position_3 = @board[win_index_3]  #load the value of the board at win_index_3

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination    #return the win_combination indexes that won
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination    #return the win_combination indexes that won
      else false
      end
    end
    return false
  end



  def full?
    @board.all?{|p| p == "X" || p == "O"}
  end


  def draw?
    if won?
      false
    elsif full?
      true
    else
      false
    end
  end



  def over?
    if draw? || won? || full?
      true
    else
      false
    end
  end



  def winner
    if won? == false
      nil
    else
      winner = won?[1]
      winner = @board[winner]
     end
  end


  def play
    until over?
      turn
    end
    if won?
      if winner == "X"
        puts "Congratulations X!"
      else
        puts "Congratulations O!"
      end
    else
      puts "Cats Game!"
    end
  end





end
