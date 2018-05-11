


class TicTacToe
  
  def initialize(board = [" "] * 9)
    @board = board
  end
  
  
  def ix
    @ix
  end
  
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
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
  
  def input_to_index(user_input)
    @ix = user_input.to_i - 1
  end


  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end
  
  
  def move(ix, current_player)
    @board[ix]= current_player
  end
  
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
    end

  
  def turn_count
    t_count = 0
    @board.each do |cell|
      if cell == "X" || cell == "O"
        t_count += 1
        puts t_count
      end
    end
    return t_count
  end 
  
  
  def current_player
    count = turn_count
    if count.to_f % 2 == 0 
      current_player = "X"
    else
      current_player = "O"
    end
    return current_player
  end






  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    ix = input_to_index(input)
    puts ix
    if valid_move?(ix)
      puts "valid"  
    
      current_player = current_player()
      move(ix,current_player)
      display_board()
    else
      turn
      
    end
  end


  
  def won?
    WIN_COMBINATIONS.each do |combo|
      rw = @board[combo[0]],@board[combo[1]],@board[combo[2]]
      if rw.all?{|cell| cell == "X"}
        puts combo
        return combo
      elsif rw.all?{|cell| cell == "O"}
        puts combo
        return combo
      end
    end
    return false
  end
  
  
  
  def full?
    return ! (@board.any?{|cell| cell == " " })
  end
  
  
  
  def draw?
    if (won?() == false && full?() == true)
      puts "Cat\'s Game!"
      return true
    else
      return false
    end
  end

  
  def over?
    if won?() || full?() || draw?()
      return true
    end
    return false
  end
  
  
  
  def winner
    
    if won?()
      xs = @board.count("X")
      os = @board.count("O")
  
      if xs > os
        puts "Congratulations X!"
        return "X"
      else
        puts "Congratulations O!"
        return "O"
      end
    end
    return nil
  end



  def play
    puts "Welcome to Tic Tac Toe!"
    display_board()
  
    until over?() == true
      puts "not over"
      turn()
    end
    puts "over"
  
    winner()
    draw?()
  
  end



end