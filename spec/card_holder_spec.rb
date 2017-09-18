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
    let(:cardholder) { CardHolder.new }
    let(:heartsA) { Card.new(:hearts, :ace) }
    let(:hearts2) { Card.new(:hearts, :deuce) }

    it 'returns the correct number of cards' do

      cardholder.append(heartsA)
      cardholder.append(hearts2)

      expect(cardholder.count).to eq(2)
    end
  end

  describe "#empty?" do
    let(:cardholder) { CardHolder.new }
    let(:hearts2) { Card.new(:hearts, :deuce) }

    context 'when empty' do
      it 'returns true' do
        expect(cardholder.empty?).to be true
      end
    end

    context 'when occupied' do
      it 'returns false' do
        cardholder.append(hearts2)
        expect(cardholder.empty?).to be false
      end
    end
  end

  describe "#peek" do
    let(:cardholder) { CardHolder.new }
    let(:heartsA) { Card.new(:hearts, :ace) }
    let(:hearts2) { Card.new(:hearts, :deuce) }

    it 'reveals the top card' do
      cardholder.append(heartsA)

      expect(cardholder.peek).to eq(heartsA)
    end
  end

end
