class CardHolder
  attr_reader :pile

  def initialize
    @pile = []
  end

  def append(card)
    @pile << card
  end

  def pop
  end

  def count
  end

end
