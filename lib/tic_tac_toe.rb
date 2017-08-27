class TicTacToe

  def initialize(board=nil)
    @board=board || Array.new(9," ")
  end
  # attr_accessor(:board)
  def board
    @board
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
  def display_board
    puts" #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts" #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts" #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(str)
    if str =~ /\d/         # Calling String's =~ method.
      index = Integer(str) - 1
    else
      index = - 1
    end
    @index=index
  end

  # def index
  #   @index=index
  # end

  def position_taken?(index)

    !(@board[index].nil? || @board[index] == " ")

  end

  def move(index,char="X")
    @board[index]=char

  end



  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end
# whats going on here????
  def turn
    puts "Please enter 1-9:"
    input = gets
    # input=gets.strip
    @index=input_to_index(input)
    if valid_move?(@index)
      move(@index,current_player)
    else
      turn
    end

    display_board
  end


  def turn_count
    count=0
    i=0
    while i <= 9
      if @board[i] =="X" || @board[i] =="O"
        count+=1
      end
      i+=1
    end
    count
  end


  def current_player
     turn_count.even?  ? "X" : "O"
  end

  def helper(arr)
      k=0
      index=0
      i=0
  # Checking first row, diagonal, first column
       while i < 4
          if arr[i]== 0
            if arr.include?(1) && arr.include?(2)
               temp_arr=[0,1,2]
            end
            if arr.include?(4) && arr.include?(8)
                temp_arr=[0,4,8]
            end
            if arr.include?(3) && arr.include?(6)
                temp_arr=[0,3,6]
            end
         end
  # Checking Middle Column
         if arr[i]==1 && arr.include?(4) && arr.include?(7)
            temp_arr=[1,4,7]
         end
  # Checking diagonal or last column
         if arr[i]==2
            if arr.include?(4) && arr.include?(6)
            temp_arr=[2,4,6]
            end
            if arr.include?(5) && arr.include?(8)
            temp_arr=[2,5,8]
            end
          end
  # Checking if middle row
          if arr[i]==3 && arr.include?(4) && arr.include?(5)
             temp_arr=[3,4,5]
          end
          # Checking if bottom row
         if arr[i]==6 && arr.include?(7) && arr.include?(8)
            temp_arr=[6,7,8]
         end
        i+=1
       end
  #  Checking if its a WIN_COMBINATIONS
       k=0
        while k < 9
              if (WIN_COMBINATIONS[k] == temp_arr)
                 return temp_arr
                 break
              else
                 k+=1
              end
         end
        return false
      end



      # helper to won?
      def helper(arr)
          k=0
          index=0
          i=0
      # Checking first row, diagonal, first column
           while i < 4
              if arr[i]== 0
                if arr.include?(1) && arr.include?(2)
                   temp_arr=[0,1,2]
                end
                if arr.include?(4) && arr.include?(8)
                    temp_arr=[0,4,8]
                end
                if arr.include?(3) && arr.include?(6)
                    temp_arr=[0,3,6]
                end
             end
      # Checking Middle Column
             if arr[i]==1 && arr.include?(4) && arr.include?(7)
                temp_arr=[1,4,7]
             end
      # Checking diagonal or last column
             if arr[i]==2
                if arr.include?(4) && arr.include?(6)
                temp_arr=[2,4,6]
                end
                if arr.include?(5) && arr.include?(8)
                temp_arr=[2,5,8]
                end
              end
      # Checking if middle row
              if arr[i]==3 && arr.include?(4) && arr.include?(5)
                 temp_arr=[3,4,5]
              end
              # Checking if bottom row
             if arr[i]==6 && arr.include?(7) && arr.include?(8)
                temp_arr=[6,7,8]
             end
            i+=1
           end
      #  Checking if its a WIN_COMBINATIONS
           k=0
            while k < 9
                  if (WIN_COMBINATIONS[k] == temp_arr)
                     return temp_arr
                     break
                  else
                     k+=1
                  end
            end
            return false
          end

             def won?

             #
             #  Checking if the postions are taken and grabing indeces -> temporary arrays
             #    "X"--> x_temp   "O"--> o_temp
               x_temp=[]
               o_temp=[]
               i=0
               count=0
               while i< 9
                 if position_taken?(i)
                   if @board[i]=="X"
                     x_temp << i
                   end
                   if @board[i]=="O"
                     o_temp << i
                   end
                   count+=1
                 end
               i+=1
               end
               #  count=0 means array is empty
               if count == 0
                    return false
               end

               if helper(x_temp)
                #  puts "X won "
                 return helper(x_temp)
               end
               if helper(o_temp)
                #  puts "O won "
                 return helper(o_temp)
               end

             end

      def full?
        count_x=@board.count("X")
        count_o=@board.count("O")
        val=count_x + count_o
        if val == 9
          return true
        else
          return false
        end
      end
      ### `#draw?`


      def draw?
        # call full
        if !won? && full?
          puts "Cat's Game!"
          return true
        end


      end
      # Build a method `#over?` that accepts a board and returns true if the board has been won, is a draw, or is full. You should be able to compose this method solely using the methods you used above with some ruby logic.
      #
      def over?
        if draw? || won?
          return true
        end
        if !won?
          return false
        end
      end
      ### `#winner`

      def winner
        if draw?
          return nil
        end
        if won?
          count_x=board.count("X")
          count_o=board.count("O")
          if count_x > count_o
            puts  "Congratulations X!"
            return "X"
          else
            puts "Congratulations O!"
            return "O"
          end
        end
      end

      def play
        while !over?
          turn
        end
        winner
      end

end
