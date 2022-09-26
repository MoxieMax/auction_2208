require 'pry'
require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Auction do
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
      expect(auction).to be_an(Auction)
    end
    
    it 'starts with no items' do
      expect(auction.items).to eq([])
    end
    
    it 'can add items' do
      auction.add_item(item1)
      auction.add_item(item2)
      
      expect(auction.items).to eq([item1, item2])
      expect(auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
    end
  end
  
  describe '#iteration_2' do
    before(:each) do
      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)
    end
    
    it 'can return unpopular items' do
      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)
      item4.add_bid(attendee3, 50)
      # binding.pry
      expect(auction.unpopular_items).to eq([item2, item3, item5])
      
      item3.add_bid(attendee2, 15)
      expect(auction.unpopular_items).to eq([item2, item5])
    end
    
    it 'can determine potential revenue' do
      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)
      item4.add_bid(attendee3, 50)
      item3.add_bid(attendee2, 15)
      # binding.pry
      expect(auction.potential_revenue).to eq(87)
    end    
  end
  
  describe '#iteration_3' do
    before(:each) do
      auction.add_item(item1)
      auction.add_item(item2)
      auction.add_item(item3)
      auction.add_item(item4)
      auction.add_item(item5)
  end
end