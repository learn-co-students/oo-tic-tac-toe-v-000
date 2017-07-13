class TicTacToe
  def initialize
    @board=[" "," "," "," "," "," "," "," "," "]
  end

  WIN_COMBINATIONS =
  [
    [0,1 ,2], # Top row
    [3,4,5],  # Midlle row
    [6,7,8], # last row
    [0,3,6], # left column
    [1,4,7], # Midlle column
    [2,5,8], # right column
    [0,4,8], # Midlle to the right
    [2,4,6], # Midlle to the left
  ]
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    input= user_input.to_i
    input=input -1
  end

  def move(index,char)
      @board[index] = char
  end

  def position_taken?(index)
   if( (@board[index]=="")|| (@board[index]==" ")|| (@board[index]== nil))
        return false
     else
         return true
     end
  end

  def valid_move?(index)
    if (index<0 || index>8)
       return false
    else
     return !position_taken?(index)
   end
  end

  def current_player
    val_count=turn_count
      if (val_count%2==0)
          return "X"
      else
          return "O"
      end
  end

  def turn_count
    val_count=0
    @board.each do |space|
          if (!(space=="" || space==" ")  )
            val_count+=1
          end
     end
     val_count
  end
  def aski_for_input
    puts "Please enter 1-9:"
    input=gets.strip()
    index=input_to_index(input)
  end
  def turn
     index=aski_for_input()
    if (valid_move?(index))
       move(index,current_player)
       display_board
     else
        turn
    end
  end


  def won?
    won= WIN_COMBINATIONS.each do |win_combo|
      if @board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X"
      return win_combo
    elsif @board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O"
       return win_combo
      end
    end
      return false
  end

  def full?
     @board.none? { |e| e==" " }
  end



  def draw?
    (!won? && full?)
  end

  def over?
     if won?
        true
     else
        full?
      end
  end

  def winner
      combi=won?
    if (won?)
        return @board[combi[0]]
    else

    end
  end

  def play

    until (over?)
      turn
      if draw?
        break
      end

    end

    if won?
      puts "Congratulations #{winner}!"
   elsif (draw?)
     puts "Cat's Game!"
   end

  end
end
