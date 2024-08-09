require_relative 'player.rb'

class Board

    attr_reader :grid

    def initialize 
        @grid = Array.new(6){ Array.new(7, ".") }
    end

    def display
        @grid.each do |element|
            puts element.join(" ")
        end
    end

    def place_piece(user_column_chosen,user_symbol)
        
        column_choosen = user_column_chosen -1

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
        @grid.each_with_index do |element, row_index|
            element.each_with_index do |n, column_index|
                next if n == "."  # Only check positions with the user's symbol
    
                # Horizontal check (to the right)
                if column_index <= 3 && @grid[row_index][column_index] == @grid[row_index][column_index + 1] &&
                   @grid[row_index][column_index + 1] == @grid[row_index][column_index + 2] &&
                   @grid[row_index][column_index + 2] == @grid[row_index][column_index + 3]
                    puts "The player with #{@grid[row_index][column_index]} has won horizontally!"
                    return true
                end
    
                # Vertical check (downward)
                if row_index <= 2 && @grid[row_index][column_index] == @grid[row_index + 1][column_index] &&
                   @grid[row_index + 1][column_index] == @grid[row_index + 2][column_index] &&
                   @grid[row_index + 2][column_index] == @grid[row_index + 3][column_index]
                    puts "The player with #{@grid[row_index][column_index]} has won vertically!"
                    return true
                end
    
                # Diagonal check (\ direction)
                if row_index <= 2 && column_index <= 3 && @grid[row_index][column_index] == @grid[row_index + 1][column_index + 1] &&
                   @grid[row_index + 1][column_index + 1] == @grid[row_index + 2][column_index + 2] &&
                   @grid[row_index + 2][column_index + 2] == @grid[row_index + 3][column_index + 3]
                    puts "The player with #{@grid[row_index][column_index]} has won diagonally (\\)!"
                    return true
                end
    
                # Diagonal check (/ direction)
                if row_index >= 3 && column_index <= 3 && @grid[row_index][column_index] == @grid[row_index - 1][column_index + 1] &&
                   @grid[row_index - 1][column_index + 1] == @grid[row_index - 2][column_index + 2] &&
                   @grid[row_index - 2][column_index + 2] == @grid[row_index - 3][column_index + 3]
                    puts "The player with #{@grid[row_index][column_index]} has won diagonally (/)! "
                    return true
                end
            end
        end
    
        return false  # No win found after checking all positions
    end

    def check_for_draw
        if @grid.all? { |row| row.all? { |cell| cell != "." } } && !check_for_win
            puts "It's a draw. Let's start a new game."
            initialize
            return true
        end
        return false
    end
end

