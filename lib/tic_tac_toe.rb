class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    z = user_input.to_i
    z - 1
  end

  def move(user_input, char = "X")
    @board[user_input] = char
  end

  def position_taken?(index)
    !(@board[index] != " " || @board[index] != "" || @board[index] !=  nil) || @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
  index.between?(0, 8) && !position_taken?(index)
  end

  def turn
    char = current_player
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, char)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |char|
      if char == "X"
        counter += 1
      end
      if char == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player
    x = turn_count
    if x.even?
      return "X"
    else
      return "O"
    end
  end

  def won?
     if WIN_COMBINATIONS.each do |win_combo|
      windex1 = win_combo[0]
      windex2 = win_combo[1]
      windex3 = win_combo[2]

      p1 = @board[windex1]
      p2 = @board[windex2]
      p3 = @board[windex3]
          if p1 == "X" && p2 == "X" && p3 == "X"
            return win_combo
          end
          if p1 == "O" && p2 == "O" && p3 == "O"
            return win_combo
          end
        end
      else
        false
      end
    end

    def full?
       @board.all? do |char|
        char == "X" || "O"
        char != " "
        end
    end

    def draw?
      full? && !won?
    end

    def over?
      full? || draw? || won?
    end

    def winner
      if WIN_COMBINATIONS.each do |win_combo|
       windex1 = win_combo[0]
       windex2 = win_combo[1]
       windex3 = win_combo[2]

       p1 = @board[windex1]
       p2 = @board[windex2]
       p3 = @board[windex3]
           if p1 == "X" && p2 == "X" && p3 == "X"
             return "X"
           end
           if p1 == "O" && p2 == "O" && p3 == "O"
             return "O"
           end
         end
       else
         false
       end
     end

     def play
       until over?
         turn
       end
       if winner == "X"
         puts "Congratulations X!"
       elsif winner == "O"
         puts "Congratulations O!"
       else
         puts "Cat's Game!"
       end
     end
  
end