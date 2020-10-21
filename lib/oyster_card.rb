class OysterCard
  attr_reader :balance, :limit, :check, :entry_station, :exit_station, :journeys
  LIMIT = 90
  MIN = 1
  def initialize
    @journeys = Hash.new
    @balance = 0
    @limit = LIMIT
  end

  def top_up(amount)
    fail "Error, Maximum card limit of £#{@limit}" if @balance + amount > LIMIT
    @balance += amount
  end

  def in_journey?
     !!entry_station
  end

  def touch_in(entry_station)
    @entry_station = entry_station
    fail "Error, Insufficient Funds" if @balance < MIN
  end

  def touch_out(exit_station)
    @exit_station = exit_station
    @journeys = {entry_station:@entry_station, exit_station:@exit_station}
    deduct(MIN)
    @entry_station = nil
  end

private
  def deduct(amount)
    @balance -= amount
  end


end
