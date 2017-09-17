### deck.rb -- this file sourced from blackjack practice assessment
require_relative 'card'

class EmptyDeckException < StandardError
end

# Represents a deck of playing cards.
class Deck
  # Returns an array of all 52 playing cards.
  def self.all_cards
    cards = []
    Card.suits.each do |suit|
      Card.values.each do |value|
        cards << Card.new(suit, value)
      end
    end
    cards
  end

  def initialize(cards = Deck.all_cards)
    @cards = cards
  end

  # Returns the number of cards in the deck.
  def count
    @cards.count
  end

  # Takes a card from the top of the deck.
  def deal_a_card
    raise "not enough cards" if count == 0
    @cards.shift
  end

  def shuffle!
  end

end
