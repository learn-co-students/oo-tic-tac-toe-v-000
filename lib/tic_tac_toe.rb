class TicTacToe

    def initialize
    @board = Array.new(9, " ")
  end

  def board
    @board
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

  def display_board
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts     "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
      puts  "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(input)
  input.to_i - 1
  end

  def move (index, value = current_player)
    board[index] = value
  end

  def position_taken?(index)
    !(board[index].nil? || board[index] == " ")
  end

    def valid_move?(index)
      if index < 0 || index > 8
            false
         elsif position_taken?(index)
            false
         else
           true
       end
    end

    def turn_count
      counts = 0
      board.each do |position|
      counts += 1 if position == "X" || position == "O"
      end
      counts
    end


    def current_player
      if turn_count.even?
          "X"
        else
          "O"
      end
    end


      def turn
        puts "Please enter 1-9:"
        input = gets.chomp
        index = input_to_index(input)
        if valid_move?(index)
          move(index,value = current_player)
          display_board
        else
          turn
        end
      end



      def won?
        WIN_COMBINATIONS.detect do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

          if board[win_index_1] == board[win_index_2] && board[win_index_2] == board[win_index_3] && board[win_index_1] != " "
          return win_combination
          end
        end
        false
      end


    def full?
      board.all? do |full_board|
        if full_board == "X" || full_board == "O"
         full_board
        end
      end
    end

    def draw?
     !won? && full?
    end

    def over?
    won? || full? || draw?
    end

    def winner
      if winner_board = won?
        board[winner_board.first]
      end
    end

    def play
      while !over?
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
