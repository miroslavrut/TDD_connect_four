require './lib/connect_four'

describe "Player" do
  subject(:player) {Player.new("Mikeli", "X")}
  it "gets player object with name and token" do
    expect(player.name).to eql("Mikeli")
    expect(player.token).to eql("X")
  end
end