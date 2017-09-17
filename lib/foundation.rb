require_relative 'card_holder'

class Foundation < CardHolder
  attr_reader :pile

  # adds a card to the Foundation
  def append(card)
  end

  # does this foundation hold all the cards from one suit?
  def completed?
  end

end
