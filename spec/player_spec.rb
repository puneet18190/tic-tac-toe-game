describe Player do
  let(:player)  { Player.new('Puneet', 'X') }

  describe "attributes" do
    it "has a name" do
      expect(player.name).to eql("Puneet")
    end

    it "has a user_type" do
      expect(player.user_type).to eql("X")
    end

    it "has a score" do
      expect(player.score).to eql(0)
    end
  end
end
