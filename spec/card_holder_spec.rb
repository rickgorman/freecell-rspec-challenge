require 'rspec'
require 'card_holder'
require 'card'

describe CardHolder do

  describe "#pop" do
    cardholder = CardHolder.new

    heartsA = Card.new(:hearts, :ace)
    hearts2 = Card.new(:hearts, :deuce)
    cardholder.append(heartsA)

    it 'removes and returns the top card' do
      expect(cardholder.pop).to eq(heartsA)

      cardholder.append(heartsA)
      cardholder.append(hearts2)
      expect(cardholder.pop).to eq(hearts2)
    end
  end

  describe "#count" do

    it 'returns the correct number of cards' do
      cardholder = CardHolder.new

      heartsA = Card.new(:hearts, :ace)
      hearts2 = Card.new(:hearts, :deuce)
      cardholder.append(heartsA)
      cardholder.append(hearts2)

      expect(cardholder.count).to be(2)
    end
  end

end
