require 'rspec'
require 'card'


describe Card do
  describe "#color" do
    cards = []
    Card.suits.each { |suit| cards << Card.new(suit, :deuce) }

    it 'handles the color of each suit' do
      expect(cards[0].color).to be(:black) # 2 of clubs
      expect(cards[1].color).to be(:red)   # 2 of diamonds
      expect(cards[2].color).to be(:red)   # 2 of hearts
      expect(cards[3].color).to be(:black) # 2 of spades
    end
  end

  describe "#goes_under?" do
    hearts2 = Card.new(:hearts, :deuce)
    hearts3 = Card.new(:hearts, :three)
    spades3 = Card.new(:spades, :three)
    spades_king = Card.new(:spades, :king)

    it 'returns true if other_card is one rank higher and of opposite color' do
      expect(hearts2.goes_under?(spades3)).to be true
    end

    it 'returns false in other situations' do
      expect(spades3.goes_under?(hearts2)).to be false
      expect(hearts3.goes_under?(hearts2)).to be false
      expect(hearts2.goes_under?(hearts3)).to be false
      expect(spades3.goes_under?(hearts2)).to be false
      expect(spades3.goes_under?(hearts3)).to be false
    end
  end
end
