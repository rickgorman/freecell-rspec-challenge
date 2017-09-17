require_relative 'card_holder'
require_relative 'card'

class Cascade < CardHolder
  attr_reader :pile

  def append(card, dealing=false)
    if !!dealing
      @pile << card
    elsif empty?
      @pile << card
    elsif card.goes_under?(@pile[0])
      @pile << card
    else
      raise "invalid card" if card.color == @pile[0].color
      raise "invalid card" unless card.goes_under?(@pile[0])
    end
  end

end
