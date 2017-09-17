require_relative 'card_holder'

class Cascade < CardHolder
  attr_reader :pile

  def append(card, dealing=false)
  end

end
