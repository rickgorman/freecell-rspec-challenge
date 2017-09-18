require_relative 'card_holder'
require_relative 'card'

class Cascade < CardHolder
  attr_reader :pile

  def append(card, dealing=false)
    if empty?
      @pile << card
    elsif !dealing
      raise "invalid card" unless card.goes_under?(peek)
      @pile << card
    else
      @pile << card
    end
  end

end
