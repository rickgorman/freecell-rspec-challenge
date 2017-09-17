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
    @cards = cards
    shuffle!
  end

  # Returns the number of cards in the deck.
  def count
  end

  # Takes a card from the top of the deck.
  def deal_a_card
  end

  private

  def shuffle!
    @cards.shuffle!
  end

end
