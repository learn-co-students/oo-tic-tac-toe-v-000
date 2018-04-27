class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9," ")
  end
  
  WIN_COMBINATIONS =[
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
     input.to_i - 1
  end
    
  def move(index, value)
    @board[index] = value
  end
  
  def position_taken?(location)
    @board[location] != "" && @board[location] != " "
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count
    count = 0
    @board.each do |move|
      if move == "X" || move == "O"
        count += 1
      end
    end
    count
  end
    
  def current_player
    turn_count.even? ? "X" : "O"
  end 
  
  def turn
    puts "Please enter 1-9:"
    i = gets.strip
    index = input_to_index(i)
    m = valid_move?(index)
    if m == true
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.find do |win_combo|
      @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[0]] == @board[win_combo[2]] && position_taken?(win_combo[1])
    end
  end
  
  def full?
    @board.all? {|i| i == "X" || i == "O"}
  end
     
  def draw?
    won? == nil && full? == true
  end
  
  def over?
    draw? == true || won? != nil
  end
 
  def winner
    if won? != nil
      winner = @board[won?[0]]
    end
  end
  
  def play
    until over? == true
      turn
    end
    if draw? == true
         puts "Cat's Game!"
    else won?
       puts "Congratulations #{winner}!"
     end
  end
  
end