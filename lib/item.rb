class Item
  attr_reader :name,
              :bids
  def initialize(name)
    @name = name
    @bids = {}
    @open = true
  end
  
  def add_bid(attendee, amount)
    @bids[attendee] = amount if @open
  end
  
  def current_high_bid
    self.bids.values.max
  end
  
  def close_bidding
    @open = false
  end
end