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
end
