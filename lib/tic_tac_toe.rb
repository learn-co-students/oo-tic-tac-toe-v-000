class TicTacToe
  attr_accessor :board
  
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end 
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2],
  ]

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} |"
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} |"
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} |"
  end 

  def input_to_index(input)
    input.to_i-1
  end

  def move(position, player_token = "X")
    @board[position] = player_token
  end

  def position_taken?(index)
    if @board[index]=="X" || @board[index]=="O"
      true
    else 
      false 
    end 
  end 

  def valid_move?(input)
    if !position_taken?(input) && input.between?(0,8)
      true
    else
      false
    end 
  end 

  def turn_count
    turn = 0 
    @board.each do |input|
      if input == "X" || input == "O"
        turn += 1
      end 
    end 
     turn
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
    WIN_COMBINATIONS.detect do |winner|
      @board[winner[0]] == @board[winner[1]] &&
      @board[winner[1]] == @board[winner[2]] &&
      (@board[winner[0]] == "X" || @board[winner[0]] == "O")
    end 
  end
  
  def full?
    board.all? do |character| 
      if character == "X" || character == "O"
        true 
      else  
        false 
      end 
    end
  end
  
  def draw?
    if full? && !won?
      true
    else 
      false
    end 
  end 
  
  def over? 
    draw? || won?
  end 
  
  def winner
    if win_combination = won? 
      @board[win_combination[0]]
    else 
      nil
    end
  end 
  
  def play
    until over? do
      turn
    end 
  if won?
    puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end 