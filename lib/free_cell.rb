require_relative 'card_holder'

class FreeCell < CardHolder
  attr_reader :pile

  # Add a card to this cell
  def append(card)
  end

  def to_s
    empty? ? '--' : "#{peek}"
  end

end
