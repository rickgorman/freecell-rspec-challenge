### deck.rb -- this file sourced from blackjack practice assessment
require_relative 'card'

class EmptyDeckException < StandardError
end

# Represents a deck of playing cards.
class Deck
  # Returns an array of all 52 playing cards.
  def self.all_cards
  end

  def initialize(cards = Deck.all_cards)
  end

  # Returns the number of cards in the deck.
  def count
  end

  # Takes `n` cards from the top of the deck.
  def take(n)
  end

  def shuffle!
  end

end
