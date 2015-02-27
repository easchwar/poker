require 'card.rb'
require 'rspec'

RSpec.describe Card do
  describe "::initialize" do
    it "should initialize values correctly" do
      card = Card.new(:three, :spades)
      expect(card.value).to eq(3)
      expect(card.suit).to eq(:spades)
    end

    it "raises error if initialized with improper suit or value"  do
      expect { Card.new(:eleven, :spades) }.to raise_error
      expect { Card.new(:seven, :not_a_suit) }.to raise_error
    end
  end
end
