require 'rspec'
require 'cascade'

describe Cascade do

  let(:clubsA) { double("card", :suit => :clubs, :value => :ace) }
  let(:clubs2) { double("card", :suit => :clubs, :value => :deuce) }
  let(:clubs3) { double("card", :suit => :clubs, :value => :three) }
  let(:heartsA) { double("card", :suit => :hearts, :value => :ace) }
  let(:hearts2) { double("card", :suit => :hearts, :value => :deuce) }

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
        expect { cascade.append(heartsA) }.to raise_error("wrong color")
        expect { cascade.append(clubs3) }.to raise_error("wrong rank")

        expect(cascade.append(clubsA)).to be_truthy
      end
    end

    context 'when dealing' do
      it 'allows any card to be placed on top of any other card' do
        cascade.append(hearts2)
        expect(cascade.append(heartsA, :dealing)).to be_truthy
      end
    end
  end

end
