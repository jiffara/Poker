require 'rspec'
require 'poker'
require 'hand'
require 'deck'
require 'card'

describe Card do

  let(:ace_spades) { Card.new(14, 0) }
  let(:queen_hearts) { Card.new(12, 1) }
  let(:five_clubs) { Card.new(5, 2) }
  let(:not_a_card) { Card.new(0, 3) }

  describe "#initialize" do
    it "should take two arguments" do
      expect { ace_spades }.to_not raise_error
      expect{ Card.new }.to raise_error
    end

    it "should not accept numbers outside the range (2,14)" do
      expect { not_a_card }.to raise_error
    end

    context "value" do
      it "should set the value of the instance" do
        expect(five_clubs.value).to eq(5)
        expect(queen_hearts.value).to eq(12)
      end
    end

    context "suit" do
      it "should set the suit of the instance" do
        expect(five_clubs.suit).to eq("Clubs")
        expect(queen_hearts.suit).to eq("Hearts")
      end
    end
  end

  describe "#to_s" do
    it "should interpret the card" do
      expect(ace_spades.to_s).to eq("Ace of Spades")
      expect(queen_hearts.to_s).to eq("Queen of Hearts")
      expect(five_clubs.to_s).to eq("Five of Clubs")
    end
  end

  describe "#<=>(other_card)" do
    it "should compare the two cards by their value" do
      expect(five_clubs <=> queen_hearts).to eq(-1)
      expect(ace_spades <=> queen_hearts).to eq(1)
    end
  end

end

describe Deck do

  subject(:deck) { Deck.new }

  describe "#initialize" do
    it "should not take any arguments" do
      expect { Deck.new(1) }.to raise_error
      expect { deck }.to_not raise_error
    end

    it "should initialize an empty array of cards" do
      expect(deck.cards.length).to eq(52)
    end
  end

  describe "#populate" do
    it "should populate the deck of cards" do
       deck.populate
       expect(deck.cards[0]).to be_instance_of(Card)

    end
  end

  describe "to_s" do
    it "should return a readable string" do
      deck.populate
      expect(deck.to_s).to be_instance_of(String)
    end
  end

  describe "#deal" do

    it "should require one argument" do
      expect { deck.deal }.to raise_error
      expect { deck.deal(5) }.to_not raise_error
      expect { deck.deal(2, 4) }.to raise_error
    end

    it "should return an array of cards" do
      expect(deck.deal(5)).to be_instance_of(Array)
      expect(deck.deal(5).length).to eq(5)
      expect(deck.deal(5)[0]).to be_instance_of(Card)
    end
  end
end

describe Hand do

  let(:two_card) { double("Card", :value => 2) }

  let(:pair) { Hand.new( [two_card, two_card])}

  describe "#initialize" do
    it "should take an array of cards as an argument" do
      expect { Hand.new }.to raise_error
      expect { pair }.to_not raise_error
    end

    it "should set the array given to be an attr_accessor" do
      expect(pair.cards).to eq([two_card, two_card])
    end
  end

end
