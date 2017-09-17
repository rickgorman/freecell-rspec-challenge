require 'rspec'
require 'game'
require 'cascade'

class Foundation
  attr_accessor :foundations, :cascades, :freecells
end

describe Game do

  describe '#initialize' do
    let(:game) { game = Game.new }

    it 'sets up 8 Cascades' do
      expect(game.cascades.count).to eq(8)
      expect(game.cascades[0]).to be_a(Cascade)
    end

    it 'sets up 4 empty FreeCells' do
      expect(game.freecells.count).to eq(4)
      expect(game.freecells[0]).to be_a(FreeCell)
    end

    it 'sets up 4 empty Foundations' do
      expect(game.foundations.count).to eq(4)
      expect(game.foundations[0]).to be_a(Foundation)
    end

    it 'deals out all 52 cards' do
      expect(game.deck.count).to eq(0)

      count = game.cascades.reduce(0) { |acc, cascade| acc + cascade.pile.count }
      expect(count).to eq(52)
    end
  end

  describe '#won?' do
    let(:completed_foundation) { double("foundation", :completed? => true) }
    let(:game) { game = Game.new }

    context 'all the cards are in the Foundations' do
      it 'returns true' do
        game.foundations[0] = completed_foundation
        game.foundations[1] = completed_foundation
        game.foundations[2] = completed_foundation
        game.foundations[3] = completed_foundation

        expect(game.won?).to be true
      end
    end

    context 'there are cards in the Cascades' do
      let(:cascade) { double("cascade", :count => 1) }

      it 'returns false' do
        game.cascades[0] = cascade

        expect(game.won?).to be false
      end
    end

    context 'there are cards in the FreeCells' do
      let(:freecell) { double("freecell", :empty? => false)}
      it 'returns false' do
        game.freecells[0] = freecell

        expect(game.won?).to be false
      end
    end
  end

  describe '#lost?' do
    let(:game) { game = Game.new }

    let(:clubs2) { double("card", :suit => :clubs, :value => :deuce) }
    let(:cardholder) { double("cardholder", :pop => clubs2) }

    it 'returns true when there are no valid moves' do
      8.times { |i| game.cascades[i] = cardholder }
      4.times { |i| game.freecells[i] = cardholder }

      expect(game.lost?).to be true
    end
  end

  describe '#move' do
    let(:game) { game = Game.new }

    let(:clubs2) { double("card", :suit => :clubs, :value => :deuce) }
    let(:hearts3) { double("card", :suit => :hearts, :value => :three) }

    it 'makes a valid move and returns true' do
      expect(game.move(game.cascades[0], game.freecells[1])).to be_truthy
      expect(game.move(game.freecells[1], game.freecells[2])).to be_truthy
    end

    it 'avoids making an invalid move by raising an exception' do
      cascade1 = double("cascade")
      allow(cascade1).to receive(:append).and_raise("invalid move")

      expect { game.move(game.cascades[0], cascade1) }.to raise_error("invalid move")
    end

    it "doesn't change any CardHolders for an invalid move" do
      spadesA = Card.new(:spades, :ace)
      spades2 = Card.new(:spades, :deuce)
      game.cascades[0].append(spadesA, :dealing)
      game.cascades[1].append(spades2, :dealing)

      expect { game.move(game.cascades[0], game.cascades[1]) }.to raise_error("invalid move")

      expect(game.cascades[0].peek).to eq(spadesA)
      expect(game.cascades[1].peek).to eq(spades2)
    end
  end
end
