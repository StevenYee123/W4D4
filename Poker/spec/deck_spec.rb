require 'deck'
require 'rspec'

describe Deck do 
  subject(:deck) {Deck.new}
  describe "#initialize" do 
    it "creates an instance of Deck" do 
      expect(deck).to be_an_instance_of(Deck)
    end

    it "is a deck of 52 cards" do 
      expect(deck.cards.length).to eq(52)
    end

    it "doesn't have duplicate cards" do 
      expect(deck.cards.uniq).to eq(deck.cards)
    end
  end

  describe "#shuffle" do 
    it "shuffles the deck" do 
      expect(deck.cards.shuffle).not_to eq(deck.cards)
    end

    it "returns a new array of cards" do 
      expect(deck.cards.shuffle.object_id).not_to eq(deck.cards.object_id)
    end
  end

  describe "#draw" do 
    let(:dummy_deck) {Deck.new}
    context "when there is available card" do 
      it "returns a card" do 
        expect(deck.draw).to be_an_instance_of(Card)
      end
    end

    context "when the deck is empty" do
      it "returns nil" do
        52.times {|i| dummy_deck.draw}
        expect(dummy_deck.draw).to be_nil
      end
    end
  end
end