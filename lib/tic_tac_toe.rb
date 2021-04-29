class TicTacToe
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  
  def initialize()
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player="X")
    @board[index] = current_player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn()
    puts "Please enter 1-9:"
    i=gets.strip
    i=input_to_index(i)
    while !valid_move?(i)
      puts "Please enter 1-9:"
      i=gets.strip
      i=input_to_index(i)
    end
    move(i,current_player())
    display_board()
    return 
  end

  def turn_count()
    temp=@board.select do |i|
      i=="X" || i=="O"
    end
    temp.length
  end

  def current_player()
    if turn_count() % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?()
    WIN_COMBINATIONS.each do |combo|
      arr=""
      combo.each do |i|
        if position_taken?(i)
          arr= arr + @board[i]
        end
      end
      if (arr== "OOO") || (arr=="XXX")
        return combo
      end
    end
    return false
  end

  def full?()
    !@board.include?(" ")
  end

  def draw?()
    (!won?()) && full?()
  end

  def over?()
    won?() || draw?()
  end

  def winner()
    if won?()==false
      return nil
    end
    @board[won?()[0]]
  end

  def play()
    until over?()
      turn()
    end
    if won?()
      puts "Congratulations #{winner()}!"
    else
      puts "Cat's Game!"
    end
  end
end
