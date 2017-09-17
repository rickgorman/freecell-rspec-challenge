require 'rspec'
require 'deck'
require 'byebug'

### deck_spec.rb -- sourced from blackjack practice assessment

describe Deck do

  describe "::all_cards" do
    subject(:all_cards) { Deck.all_cards }

    it "starts with a count of 52" do
      expect(all_cards.count).to eq(52)
    end

    it "returns all cards without duplicates" do
      all_card_vals = Card.suits.product(Card.values).sort

      deduped_cards = all_cards
        .map { |card| [card.suit, card.value] }
        .sort

      expect(deduped_cards).to eq(all_card_vals)
    end
  end

  describe "#initialize" do
    it "by default fills itself with 52 cards" do
      deck = Deck.new
      expect(deck.count).to eq(52)
    end
  end

  let(:deck) do
    Deck.new(cards.dup)
  end

  let(:cards) do
    cards = [
      Card.new(:spades, :king),
      Card.new(:spades, :queen),
      Card.new(:spades, :jack)
    ]
  end

  it "does not expose its cards directly" do
    expect(deck).not_to respond_to(:cards)
  end

  describe "#deal_a_card" do
    before(:each) { deck = Deck.new }
    # **use the front of the cards array as the top**
    it "takes a card off the top of the deck" do
      expect(deck.deal_a_card).to eq(cards[0])
    end

    it "removes cards from deck on take" do
      deck.deal_a_card
      expect(deck.count).to eq(2)
    end

    it "doesn't allow you to take more cards than are in the deck" do
      3.times { deck.deal_a_card }

      expect do
        deck.deal_a_card
      end.to raise_error("not enough cards")
    end
  end

end
