require 'player.rb'

class Board

    def initialize 
        @grid = Array.new(6){ Array.new(7, ".") }
    end

    def display
        @grid.each do |element|
            puts element.join(" ")
        end
    end

    def place_piece(user_column_chosen,user_symbol)
        column_choosen = user_column_choosen -1

        # Validate the chosen column
        unless (0..6).include?(column_choosen)
            puts "Insert a valid column please"
            return false
        end

        # Start checking from the bottom
        (5).downto(0) do |row|
            if @grid[row][column_choosen] == '.'
                @grid[row][column_choosen] = user_symbol
                return true
            end
        end

        # If the column is full
        puts "Column is full. Choose another one."
        return false

    end

    def check_for_win
        position = []
        i=0
        @grid.each_with_index do |element,row_index|
            element.each_with_index do |n,column_index|
                if n == @user_symbol
                    position = [row_index,column_index]
                    break
                end
            end
        end

        # We got the position of @user_symbol [x,y]
        if 

    end

end

board = Board.new
board.display