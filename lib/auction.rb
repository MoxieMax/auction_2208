class Auction
  attr_reader :items
  def initialize
    @items = []
  end
  
  def add_item(item)
    @items << item
  end
  
  def item_names
    @items.map(&:name)
  end
  
  def unpopular_items
    no_bids = []
    @items.each do |item|
      if item.bids.empty?
       no_bids << item
      end
    end
    return no_bids
  end
  
  def potential_revenue
    p_revenue = @items.sum do |item|
      if item.bids.empty?
        0
      else
        item.current_high_bid
      end
    end
    p_revenue
  end
  
  def bidders
    a_bidders = items.map do |item|
      item.bids.keys
    end
    a_bidders = a_bidders.flatten.uniq.map do |bidder|
      bidder.name
    end
    a_bidders
  end
  
  def bidder_info
    info = {}
    bidders1 = items.map do |item|
      item.bids.keys
    end
    bidders2 = bidders1.flatten.uniq.map do |bidder|
      bidder
    end
      require 'pry'; binding.pry
  end
end

# bidders1 = items.map do |item|
#   item.bids.keys  
# end
# 
# bidders2 = bidders1.flatten.uniq.map do |bidder|
#   bidder
# end 