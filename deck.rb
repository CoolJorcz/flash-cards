require_relative 'card.rb'

class Deck
  attr_reader :array_of_card
  attr_accessor :position

  def initialize(attribute)
    create_a_deck(attribute)
    self.position = 0
  end

  def create_a_deck(attribute)
    @array_of_card =[]
    attribute.each do |card|
      @array_of_card << Card.new(card)
    end
    @array_of_card
  end

  def reset_position
    self.position = 0
  end

  def shuffle
    @array_of_card.shuffle 
  end

  def next_card
    reset_position
    @array_of_card[(self.position += 1)] 
  end
end

# cards = [['a',1],['b',2]]
# deck = Deck.new(cards)
