require_relative 'board.rb'

class Player

    attr_reader :symbol

    def initialize
        @symbol = ""
    end

    def get_symbol
        loop do
            puts "Choose your symbol (X or O): "
            @symbol = gets.chomp.upcase
            break if %w[X O].include?(@symbol)
            puts "Invalid symbol. Please choose either 'X' or 'O'."
        end

    end

    def make_move(board)
        loop do
            puts "Choose a column (1-7):"
            column = gets.chomp.to_i
            if board.place_piece(column,@symbol)
                break
            else
                puts "Invalid move. Try again."
            end
        end

    end        
end