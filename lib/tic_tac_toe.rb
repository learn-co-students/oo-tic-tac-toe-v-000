class TicTacToe
	def initialize(board = nil)
		@board = board || Array.new(9, " ")
	end

	WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

	def display_board
		puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
		puts "-----------"
		puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
		puts "-----------"
		puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
		puts "-----------"
	end

	def move(pos, char)
		pos = pos.to_i - 1
		@board[pos] = char
	end

	def position_taken?(position)
		if @board[position] == " " || @board[position] == "" || @board[position] == nil 
			return false
		else @board[position] == "O" || "X"
			return true
		end
	end
	
	def valid_move?(position)
		position=position.to_i - 1
		#puts "position is #{position}"
		#puts "@board is #{@board}"
		#puts "spot #{position.between?(0,8)}"
		#puts "taken? #{!position_taken?(@board, position)}" # showed the position_taken method was returning
								    #the opposite of what was expected.
		(position.between?(0,8) && !position_taken?(position))
	end
	
	def turn_count
		turns = []
		@board.select do |marker|
			if marker == "O" || marker == "X"
				turns << marker
			end
		end
		return turns.length
	end
	
	def current_player
		count = turn_count
		if count.odd?
			return "O"
		else
			return "X"
		end
	end
	
	def won?
		WIN_COMBINATIONS.detect do |win_combination|
			@board1 = win_combination[0]
			@board2 = win_combination[1]
			@board3 = win_combination[2]
			@board[@board1] == @board[@board2] && @board[@board2] == @board[@board3] && @board[@board3] != " "
		end
	end
	
	def full?
		full_array = @board.select do |position|
			position == "X" || position == "O"
		end
		if full_array.length == 9
			return true
		else
			return false
		end
	end
	def draw?
		!won? && full?
	end
	def over?
		won? || draw?
		#won?(@board) || full?(@board) || draw?(@board)
	end
	def winner
		my_array = won?
		if my_array.nil? == true
			return
		else
			#puts "winning array is #{my_array}"
			my_array.each do |position|
				#puts "position number is #{position}"
				pos = position[0]
				marker = @board[pos]
				#puts "position marker is #{marker}"
				return marker
			end
		end
	end
	
	def turn
		#Get user input
		puts "Please enter 1-9:"
		input = gets.strip
		#validate the move
		#x = "X"
		#o = "O"
		player = current_player
		if valid_move?(input) == true
			#move(@board, input, player)
			move(input, player)
		else
			turn
		end
		display_board
	end
	
	def play
		until over?
			turn
		end
	
		#if winner(@board)
		#	puts "Congratulations #{winner(@board)}!"
		#else
		#	puts "Cat's Game!"
		#end
		
		if over? == true
			if won? == true
				my_winner = winner
				puts "Congratulations #{my_winner}"
				exit
			elsif draw? == true
				puts "Cat's Game!"
				exit
			end
		end
	end
end
