class TicTacToe

  def initialize()
    @board = board || Array.new(9, " ")
  end

  def board
    @board
  end

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def display_board

          puts " #{board[0]} | #{board[1]} | #{board[2]} "
          puts "-----------"
          puts " #{board[3]} | #{board[4]} | #{board[5]} "
          puts "-----------"
          puts " #{board[6]} | #{board[7]} | #{board[8]} "

  end

  def input_to_index(input)
    index = input.to_i - 1
  end

  #move
  def move(index, player)
    @board[index] = player
  end


  #position taken
  def position_taken?(index)
      if @board[index] == " " || @board[index] == "" || @board[index] == nil
        return false
      elsif @board[index] == "X" || "O"
        return true
    end
  end

  #turn
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    player = current_player
      if valid_move?(index) == true
        move(index, player)
        display_board
      else
        turn
      end
  end

  #valid move
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  #current player
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end


  #full
  def full?
      @board.none?{|position| position == " "}
    end

   #over
    def over?
      if won? != false || draw? == true
        true
      else
        false
      end
    end

   #turn_count
    def turn_count
      @board.count{|token| token == "X" || token == "O"}
    end

    #won
    def won?
      WIN_COMBINATIONS.each do |win|
        win_index_1 = board[win[0]]
        win_index_2 = board[win[1]]
        win_index_3 = board[win[2]]

        if win_index_1 == "X" && win_index_2 == "X" && win_index_3 == "X"
          return win
        elsif win_index_1 == "O" && win_index_2 == "O" && win_index_3 == "O"
          return win
        end
      end
      false
    end

    #draw
    def draw?
      if !won? && full?
        true
      elsif won? == false && full? == false
        false
        else
        false
      end
    end

    #winner
    def winner
        if won? != false
          winner = won?
          @board[winner[0]]
      end
    end

    #play
    def play



      until over? == true
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
