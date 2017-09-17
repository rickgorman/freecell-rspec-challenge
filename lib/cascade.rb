require_relative 'card_holder'
require_relative 'card'

class Cascade < CardHolder
  attr_reader :pile

  def append(card, dealing=false)
    if !!dealing
      @pile << card
    elsif empty?
      @pile << card
    elsif card.goes_under?(peek)
      @pile << card
    else
      raise "invalid card" if card.color == peek.color
      raise "invalid card" unless card.goes_under?(peek)
    end
  end

end
