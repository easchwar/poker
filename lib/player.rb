class Player

  def initialize(pot)
    @pot = pot
    @called = false
  end

  def called?
    @called
  end

  def get_hand(cards)
    @hand = Hand.new(cards)
  end

  def get_cards(cards)
    @hand.add_cards(cards)
  end

  def trade_in
    cards = input_discard

    @hand.discard(cards)

    cards.length
  end

  def input_discard
    puts "Which cards would you like to discard?"
    gets.chomp.split(',')
  end

  def take_turn(current_bet)
    @called = false
    puts "What is your bet?"
    move = gets.chomp

    if move == "fold"
      fold
    elsif move == "call"
      call(current_bet)
    elsif move == "raise"
      raise_bet(current_bet)
    else
      raise "pick a valid move"
    end
  end

  def fold
    nil
  end

  def raise_bet(current_bet)
    puts "how much?"
    bet = gets.chomp.to_i + current_bet
    @pot -= bet
    bet
  end

  def call(current_bet)
    @called = true
    @pot -= current_bet
    current_bet
  end
end
