require './lib/oyster_card.rb'
describe OysterCard do
  describe "#initialize" do
    it "starting balance of 0" do
      expect(subject.balance).to eq(0)
    end
  end
  describe "#top_up" do
    it "adds to the balance" do
      subject.top_up(30)
      expect(subject.balance).to eq(30)
    end
     it "throws an error if the balance would exceed £90 limit" do
       expect{ subject.top_up(100) }.to raise_error(RuntimeError, "Error, Maximum card limit of £90")
     end
  end
  describe "#in_journey?" do
    let (:entry_station) {double :station}
    it "return the state" do
      subject.top_up(10)
      subject.touch_in("Barnes")
      expect(subject.in_journey?).to eq(true)
    end
  end
  describe "#touch_in" do
     let (:entry_station) {double :station}
    it "switches the state of use to in_journey?" do
    subject.top_up(30)
    subject.touch_in("Barnes")
      expect(subject.in_journey?).to eq(true)
    end
    it "raises an error if balance is less than MIN" do
      expect{ subject.touch_in("Kings_Cross") }.to raise_error(RuntimeError, "Error, Insufficient Funds")
    end
    it "remembers the entry station" do
      subject.top_up(10)
    subject.touch_in("Barnes")
      expect(subject.entry_station).to eq ("Barnes")
end
  end
describe "#touch_out" do
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }

  it "stores exit station" do
    subject.top_up(10)
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject.exit_station).to eq exit_station
  end
    it "switches the state of use to not in_journey?"do
      subject.touch_out("Covent_Garden")
      expect(subject.in_journey?).to eq(false)
    end
    it "deducts the fare from the balance" do
      subject.top_up(30)
      expect { subject.touch_out("Kings_Cross")}.to change{subject.balance}.by(-OysterCard::MIN)
    end
  it "stores journey" do
    subject.top_up(10)
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject.journeys).to have_value(exit_station)
  end
  let(:journey){ {entry_station: entry_station, exit_station: exit_station} }
  it "stores one journey" do
    subject.top_up(10)
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject.journeys).to eq journey
  end
  end
end
