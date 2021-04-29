class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
    WIN_COMBINATIONS
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [0,4,8],
    [2,5,8],
    [6,4,2],
  ]

  def display_board 
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # code your input_to_index and move method here!
  def input_to_index(input)
    #convert string to integer
   input.to_i - 1
  end


  def move(index, input_value)
    @board[index]= input_value
  end


  # code your #valid_move? method here
  def valid_move?(index)
      if position_taken?(index) != true && index.between?(0,8)
        true
      else
         false
          #execute something else
      end
  end

  # re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
  def position_taken?(index)
  if @board[index] == " " || @board[index] == ""
     false
  elsif @board[index] == nil
    false
  else
    true
  end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, input_value = current_player)
      display_board
    else
      turn
    end
  end



  def turn_count
  count = 0

  @board.each do |turn|
    if turn == "X" || turn == "O"
      count+= 1
    end
  end
  return count
  end

  def current_player

  if turn_count.even? == true
    return "X"
  elsif turn_count.odd? == true
    return "O"
  end

  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]


      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif
          position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
    false
  end

  def full?

    if @board.none?{|i| i == " "}
      return true
    else false
    end
  end

  def draw?
    if (!won?&& full?)
      return true
    end
    return false
  end

  def over?
    if won?|| draw?|| full?
      return true
    else
      false
    end
  end

  def winner
    if won?!= false
      combo = won?
      number = combo[0]
      return @board[number]
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    end
    draw?
    if draw?
      puts "Cat's Game!"
    end
  end


end