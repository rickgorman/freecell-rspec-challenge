# Parent class for objects that hold cards
class CardHolder
  attr_reader :pile

  def initialize
  end

  # Add a card to this CardHolder
  def append(card)
  end

  # remove the top card from the pile
  def pop
  end

  # reveals the top card from the pile
  def peek
  end

  # return the number of cards in this CardHolder
  def count
  end

  def to_s
    if @pile.empty?
      "[]"
    else
      @pile.reduce("") { |acc, card| acc += "#{card}  " }
    end
  end

  def empty?
  end

end
