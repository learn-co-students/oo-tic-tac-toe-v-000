class TicTacToe

  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
  ]

  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    if (input == " ")
      input = gets.chomp
    end
    return (input.to_i - 1)
  end

  def move(index, xOrO = "X")
    @board[index] = xOrO
  end

  def position_taken?(board = :@board, index)
    @board[index] == " " ? false : true
  end

  def valid_move?(index)
    !position_taken?(@board,index) && index.between?(0,8) ? true : false
  end

  def turn()
    aTurn = false
    while (!aTurn)
      puts "Please make a move 1-9:"
      userInput = gets.chomp
      if (userInput.length == 9)
        @board = userInput
        break
      end
      if (userInput.is_a? Array)
        userInput.each do |element|
          if (valid_move?(element))
            move(element, current_player())
          end
        end
      end
      userInput = input_to_index(userInput)
      aMove = valid_move?(userInput)#come back to this.
      if (aMove == true)
        aTurn = true
      end
    end
    move(userInput, current_player())
    display_board()
  end

  def turn_count(board = :@board )
    count = 0
    @board.each do |position|
      if (position == "X" || position == "O")
        count += 1
      end
    end
    return count
  end

  def current_player()
    (turn_count(@board) % 2) == 0 ? "X" : "O"
  end

  def won?()
    WIN_COMBINATIONS.each do |combo|
      if combo.all? { |position| @board[position] == "X" } ||
        combo.all? { |position| @board[position] == "O" }
        return combo
      end
    end
    return false
  end

  def full?()
    if @board.all? { |position| position != " "}
     return true
    end
    return false
  end

  def draw?()
    ( full?() && !won?() ) ? true : false
  end

  def over?()
    (won?() || draw?()) ? true : false
  end

  def winner()
    !won?() ? nil : @board[won?()[0]]
  end

  def play()
    while (!over?())
      turn()
    end
    if (winner() == nil)
      puts "Cat's Game!"
    else
      puts "Congratulations #{winner()}!"
    end
  end
end
