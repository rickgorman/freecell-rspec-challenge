# Parent class for objects that hold cards
class CardHolder
  attr_reader :pile

  def initialize
    @pile = []
  end

  # Add a card to this CardHolder
  def append(card)
    @pile << card
  end

  # remove the top card from the pile
  def pop
  end

  # return the number of cards in this CardHolder
  def count
  end

  def to_s
    @piles.reduce("") { |acc, card| acc += "#{card}  " }
  end

end
