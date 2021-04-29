class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

TicTacToe::WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[6,4,2],[0,4,8]]

  def move(choice, token = "X")
    @board[(choice.to_i)-1] = token
  end

  def position_taken?(position) 
    @board[position] == "O" ||  @board[position] == "X" 
  end

  def valid_move?(position)
    ordinal_position = @board[(position.to_i)-1]
    ordinal_position != "X" && ordinal_position != "O" && position.to_i.between?(1,9)
  end

  def turn
    puts "Please enter 1-9:"
    choice = gets.strip
      until valid_move?(choice)
        puts "Sorry, that is not a valid choice, please enter 1-9:"
        choice = gets.strip
      end
        move(choice, current_player)
        display_board
      end
    
  def turn_count
    @board.count{ |token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    TicTacToe::WIN_COMBINATIONS.detect do |win_combo| 
    win_combo.all? { |obj| @board[obj] == "X"} == true || win_combo.all? { |obj| @board[obj] == "O"}
    end
  end


  def full?
      if @board.detect { |i| i == " "} 
        return false
      else @board.detect { |i| i == "X"} || @board.detect { |i| i == "O"}
        return true
      end
  end

  def draw?
    if full? && won?
        return false 
    elsif full? && won? != true
      return true    
    else won? || full? == false
      return false  
    end
  end

  def over?
    if draw?
      return true
    elsif won?
      return true
    else full? == false
      return false
    end
  end

  def winner
    if won?
      return @board[(won?)[0]]
      else
      end
    end


  def play
      until over?
      turn
      end
      if won?
        puts "Congratulations " + "#{winner}"+"!"
      else draw?
        puts "Cats Game!"
      end
    end

end
