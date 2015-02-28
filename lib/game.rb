class Game

  def initialize(players, deck = Deck.new)
    @players = players
    @deck = deck
    @pot = 0
    @turn = players.first
    @current_bet = 0
  end


  def play
    # initial deal to all players
    @players.each { |player| player.get_hand(@deck.deal(5)) }
    # trading in for all players
    @players.each do |player|
      num_discarded = player.trade_in
      player.get_cards(@deck.deal(num_discarded))
    end
    @current_bet = 0
    until over?
      @players.each do |player|
        return if over?
        handle_turn(player, player.take_turn(current_bet))
      end
    end

    # determine winner
  end

  def over?
    @players.size == 1 || @players.all? { |player| player.called? }
  end

  def handle_turn(player, bet)
    if bet.nil?
      @players.delete(player)
    else
      @pot += bet
      @current_bet = bet
    end
  end

end
