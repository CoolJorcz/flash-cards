require_relative 'card.rb'

class Deck
  attr_accessor :position, :array_of_card

  def initialize(attribute)
    create_a_deck(attribute)
    self.position = -1
  end

  def create_a_deck(attribute)
    self.array_of_card =[]
    attribute.each do |card|
      self.array_of_card << Card.new(card)
    end
    array_of_card
  end

  def reset_position
    self.position = -1
  end

  def shuffle
    array_of_card.shuffle
  end

  def next_card
    reset_position if position > array_of_card.length
    
    array_of_card[(self.position += 1)] 
  end

  def to_s
    string = ""
    array_of_card.each do |card|
      string << "#{card.to_s}\n"
    end
    string
  end
end

# cards = [['a',1],['b',2]]
# deck = Deck.new(reader.read)
