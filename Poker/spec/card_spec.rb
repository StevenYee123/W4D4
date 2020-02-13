require 'card'
require 'rspec'

describe Card do 
  subject(:card) {Card.new(:Heart, :Ace)}
  describe "#initialize" do 
    it "creates an instance of Card" do 
      expect(card).to be_an_instance_of(Card)
    end

    it "has a suit" do 
      expect(card.suit).to eq(:Heart)
    end

    it "has a value" do 
      expect(card.value).to eq(:Ace)
    end
  end
end