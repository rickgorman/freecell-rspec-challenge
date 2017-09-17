require 'rspec'
require 'cascade'
require 'card'

require 'byebug'

describe Cascade do

  let(:clubsA) { Card.new(:clubs, :ace) }
  let(:clubs2) { Card.new(:clubs, :deuce) }
  let(:clubs3) { Card.new(:clubs, :three) }
  let(:heartsA) { Card.new(:hearts, :ace) }
  let(:hearts2) { Card.new(:hearts, :deuce) }
  let(:hearts3) { Card.new(:hearts, :three) }

  describe '#append' do

    let(:cascade) { Cascade.new }

    context 'when empty' do
      it 'accepts any card' do
        expect(cascade.append(clubs2)).to be_truthy
      end
    end

    context 'when containing one or more cards' do
      it 'only allows a card that is one lower in rank and of the opposite color' do
        cascade.append(hearts2)
        expect { cascade.append(hearts3) }.to raise_error("invalid card")
        expect { cascade.append(clubs3) }.to raise_error("invalid card")
        expect(cascade.append(clubsA)).to be_truthy
      end
    end

    context 'when dealing' do
      it 'allows any card to be placed on top of any other card' do
        cascade.append(hearts2)
        expect(cascade.append(hearts3, :dealing)).to be_truthy
      end
    end
  end

end
