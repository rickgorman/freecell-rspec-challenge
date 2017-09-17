require_relative 'card_holder'

class Foundation < CardHolder
  attr_reader :pile

  # adds a card to the Foundation
  def append(card)
    if empty?
      raise "expecting an ace" unless card.value == :ace
    else
      raise "wrong suit" unless card.suit == @pile[0].suit
      raise "wrong rank" unless card.ranking == @pile[0].ranking + 1
    end
    @pile << card
  end

  # does this foundation hold all the cards from one suit?
  def completed?
    @pile.count == 13
  end

end
