require 'pry'
require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Attendee do
  let(:attendee1) {Attendee.new({name: 'Megan', budget: '$50'})}
  
  describe '#iteration_1' do
    
    it 'exists' do
      expect(attendee1).to be_an(Attendee)
    end
    
    it 'has readable attributes' do
      expect(attendee1.name).to eq("Megan")
      expect(attendee1.budget).to eq(50)
    end
    
  end
end