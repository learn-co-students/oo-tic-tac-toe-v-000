class TicTacToe
  def initialize #I create the an array to hold the values of the game
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [ #I'm making a nested array with winning combination board locations
    [0,1,2], #Top row win
    [3,4,5], #Middle row win
    [6,7,8], #Bottom row win
    [0,3,6], #Left column win
    [1,4,7], #Middle column win
    [2,5,8], #Right column win
    [0,4,8], #Left diagnol win
    [2,4,6], #Right diagnol win
  ]

  def display_board #shows array in positions of TicTacToe board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input) #The array has 8 positions but we're asking the user to input positions 1 -9
    input.to_i - 1
  end

  def move(input, character = "X") #We fill a position of the array with X or O for the person's move
    @board[input]= character
  end

  def position_taken?(index) #Returns true/false if the board's position is occupied
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index) #Returns true/false if board's position is free
    @board[index] == " " && index.between?(0,8)
  end

  def turn_count #Counts amount of Xs and Os on the board
    counter = 0
    @board.each do |turn|
      turn == "X" || turn == "O" ? counter += 1 : nil
    end
    counter
  end

  def current_player #If the remaind of the counter and 2 is 0 it's X's turn. If not, it's Os
    move = turn_count
    move % 2 == 0 ? "X" : "O"
  end

  def turn #Asks the player where they want to move, checks if they space is open, and puts X or O
    puts "Please enter 1-9" #If space isn't open, player needs to go against
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
    WIN_COMBINATIONS.detect do |win_combination| #figure out what this exactly does
      win_index_1 = win_combination[0] #Taking value of WIN_COMBINATIONS nested array because it's a number we can
      win_index_2 = win_combination[1] #use to get a value from the board array
      win_index_3 = win_combination[2]
      position_1 = @board[win_index_1]  #Using the win_index number to get the value for the board at that position
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
        if position_1 == "X" && position_2 == "X" && position_3 == "X" #If the three position are X, the player wins
          return win_combination
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O" #If the three position are ), the player wins
          return win_combination
        else
          false
        end
    end
  end

  def full? #the board is full if there are no empty positions
    @board.all?{|position| position != " "} #look back to see what exactly does
  end

  def draw? #The board is full or no one wins
    full? && !won? ? true : false
  end

  def over? #The game is over if someone wins or there's a draw
    won? || draw? ? true : false
  end

  def winner #If someone wins, return X or O for the winner
    win_token = won?
    won? ? @board[win_token[0]] : nil
  end

  def play
    until over? #plays until over? function is true
      turn #asks for players input
    end
    won? ? puts("Congratulations #{winner}!") : puts("Cat's Game!")
  end
end
