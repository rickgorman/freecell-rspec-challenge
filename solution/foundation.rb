require_relative 'card_holder'

class Foundation < CardHolder
  attr_reader :pile

  # adds a card to the Foundation
  def append(card)
    if empty?
      raise "expecting an ace" unless card.value == :ace
      @pile << card
    elsif card.suit != peek.suit
      raise "wrong suit"
    elsif card.ranking != peek.ranking + 1
      raise "wrong rank"
    else
      @pile << card
    end
  end

  # does this foundation hold all the cards from one suit?
  def completed?
    @pile.count == 13
  end

end
