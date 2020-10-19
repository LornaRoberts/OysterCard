require './lib/oyster_card.rb'
describe OysterCard do
  describe "initialize" do
    it "starting balance of 0" do
      expect(subject.balance).to eq(0)
    end
  end
end
