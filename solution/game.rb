require_relative 'cascade'
require_relative 'free_cell'
require_relative 'foundation'
require_relative 'deck'

class Game
  attr_accessor :cascades, :foundations, :freecells

  def initialize(deck = Deck.new.shuffle!)
  end

  def won?
  end

  def lost?
  end

  # moves a card from one CardHolder to another
  def move(source, destination)
  end

end
