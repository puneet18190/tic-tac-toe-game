describe Game do
  let(:game)     { Game.new }
  let(:player)  { Player.new('Puneet', 'X') }

  describe "attributes" do
    it "has a total_actions" do
      expect(game.total_actions).to eql(0)
    end

    it "has a first user_turn of user type X" do
      expect(game.user_turn).to eql(player.user_type)
    end

    it "has a winning pattern" do
      expect(game.winning_patterns).to eql([ 
        [1,2,3], [4,5,6], [7,8,9],
        [1,4,7], [2,5,8], [3,6,9], 
        [1,5,9], [3,5,7]
      ])
    end
  end

  describe "setup" do
    it "game start" do
      allow(game.draw_header(0)).to receive(:puts).with("Game Started")
    end
  end
end
