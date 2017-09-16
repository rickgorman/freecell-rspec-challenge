require 'rspec'
require 'card_holder'
require 'card'

describe CardHolder do

  describe '#initialize' do
    cardholder = CardHolder.new

    it 'creates an empty pile of cards' do
      expect(cardholder.pile).to eq([])
    end
  end

  describe "#pop" do
    cardholder = CardHolder.new

    hearts_ace = Card.new(:hearts, :ace)
    hearts_two = Card.new(:hearts, :deuce)
    cardholder.append(hearts_ace)

    it 'removes and returns the top card' do
      expect(cardholder.pop).to eq(hearts_ace)

      cardholder.append(hearts_ace)
      cardholder.append(hearts_deuce)
      expect(cardholder.pop).to eq(hearts_deuce)
    end
  end

end
