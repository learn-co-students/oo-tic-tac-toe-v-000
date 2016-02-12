class TicTacToe
 def initialize(board = nil)
    @board = board || Array.new(9, " ")

  end



  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def move(position,character = "X")
    @board[position.to_i-1] = character
end






def valid_move?(position)
    if  position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
        true
        else
        false
    end
end


def position_taken?(position)
    if @board[position] == " "
        false
        elsif @board[position] == ""
        false
        elsif  @board[position] == nil
        false
        else   @board[position] == "X" || @board[position] == "O"
        true
        
    end
end


def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
        move(input, current_player)
        else
        turn
    end
    display_board
end




# Define your play method below
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



def turn_count
    counter = 0
    @board.each do |spot|
        if spot == "X" || spot == "O"
            counter += 1
            else
            nil
        end
    end
    return counter
end

def current_player
    if turn_count % 2 ==0
        return "X"
        else
        return "O"
    end
end

WIN_COMBINATIONS = [
[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[6,4,2]
]



def won?
    WIN_COMBINATIONS.each do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]
        
        p1 = @board[win_index_1] # load the value of the board at win_index_1
        p2 = @board[win_index_2] # load the value of the board at win_index_2
        p3 = @board[win_index_3] # load the value of the board at win_index_3
        
        if (p1 == "X" && p2 == "X" && p3 == "X") || (p1 == "O" && p2 == "O" && p3 == "O")
            return win_combination # return the win_combination indexes that won.
        end
    end
    return false
end


def full?
    @board.all? do |space|
        space == "X" || space == "O"
    end
end


def draw?
    if !won? && full?
        true
    end
end

def over?
    if won? || draw?
        true
        else 
        false
    end
end


def winner
    win = won?  
    return @board[win[0]] if win
end
end