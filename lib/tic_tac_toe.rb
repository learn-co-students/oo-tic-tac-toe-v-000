class TicTacToe

  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end # end of initialize method

  WIN_COMBINATIONS = [
  [0,1,2], # Top Row
  [3,4,5], # Middle Row
  [6,7,8], # Bottom Row
  [0,3,6], # Left Column
  [1,4,7], # Middle Column
  [2,5,8], # Right Column
  [2,4,6], # Diagonal Right Corner
  [0,4,8] # Diagonal Left Corner
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index,player_token)
    @board[index] = player_token
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) == true && position_taken?(index) == false
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    player_token = current_player #set local variable to return value of current_player method
    if valid_move?(index)
      move(index,player_token)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
  # check board and return the winning combination indexes as an array
  # if there is a win and false/nil if no win combination

    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
      return false
  end

  def full?
    @board.all? do |board_index|
      board_index == "X" || board_index == "O"
    end
  end

  def draw?
    if full? && won? == false
      return true
    end
  end

  def over?
    if won? || draw? == true || full?
      return true
    end
  end

  def winner
    if won?
      winner = won? # get return value of # #won method (win_combination)
      return @board[winner[0]]
    else
      return nil
    end
  end

  def play
    until over?
      turn
    end
        if won?
          win_token = winner# get return value of #winner method
          puts "Congratulations #{win_token}!"
        elsif draw?
          puts "Cat's Game!"
        end
    end

end # end of tic tac toe class
