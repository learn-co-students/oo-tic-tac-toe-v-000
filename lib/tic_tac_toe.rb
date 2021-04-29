class TicTacToe
  attr_accessor :counter
  attr_accessor :count
  attr_accessor :input
  attr_accessor :current_p
  attr_accessor :board
  attr_reader :WIN_COMBINATIONS

  def initialize
  @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
                  [0,1,2],
                  [3,4,5],
                  [6,7,8],
                  [0,3,6],
                  [1,4,7],
                  [2,5,8],
                  [0,4,8],
                  [6,4,2] 
                ]

  def won?
    WIN_COMBINATIONS.each do |combo|
      @position_1 = @board[combo[0]]                       #WON HERE
      @position_2 = @board[combo[1]]
      @position_3 = @board[combo[2]]

      if(@position_1 == "X" && @position_2 == "X" && @position_3 == "X" || @position_1 == "O" && @position_2 == "O" && @position_3 == "O")
        return combo
      end
    end
    return false
  end

  def turn
    puts "Please enter 1-9:"
    @position = gets.chomp.to_i
    @current_p = current_player
    if valid_move?(@position)                  #TURN HERE
      move(@position,@current_p)
    else
      puts "Invalid Move!"
      turn
    end
    display_board
  end

  # Define your play method below
  def play
    while !over?
      turn
    end

    if won?
      puts "Congratulations " + winner + "!"
    elsif draw?
      puts "Cats Game!"
    end
  end

  def move(pos,char)
    @board[pos-1]=char
    # @board[@position]=@current_p                   #MOVE DEF HERE
  end

  def full?
    @board.each do |element|                        #FULL HERE
      if(element == " ")
        return false
      end
    end
    return true
  end

  def draw?
    if full? && !won?               #DRAW HERE
      return true
    else
      return false
    end
  end

  def over?
    if draw? || won?                #OVER HERE
      return true
    else
      return false
    end
  end

  def winner
    if won?
      # @win_arr = self.won?[0] #possible error from here                   #WINNER HERE
      return @board[won?[0]]
    else
      # puts !!self.won?(board)      #Used this when debugging
      return nil
    end
  end

  def turn_count
    @counter = 0
    @count = 0
    while @counter < @board.count
      if(@board[@counter]=="X" || @board[@counter]=="O")               #TURN COUNT HERE
        @count +=1
      end
      @counter +=1
    end
    return @count
  end

  def current_player
    if(turn_count%2==0)                    #CURRENT PLAYER HERE
      return "X"
    else
      return "O"
    end
  end

  # code your #valid_move? method here
  def valid_move?(pos)
    # pos = @position
    if(pos.to_i  > 0 && pos.to_i  < 9 && !position_taken?(pos.to_i - 1))   #VALID MOVE HERE
      return true
    else
      return false
    end
  end

  # re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
  def position_taken?(pos)
    pos = pos.to_i 
    if(@board[pos]=="X" || @board[pos]=="O")              #POSITION TAKEN HERE
      return true
    else
      return false
    end
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "        # DISPLAY BOARD HERE
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

end
