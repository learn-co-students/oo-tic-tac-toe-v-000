require 'pry'

class TicTacToe
	WIN_COMBINATIONS = [
		[0, 1, 2],
		[3, 4, 5],
		[6, 7, 8],
		[0, 3, 6],
		[1, 4, 7],
		[2, 5, 8],
		[0, 4, 8],
		[2, 4, 6]
	]


  def initialize
  	@board = [" "," "," "," "," "," "," "," "," "]
  end

	def display_board
		puts "-----------"
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
		puts "--------"
		puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
		puts "--------"
		puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
	end

	def input_to_index(input)
		input = input.to_i
		input - 1 unless input == 0
	end

	def move(index, char)
		@board[index] = char
	end

	def position_taken?(index)
		if index != nil
		  !(@board[index].nil? || @board[index].strip.empty?)
		end
	end

	def valid_move?(index)
    !position_taken?(index) && position_exzist?(index)
	end

	def position_exzist?(index)
		if index != nil
		  index.between?(0, 8)
		end

	end

	def turn_count
		@board.select {|i| !i.strip.empty? && !i.nil?}.count
	end

	def current_player
		turn_count.even? ? "X" : "O"
	end

	def turn
		puts "Please place select a space 1 - 9"
		input = gets.chomp.strip
		index = input_to_index(input)

		if !valid_move?(index)
			puts "Invalid Move!"
      turn
		else
      @board[index] = current_player
		end
		display_board
	end

	def won?
		WIN_COMBINATIONS.each do |combo|
	    win_1 = combo[0]
	    win_2 = combo[1]
	    win_3 = combo[2]

	    if @board[win_1] == "X" && @board[win_2] == "X" && @board[win_3] == "X"
	      return combo
	    elsif @board[win_1] == "O" && @board[win_2] == "O" && @board[win_3] == "O"
	      return combo
	    end
	  end
	  false
	end

	def full?
    !@board.any? {|s| s.strip.empty? || s.nil?}
	end

	def draw?
		!won? && full?
	end

	def over?
		draw? || won?
	end

	def winner
		if won?
	    player = won?.first
	    @board[player]
		end
	end

	def play
	  while !over?
	    turn
	  end

	  if !winner.nil?
	    puts "Congratulations #{winner}!"
	  else
	    puts "Cat's Game!"
	  end
  end
end
