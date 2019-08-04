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

  describe "#drop_token" do
    subject(:game) {ConnectFour.new}
    let(:player) {Player.new("Mikeli", "X")}

    it "places marker in last row of selected empty col" do
      game.drop_token(player,0)
      expect(game.board[5][0]).to eql("X")
    end
    it "places marker in last row of other empty col" do
      game.drop_token(player,3)
      expect(game.board[5][3]).to eql("X")
    end
    it "stackes markers in same col" do
      game.drop_token(player,4)
      game.drop_token(player,4)
      game.drop_token(player,4)
      expect(game.board[3][4]).to eql("X")
    end
    it "returns :ful if no more cells in col" do
      game.drop_token(player,5)
      game.drop_token(player,5)
      game.drop_token(player,5)
      game.drop_token(player,5)
      game.drop_token(player,5)
      game.drop_token(player,5)
      expect(game.board[0][5]).to eql("X")
      expect(game.drop_token(player,5)).to eql(:ful)
    end   
  end

  describe "#game_over?" do
    subject(:game) {ConnectFour.new}
    let(:player) {Player.new("Mik", "X")}
    context "#horizontal_win?" do
      it "declares a win if there are 4 same in a row" do
        4.times {|i| game.drop_token(player,i)}
        expect(game.game_over?).to be true
      end
      it "declares a win if there are 4 same in a row" do
        game.board[3] = [" "," ","X","X","X","X"," "]
        expect(game.game_over?).to eql(true)
      end
    end

    context "#vertical_win?" do
      it "declares a win if there are 4 same in col" do
        4.times { game.drop_token(player,0)}
        expect(game.game_over?).to be true
      end
      it "declares a win if there are 4 same in col" do
        4.times {|x| game.board[x+1][2] = "X"}
        expect(game.game_over?).to be true
      end
    end

    context "#diagonal_win?" do 
      it "declares a win if there are 4 same in rising diagonal" do
        4.times {|x| game.board[x][x] = "X"}
        expect(game.game_over?).to be true
      end
      it "declares a win if there are 4 same in descending diagonal" do
        4.times {|x| game.board[4-x][x] = "X"}
        expect(game.game_over?).to be true
      end
      it "declares a win" do
        game.board[4][0] = "X"
        game.board[3][1] = "X"
        game.board[2][2] = "X"
        game.board[1][3] = "X"
        expect(game.game_over?).to be true
      end
    end

    context "#draw?" do
      it "draw if all cells taken" do
        game.board.each {|row| row.each {|x| x= "x"}}
        expect(game.draw?).to be true
      end
    end
  end

end