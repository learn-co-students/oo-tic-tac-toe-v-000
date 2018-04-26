class TicTacToe

  def initialize
    @board = Array.new(9," ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
    ]

    def display_board ()

      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "

    end

    def play
      while (over? == false)
        turn
      end
      if(won?)
        puts "Congratulations #{winner}!"
      elsif(draw?)
        puts "Cat's Game!"
      end
    end

    def input_to_index (input)
        index = input.to_i - 1
    end

    def turn
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)

      while(valid_move?(index) == false)
          puts "invalid"
          puts "Please enter 1-9:"
          input = gets.strip
          index = input_to_index (input)
      end

      move(index, current_player)
      display_board

    end

    def turn_count
      counter = 0
      @board.each {|space| counter += 1 if (space != " " && space != "")}
      counter
    end

    def current_player
     turn_count.odd? ? "O" : "X"
    end

    def move (index, player)
      @board[index] = player
    end

    def position_taken? (index)
      !(@board[index].nil? || @board[index] == " ")
    end

    def valid_move? (index)
     if (index.between?(0,8) && position_taken?(index) == false)
        return true
     else
        return false
     end
    end

    def won?
      WIN_COMBINATIONS.each do |win|
        result = []
        win.each {|el| result << @board[el]}
        if (result.all? {|x_pos| x_pos == "X"})
          return win
        elsif(result.all? {|o_pos| o_pos == "O"})
          return win
        end
      end
      return false
    end

    def full?
     !@board.include? (" ")
    end

    def draw?
      !won? && full?
    end

    def over?
      won? || draw?
    end

    def winner
      if(won? != false)
        final = won?
        if(@board[final[0]] == "X")
          return "X"
        elsif(@board[final[0]] == "O")
          return "O"
        end
      else
        return nil
      end
    end

end
