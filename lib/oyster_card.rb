class OysterCard
  attr_reader :balance, :limit
  LIMIT = 90
  def initialize
    @balance = 0
    @limit = LIMIT
  end

  def top_up(amount)
    fail "Error, Maximum card limit of £#{@limit}" if @balance + amount > LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
     @state
  end

  def touch_in
    @state = true
  end

  def touch_out
    @state = false
  end
end
