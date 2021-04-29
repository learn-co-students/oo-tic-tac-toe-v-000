class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end


  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8],
  [0,3,6], [1,4,7], [2,5,8],
  [2,4,6], [0,4,8]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(index, token)
    @board[index.to_i - 1] = token
  end

  def position_taken?(index)
    if @board[index] ==  " " || @board[index] == nil
      false
    else
      true
    end
  end

  def valid_move?(index)
     !position_taken?(index.to_i - 1) && (index.to_i - 1).between?(0,8)
  end

  def turn
    puts "Please enter 1-9:"
    index = gets.strip
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |player|
      if player == "X" || player == "O"
        counter +=1
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

  def won?
    WIN_COMBINATIONS.each do |combo|
      index1 = combo[0]
      index2 = combo[1]
      index3 = combo[2]
      token1 = @board[index1]
      token2 = @board[index2]
      token3 = @board[index3]
        if token1 == "X" && token2 == "X" && token3 == "X"
          return combo
        elsif token1 == "O" && token2 == "O" && token3 == "O"
          return combo
        end
    end
    false
  end


  def full?
    @board.all? do |position|
      position != " "
    end
  end

  def draw?
    if !won? && full?
      true
    end
  end

  def over?
    if won? || draw? || full?
      true
    end
  end

  def winner
    WIN_COMBINATIONS.each do |combo|
      index1 = combo[0]
      index2 = combo[1]
      index3 = combo[2]
      token1 = @board[index1]
      token2 = @board[index2]
      token3 = @board[index3]
      if won? == combo && token1 == "X"
        return token1
      elsif won? == combo && token1 == "O"
        return token1
      else
      end
    end
    nil
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end


end
