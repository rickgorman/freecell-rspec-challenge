require 'rspec'
require 'free_cell'

describe FreeCell do

  let(:clubs2) { double("card", :suit => :clubs, :value => :deuce) }
  let(:heartsA) { double("card", :suit => :hearts, :value => :ace) }
  let(:hearts2) { double("card", :suit => :hearts, :value => :deuce) }

  describe '#append' do

    let(:freecell) { FreeCell.new }

    context 'when empty' do
      it 'accepts any card' do
        expect(freecell.append(clubs2)).to be_truthy
        expect(freecell.pile[0].suit).to eq(clubs2.suit)
        expect(freecell.pile[0].value).to eq(clubs2.value)
      end
    end

    context 'when containing one or more cards' do
      it 'does not accept a card' do
        freecell.append(hearts2)
        expect { freecell.append(heartsA) }.to raise_error("already in use")
      end
    end

  end
end
