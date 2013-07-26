class Card
  attr_accessor :definition, :term

  def initialize(attributes)
    self.definition = attributes[0]
    self.term = attributes[1]
  end

  def to_s
    "#{term}- #{definition}"
  end
end
