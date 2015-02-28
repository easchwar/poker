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
    compare_cards.length == 2
  end

  def two_pair?
    return false unless compare_cards.length == 2
    pair = compare_cards
    new_arr = @cards.reject { |card| pair.include?(card) }
    compare_cards(new_arr).length == 2
  end

  def three_of_a_kind?
    compare_cards.length == 3
  end

  def four_of_a_kind?
    compare_cards.length == 4
  end

  def full_house?
    return false unless compare_cards.length == 3
    triples = compare_cards
    new_arr = @cards.reject { |card| triples.include?(card) }
    compare_cards(new_arr).length == 2

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


  def highest_hand
    if straight_flush?
    elsif four_of_a_kind?
    elsif full_house?
    elsif flush?
    elsif straight?
    elsif three_of_a_kind?
    elsif two_pair?
    elsif pair?
    else
    end
  end

  private

  def compare_cards(arr = @cards)
    card_array = []
    arr.each do |card|
      temp_array = arr.select { |el| el.value == card.value }
      card_array = temp_array.dup if temp_array.length > card_array.length
    end
    card_array
  end
end
