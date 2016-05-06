class TicTacToe

  def initialize(board = [" "," "," "," "," "," "," "," "," "])
    @board = board
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

    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def move(pos,char)
      pos1 = pos.to_i - 1
      @board[pos1] = char
      @board
    end# code your move method here!

    def position_taken?(position)#code your #position_taken? method here!
      if @board[position] == " " || @board[position] == "" || @board[position] == nil
        false
      elsif @board[position] == "X" || @board[position] == "O"
        true
      end
    end


    def valid_move?(position)
      pos = position.to_i
      if pos.between?(1,9) && !position_taken?(position.to_i - 1)
        true
      else
        false
      end
    end

    def turn

    char = current_player
     valid = 0
     while valid == 0
      puts "Please enter 1-9:"
      position = gets.strip
      if valid_move?(position) == true
        valid = 1
        move(position,char)
        display_board
      end
     end
   end

   def turn_count
     count = 0
     @board.each do |item|
       if item == "X" || item == "O"
       count += 1
       end
     end
     count
   end

   def current_player
     if turn_count % 2 == 0
       "X"
    else
      "O"
    end
  end

  def won?

    WIN_COMBINATIONS.each do |combo|
      if @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && position_taken?(combo[0])
        return combo
      end
    end
    return false
  end

  def full?
    @board.all? do |character|
      character == "X" || character == "O"
    end
  end

  def draw?

    won?
    if full? && !won?
      true
    else
      false
    end
  end


  def over?
    if draw? || won? != false
      true
    else
      false
    end
  end

  def winner
    if over? && !draw?
      @board[(won?)[0]]
    else
      nil
    end
  end

end
