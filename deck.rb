require_relative 'card.rb'

class Deck
  attr_accessor :position, :array_of_card

  def initialize(attribute)
    self.array_of_card = []
    create_a_deck(attribute)
    shuffle
    self.position = -1
  end

  def create_a_deck(attribute)
    attribute.each { |card| add_card(card) }
  end

  def add_card(card)
    self.array_of_card << Card.new(card)
  end

  def reset_position
    self.position = -1
  end

  def shuffle
    array_of_card.shuffle!
  end

  def next_card
    reset_position if position > array_of_card.length
    
    array_of_card[(self.position += 1)] 
  end

  def to_s
    array_of_card.map { |card| "#{card.to_s}" }.join("\n")
  end
end

# cards = [['a',1],['b',2]]
# deck = Deck.new(reader.read)
