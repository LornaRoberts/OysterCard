require './lib/oyster_card.rb'
describe OysterCard do
  describe "initialize" do
    it "starting balance of 0" do
      expect(subject.balance).to eq(0)
    end
  end
  describe "top_up" do
    it "adds to the balance" do
      subject.top_up(30)
      expect(subject.balance).to eq(30)
    end
     it "throws an error if the balance would exceed £90 limit" do
       expect{ subject.top_up(100) }.to raise_error(RuntimeError, "Error, Maximum card limit of £90")
     end
  end
end
