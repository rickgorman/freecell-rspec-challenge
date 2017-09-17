require 'rspec'
require 'foundation'
require 'byebug'
require 'card'

class Foundation
  attr_accessor :pile
end

describe Foundation do

  let(:clubsA) { double("card", :suit => :clubs, :value => :ace, :ranking => 1) }
  let(:clubs2) { double("card", :suit => :clubs, :value => :deuce, :ranking => 2) }
  let(:clubs3) { double("card", :suit => :clubs, :value => :three, :ranking => 3) }
  let(:hearts2) { double("card", :suit => :hearts, :value => :deuce, :ranking => 2) }

  describe '#append' do

    let(:foundation) { Foundation.new }

    it 'requires the first card added to be an ace' do
      expect { foundation.append(clubs2) }.to raise_error("expecting an ace")
      expect(foundation.append(clubsA)).to be_truthy
      expect(foundation.pile[0].suit).to eq(clubsA.suit)
      expect(foundation.pile[0].value).to eq(clubsA.value)
    end

    it 'requires all following cards to be of the same suit' do
      foundation.append(clubsA)
      expect { foundation.append(hearts2) }.to raise_error("wrong suit")

      expect(foundation.append(clubs2)).to be_truthy
    end

    it 'requires the next card added to be one rank higher than the last' do
      foundation.append(clubsA)
      expect { foundation.append(clubs3) }.to raise_error("wrong rank")

      expect(foundation.append(clubs2)).to be_truthy
    end
  end

  describe "#completed?" do

    let(:foundation) { Foundation.new }

    let(:cards) do
      cards = [
        Card.new(:spades, :ace),
        Card.new(:spades, :deuce),
        Card.new(:spades, :three),
        Card.new(:spades, :four),
        Card.new(:spades, :five),
        Card.new(:spades, :six),
        Card.new(:spades, :seven),
        Card.new(:spades, :eight),
        Card.new(:spades, :nine),
        Card.new(:spades, :ten),
        Card.new(:spades, :jack),
        Card.new(:spades, :queen),
        Card.new(:spades, :king)
      ]
    end

    it 'returns true when holding all cards of a single suit' do
      fake_pile = []
      cards.each { |card| fake_pile << card }
      foundation.pile = fake_pile

      expect(foundation.completed?).to be true
    end

    it 'returns false otherwise' do
      expect(foundation.completed?).to be false

      foundation.append(clubsA)
      expect(foundation.completed?).to be false
      foundation.append(clubs2)
      expect(foundation.completed?).to be false
    end
  end

end
