class Card
  attr_reader :definition, :term

  def initialize(attributes)
    self.definition = attributes[0]
    self.term = attributes[1]
  end
end
