require 'card'
  
class Deck
  attr_reader :cards, :shuffled_cards
  
  SUITS = [:HEART, :DIAMOND, :CLUB, :SPADE]
  VALUES = {
    "1":1,
    "2":2,
    "3":3,
    "4":4,
    "5":5,
    "6":6,
    "7":7,
    "8":8,
    "9":9,
    JACK:10,
    QUEEN:11,
    KING:12,
    ACE:13
  }

  def initialize 
    @cards = create_cards 
    @shuffled_cards = shuffle_cards(@cards)  
  end

  def shuffle_cards(cards)
    cards.shuffle
  end

  def draw 
    return shuffled_cards.shift unless shuffled_cards.empty?
    nil
  end

  private
  def create_cards 
    cards = []
    SUITS.each do |suit|
      VALUES.each do |name, val|
        cards << Card.new(suit, name)
      end
    end

    cards
  end
end