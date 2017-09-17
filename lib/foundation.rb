require_relative 'card_holder'

class Foundation < CardHolder
  attr_reader :pile

  # adds a card to the Foundation
  def append(card)
    if empty?
      raise "expecting an ace" unless card.value == :ace
    else
      raise "wrong suit" unless card.suit == peek.suit
      raise "wrong rank" unless card.ranking == peek.ranking + 1
    end
    @pile << card
  end

  # does this foundation hold all the cards from one suit?
  def completed?
  end

end
