class TicTacToe
  def initialize(board=Array.new(9," "))
    @board = board
  end

  # Define your WIN_COMBINATIONS constant
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






  # display_board displays the Tic Tac Toe board
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # input_to_index converts user input to array index value
  def input_to_index(input)
    input.to_i - 1
  end

  # #move method
  def move(index, token="X")
    @board[index] = token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  # #valid_move? method determins if the user input is:
  #   1) a valid position on the board
  #   2) not taken

  def valid_move?(index)
    if index.between?(0,8)
      !position_taken?(index)
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    index = gets.strip
    index = input_to_index(index)

    player = current_player

    if valid_move?(index)
      move(index,player)

      display_board
    else
      turn
    end
  end

  # #turn_count method - determine number of turns
  def turn_count
    count = 0
    @board.each do |element|
      if !(element == " " || element == "" || element.nil?)
        count += 1
      end
    end
    count
  end


  # #current_player - determine the current player (X or O)
  def current_player
    player = ""
    if turn_count % 2 == 0
      player= "X"
    else
      player = "O"
    end
    player
  end





  # #won? method determines if the game has been won by a player
  # returns array of win_combination if true or nil if false
  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      #Load each win index into a variable
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      #Load the token (if any) at index position into a variable
      position_1 = @board[win_index_1].upcase
      position_2 = @board[win_index_2].upcase
      position_3 = @board[win_index_3].upcase

      # Determine whether positions contain winning X (or O) combination
      (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
    end
  end

  # #full? method determines if there are any open positions left on the board
  def full?
    @board.none? do |position|
      position == " " || position == "" || position.nil?
    end
  end

  # #draw? determines if there is a draw
  # a draw occurs when the board is full and there are no winners
  def draw?
    if full? && !(won?)
      true
    else
      false
    end
  end

  # #over? method determines if any of the following has occured:
  #   1. A player has won
  #   2. The game is a draw
  def over?
    if won? || draw?
      true
    else
      false
    end
  end

  # #winner method determines which player won (X or O)
  def winner
    if won?
      winning_index = won?[0]
      winning_token = @board[winning_index]
    else
      nil
    end
  end

  def play
    until over?
      turn
    end

    winner_of_game = winner

    if won?
      puts "Congratulations #{winner_of_game}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
