class TicTacToe
  def initialize (board = nil)
    @board = board || Array.new(9," ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5],[6,7,8],[0,4,8], [2,4,6], [0,3,6], [1,4,7], [2,5,8]
  ]

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == ""
      false
    else
      true
    end
  end


  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def move(index, player)
    @board[index] = player
  end

  def turn_count
    counter = 0
    @board.each do |item|
      if item.downcase == "x" || item.downcase == "o"
        counter = counter + 1
      end
    end
    counter
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
     elsif turn_count % 2 != 0
       return "O"
     end
   end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)

    if valid_move?(index) == true
      a = current_player
      move(index,a)
      display_board
    elsif valid_move?(index) == false
      turn
    end

  end


  def won?
  combo = []
  @board.all? { |e| e == " " || e == ""}

  if @board[0] == @board[1] && @board[0] === @board[2] && (@board[0] == "X" || @board[0] == "O")
    true
    combo = WIN_COMBINATIONS[0]
  elsif  @board[3] == @board[4] && @board[3] === @board[5] && (@board[5] == "X" || @board[5] == "O")
    true
    combo = WIN_COMBINATIONS[1]
  elsif @board[6] == @board[7] && @board[6] === @board[8] && (@board[8] == "X" || @board[8] == "O")
    true
    combo = WIN_COMBINATIONS[2]
  elsif @board[0] == @board[4] && @board[0] === @board[8] && (@board[8] == "X" || @board[8] == "O")
    true
    combo = WIN_COMBINATIONS[3]
  elsif @board[2] == @board[4] && @board[2] === @board[6] && (@board[6] == "X" || @board[6] == "O")
    true
    combo = WIN_COMBINATIONS[4]
  elsif  @board[0] == @board[3] && @board[0] === @board[6] && (@board[6] == "X" || @board[6] == "O")
    true
    combo =WIN_COMBINATIONS[5]
  elsif  @board[1] == @board[4] && @board[1] === @board[7] && (@board[7] == "X" || @board[7] == "O")
    true
    combo = WIN_COMBINATIONS[6]
  elsif  @board[2] == @board[5] && @board[2] === @board[8] && (@board[8] == "X" || @board[8] == "O")
    true
    combo = WIN_COMBINATIONS[7]
  else
    false
  end

  end

  def full?
    check = @board.any? { |item| item == "" || item == " "  }
    if check == true
      false
    else
      true
    end
  end

  def draw?
    if full? == true && won? == false
      true
    end
  end

  def over?
    if draw? == true && won? == false
      true
    elsif full? == false && won? == false
      false
    else
      true
    end
  end

  # Define your play method below
  def play
    until over? == true
      turn
    end

    if won? != false
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

  def winner
    if won? != false
      combo = 100
      combo = won?
      position = Integer(combo[0])
      winna = String(@board[position])

      if winna == "X"
        "X"
      elsif winna == "O"
        "O"
      end
    else
      nil
    end

  end

end
