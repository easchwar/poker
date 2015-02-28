class Card
  SUIT_STRINGS = {
  :clubs    => "♣",
  :diamonds => "♦",
  :hearts   => "♥",
  :spades   => "♠"
  }

  VALUE_STRINGS = {
    :deuce => "2",
    :two => "2",
    :three => "3",
    :four  => "4",
    :five  => "5",
    :six   => "6",
    :seven => "7",
    :eight => "8",
    :nine  => "9",
    :ten   => "10",
    :jack  => "J",
    :queen => "Q",
    :king  => "K",
    :ace   => "A"
  }

  CARD_VALUE = {
    :deuce => 2,
    :two   => 2,
    :three => 3,
    :four  => 4,
    :five  => 5,
    :six   => 6,
    :seven => 7,
    :eight => 8,
    :nine  => 9,
    :ten   => 10,
    :jack  => 11,
    :queen => 12,
    :king  => 13,
    :ace   => 14
  }

  attr_reader :suit

  def self.card_values
    CARD_VALUE.keys
  end

  def self.card_suits
    SUIT_STRINGS.keys
  end

  def initialize(value, suit)
    unless CARD_VALUE.has_key?(value) && SUIT_STRINGS.has_key?(suit)
      raise "invalid card"
    end
    @value = value
    @suit = suit
  end

  def value
    CARD_VALUE[@value]
  end

  def suit_string
    SUIT_STRINGS[@suit]
  end

  def same_value?(card)
    self.value == card.value
  end

  def same_suit?(card)
    self.suit == card.suit
  end

  def render
    "#{value}#{suit_string}"
  end
end
