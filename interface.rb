require_relative 'deck.rb'
require_relative 'loader_writer.rb'

class Interface

  attr_accessor :deck, :loader_writer

  def initialize
    self.loader_writer = LoaderWriter.new("flashcard_samples.txt")
    self.deck = Deck.new(loader_writer.read)
    run
  end

  def run
    input = nil
    go = true
    welcome = <<-WELCOME
Welcome to Ruby Flash Cards.
To play, just enter the correct term for each definition. Ready? Go!
To exit, type 'exit'.\n
    WELCOME

    puts welcome
    
    until input == "exit"
      current_card = deck.next_card
      wrong_count = 0
      begin
        puts "#{current_card.definition}\n"
        go = current_card.correct?(input = gets.chomp)
        puts "#{current_card.term[0...wrong_count] + "*" * (current_card.term.length - wrong_count)}" unless go
        wrong_count += 1 unless go
        go = true if input == "exit"
        puts go if go && input != "exit"
        puts ""
      end until go
    end
  end
end
Interface.new
# test = Interface.new
# puts test.deck.inspect
