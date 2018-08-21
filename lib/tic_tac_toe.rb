class TicTacToe
  def initialize(board = nil)
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
  [2,4,6],
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

  def move(index, player)
    @board[index] = player
  end

  def position_taken?(index)
    !(@board[index] == " " || @board[index] == "" || @board[index] == nil)
  end

  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
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
      "X"
    else
      "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else 
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.find do |win_combination|
      if @board[win_combination[0]] == @board[win_combination[1]] &&
        @board[win_combination[1]] == @board[win_combination[2]] &&
        position_taken?(win_combination[0])
          TRUE
        win_combination
      end
    end
  end
  
  def full?
    @board.all? {|space| space == "X" || space == "O"}
  end
  
  def draw?
    if full? && !won?
      TRUE
    else
      FALSE
    end
  end
  
  def over?
    if draw? || won? || full?
      TRUE
    else
      FALSE
    end
  end
  
  def winner
    if token = won?
      @board[token.first]
    end
  end
  
  def play
    until over?
      turn
    end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
  end  
end