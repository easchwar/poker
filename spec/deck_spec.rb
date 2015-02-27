require 'deck.rb'
require 'rspec'

RSpec.describe Deck do
  describe "::default_deck" do
    it "should create an array with 52 cards" do
      cards = Deck.default_deck
      expect(cards.length).to eq(52)
    end
  end

  describe "::initialize" do
    it "deck initialized with no arguments should be the default deck" do
      deck = Deck.new
      default_cards = Deck.default_deck
      deck.cards.each_with_index do |card, i|
        expect(card.value).to eq(default_cards[i].value)
        expect(card.suit).to eq(default_cards[i].suit)
      end
    end
  end

  describe "#deal" do
    it "should return number of cards passed to it" do
      deck = Deck.new
      hand = deck.deal(5)
      expect(hand.length).to eq(5)
    end

    it "cards dealt should be removed from deck" do
      deck = Deck.new
      deck.deal(5)
      expect(deck.cards.length).to eq(47)
    end
  end

  describe "#shuffle" do
  end
end
