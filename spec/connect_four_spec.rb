require './lib/connect_four'

describe "Player" do
  subject(:player) {Player.new("Mikeli", "X")}
  it "gets player object with name and token" do
    expect(player.name).to eql("Mikeli")
    expect(player.token).to eql("X")
  end
end

describe "ConnectFour" do
  describe "board" do
    before(:each) do
      @game = ConnectFour.new
    end

    it "creats game board " do
      expect(@game.board).to eql(Array.new(6){Array.new(7){" "}})
    end
  
    it "can put tokens on board" do
      @game.board[0][0] = "X"
      expect(@game.board[0]).to eql(["X"," "," "," "," "," "," "])
    end
  end

end