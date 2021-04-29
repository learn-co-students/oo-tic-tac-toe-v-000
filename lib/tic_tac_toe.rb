class TicTacToe
  #------------------01_tic_tac_toe_spec------------------
  def initialize(board=nil)
    @board = board || Array.new(9, " ")
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
			puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
			puts "-----------"
			puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
			puts "-----------"
			puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
	end
  def input_to_index(input)
			index = input.to_i - 1
  end
  def move(position, token)
			@board[position] = token
			turn_count
			display_board
  end
  def position_taken?(index)
			@board[index] == "X" || @board[index] == "O"
  end
  def valid_move? (index)
			index.between?(0, 8) && position_taken?(index) == false
	end
  def turn_count
    	counter = 0
    	@board.each do |space|
    	   if space == "X" || space == "O"
    			 counter += 1
    		 end
    	end
    	counter
    end
    def current_player
			if turn_count % 2 == 0
				return "X"
			else
				return "O"
			end
    end
    def turn
    	puts "Please enter 1-9:"
			input = gets.chomp
			index = input_to_index(input)
  			if valid_move?(index)
    			move(index, current_player)
    		else
    			puts "Invalid move, please enter 1-9:"
    			turn
    		end
    end
    def won?
			WIN_COMBINATIONS.find do |combo|
				@board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]] && position_taken?(combo[1])
			end
		end
    def full?
			@board.all?{ |i| i == "X" || i == "O" }
    end
		def draw?
			!won? && full?
		end
    def over?
			won? != nil || draw?
		end
		def winner
			if won?
				winner = @board[won?[0]]
			else
				return nil
			end
    end

    #------------------02_play_spec---------------------
    def play
			until over?
				turn
			end
			if won?
				puts "Congratulations #{winner}!"
			else draw?
				puts "Cat's Game!"
			end
    end

end
