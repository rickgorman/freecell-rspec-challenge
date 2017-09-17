require_relative 'card_holder'
require_relative 'card'

class Cascade < CardHolder
  attr_reader :pile

  def append(card, dealing=false)
  end

end
