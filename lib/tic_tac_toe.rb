class TicTacToe
  #constant that provides a library of possible win combinations
  WIN_COMBINATIONS = [
    [0,1,2], # top row
    [3,4,5], # middle row
    [6,7,8], # bottom row
    [0,3,6], # left column
    [1,4,7], # middle column
    [2,5,8], # right column
    [0,4,8], # left-top to right-bottom diagonal
    [2,4,6], # right-top to left-bottom diagonal
  ]

  #set a @board variable equal to a new, empty array that represents the game board
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  #board getter method
  def board
    @board
  end

  #board setter method
  def board=(board)
    @board = board
  end

  #start of helper methods
  #displays the board when called
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  #changes user input to proper index
  def input_to_index(user_input)
    user_input = user_input.to_i - 1
  end

  #takes in the input that the player would like to input onto the board
  def move(index, value)
    @board[index] = value
  end

  #checks to see if the selected position is available for user in puts
  def position_taken?(index)
    position_checked = @board[index]
    if (position_checked == " ") || (position_checked == "") || (position_checked == nil)
      false
    elsif (position_checked == "X") || (position_checked == "O")
      true
    end
  end

  #ensures that the players requested move is actually valid: present on the board and not already filled with a token
  def valid_move?(index)
    if !position_taken?(index) && index.between?(0,8)
      true
    elsif  position_taken?(index) && index.between?(0,8) || index < 0
      false
    end
  end

    #encapsulates the logic to complete multiple turns
  def turn
    puts "Please ener 1-9:"
    input = gets.strip
    to_index = input_to_index(input)
    while valid_move?(to_index) == false
      puts "Please enter 1-9:"
      input = gets.strip
      to_index = input_to_index(input)
    end
    move(to_index, current_player)
    display_board
  end

  #counts the number of turns taken
  def turn_count
    counter = 0
    @board.each do |plays|
      if (plays == "X") || (plays == "O")
        counter += 1
      end
    end
    counter
  end

  #determines which player gets to move
  def current_player
    turn_count.even? ? "X" : "O"
  end

  #checks to see if a player achieved a winning combination
  def won?
    win_combo = []
    #loops through the WIN_COMBINATIONS constant to grab each winning combination so that they can be stored and checked further down in this method against the board
    WIN_COMBINATIONS.select do |combo|
      combo_index_1 = combo[0]
      combo_index_2 = combo[1]
      combo_index_3 = combo[2]

      check_position_1 = @board[combo_index_1]
      check_position_2 = @board[combo_index_2]
      check_position_3 = @board[combo_index_3]

      if (check_position_1 == "X" && check_position_2 == "X" && check_position_3 == "X") || (check_position_1 == "O" && check_position_2 == "O" && check_position_3 == "O")
        win_combo[0] = combo_index_1
        win_combo[1] = combo_index_2
        win_combo[2] = combo_index_3
        return win_combo
      else
        false
      end
    end
    false
  end

  #checks if the board has a gaime in progres or not full, and checks if the board is full and a draw.
  def full?
    #check if there is an in-progress game
    if @board.include?("X") && @board.include?("O") &&
      board.include?(" ")
      false
      #checks if the board is full and a draw
    elsif (!(@board.include?(" "))) && @board.include?("X") && @board.include?("O")
      true
    end
  end

  #chcks if the board is full without a winner
  def draw?
    full? && !won?
  end

  #checks if the game was won or a draw
  def over?
    won? || draw?
  end

  #checks if the game has a winner
  def winner
    if won?
      winning_play = won?
      first_play = winning_play[0]
      if @board[first_play] == "X"
        "X"
      elsif @board[first_play] == "O"
        "O"
      end
    else
      nil
    end
  end
  #end of helper methods

  #starts the game
  def play
    while !over? do
      turn
    end
    player_x_o = winner
    if player_x_o
      puts "Congratulations #{player_x_o}!"
    else
      puts "Cat's Game!"
    end
  end
end
