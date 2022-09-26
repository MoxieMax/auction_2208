require 'pry'
require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Item do
  let(:auction) {Auction.new}
  
  let(:item1) {Item.new('Chalkware Piggy Bank')}
  let(:item2) {Item.new('Bamboo Picture Frame')}
  let(:item3) {Item.new('Homemade Chocolate Chip Cookies')}
  let(:item4) {Item.new('2 Days Dogsitting')}
  let(:item5) {Item.new('Forever Stamps')}
  
  let(:attendee1) {Attendee.new({name: 'Megan', budget: '$50'})}
  let(:attendee2) {Attendee.new({name: 'Bob', budget: '$75'})}
  let(:attendee3) {Attendee.new({name: 'Mike', budget: '$100'})}
  
  describe '#iteration_1' do
    
    it 'exists' do
      expect(item1).to be_an(Item)
      expect(item2).to be_an(Item)
    end
    
    it 'has readable attributes' do
      expect(item1.name).to eq("Chalkware Piggy Bank")
      expect(item2.name).to eq("Bamboo Picture Frame")
      
    end
  end
  
  describe '#iteration_2' do
    it 'starts with no bids' do
      expect(item1.bids).to eq({})
    end
    
    it 'can be bid on' do
      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)
      
      expect(item1.bids).to eq({attendee2 => 20, attendee1 => 22})
    end
    
    it 'can return the current high bid' do
      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)
      # binding.pry
      expect(item1.current_high_bid).to eq(22)
    end
  end
  
  describe '#iteration_3' do
    before(:each) do
      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)
      
      item1.add_bid(attendee1, 22)
      item1.add_bid(attendee2, 20)
      item4.add_bid(attendee3, 50)
      item3.add_bid(attendee2, 15)
    end
    it 'can close bidding' do
      expect(item1.bids).to eq({attendee1 => 22, attendee2 => 20})
      
      item1.close_bidding
      item1.add_bid(attendee3, 70)
      
      expect(item1.bids).to eq({attendee1 => 22, attendee2 => 20})
    end
  end
end