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
  
end