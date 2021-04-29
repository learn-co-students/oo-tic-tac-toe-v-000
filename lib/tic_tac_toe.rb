class TicTacToe
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
  def initialize (board =  nil)
    @board = board || Array.new(9, " ")
  end


    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    def input_to_index (user_input)
      user_input = user_input.to_i - 1
    end
    def move(index, value)
      @board[index] = value
    end
    def position_taken?(index)

      if @board[index] == " "
        false
      elsif @board[index] == ""
        false
      elsif @board[index] == nil
        false
      else @board[index] == "X" || "O"
        true
      end
    end #position_taken? method here,
    def valid_move? (index)
      if index.between?(0, 8) && position_taken?(index) == false
        true
      else
        false
      end
    end
    def turn
      puts "Please enter 1-9:"
      user_input = gets.strip
      index = input_to_index(user_input)
      value = current_player
      if valid_move?(index) == true
        move(index, value)
        display_board
      else
        turn
      end
    end
    def turn_count
      counter = 0
      @board.each do |player|
        if player == "X" || player == "O"
          counter += 1
        end
      end
      counter = counter
    end
    def current_player
      turns = " "
      if turn_count % 2 == 0
        turns = "X"
      elsif turn_count % 2 == 1
        turns = "O"
      end
      turns = turns
    end
    def won?
      win_combo = WIN_COMBINATIONS.find { |combo| @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" || @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"}
    end
    def full?
     @board.all?{|space| space == "X" || space == "O"}
    end
    def draw?
     if !won? && full?
       true
     else
       false
     end
    end
    def over?
     if won? || draw?
       true
     else
       false
     end
    end

    def winner
     champ = won?
     champ != nil ? @board[champ[0]] : nil
    end
    def play
      until over? || won?
        turn
      end
      if won?
        puts "Congratulations #{winner}!"
      else
        puts"Cat's Game!"
      end
    end
  end
