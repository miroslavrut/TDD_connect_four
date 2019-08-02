class Player
  attr_accessor :name, :token
  def initialize(name, token)
    @name = name
    @token = token
  end
end

class ConnectFour
  attr_accessor :board

  def initialize
    @board = generate_board
  end

  def generate_board
    Array.new(6){ Array.new(7) {" "}}
  end

  def drop_token(player, column)
    if self.board[0][column] != " "
      puts "invalid move"
      return :ful
    else
      board.reverse.each do |ary|
        if ary[column] == " "
          ary[column] = player.token
          break
        end
      end
    end
  end

    def game_over?
      # check for horizontal win
      board.each do |row|
        4.times do |i|
          if row[i,4] == Array.new(4,"X")  || row[i,4] == Array.new(4,"O")
            return true
          end
        end
      end
    end

end