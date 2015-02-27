require_relative 'card.rb'

class Deck

  attr_reader :cards

  def self.default_deck
    cards_array = []
    Card.card_values.each do |value|
      Card.card_suits.each do |suit|
        cards_array << Card.new(value, suit)
      end
    end
    cards_array
  end

  def initialize(cards = Deck.default_deck)
    @cards = cards
  end

  def deal(num)
    @cards.shift(num)
  end

  def shuffle
    @cards.shuffle
  end
end
