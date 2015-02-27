require_relative 'card'

class Hand
  attr_reader :cards


  def initialize(cards)
    @cards = cards
  end

  def discard(cards_to_discard)
    cards_to_discard.each do |card|
      if @cards.include?(card)
        @cards.delete(card)
      else
        raise "invalid discard"
      end
    end
  end

  def take_cards(num, deck)
    @cards += deck.deal(num)
  end

  def sort
    @cards.sort! { |a, b| a.value <=> b.value }
  end

  def pair?
    @cards.each_with_index do |card, i|
      (i + 1...@cards.length).each do |j|
        return true if @cards[j].value == card.value
      end
    end
    false
  end

  def flush?
    suit = @cards.first.suit
    @cards.all? {|card| card.suit == suit}
  end

  def straight?
    sort
    @cards.each_with_index do |card, i|
      return true if i == @cards.length - 1
      return false unless card.value == @cards[i + 1].value - 1
    end
  end

  def straight_flush?
    flush? && straight?
  end
end
