class LoaderWriter
  attr_accessor :file

  def initialize(storage_file)
    self.file = storage_file   
  end

  def read
    array_of_lines = []
    open_file = File.open(file)

    while(line = open_file.gets) do 
      array_of_lines << line.chomp #unless line.chomp.empty?
    end 

    open_file.close

    parse_array_of_lines(array_of_lines)
  end

  def parse_array_of_lines(array_of_lines)
    array_of_lines.each_slice(3).map.map { |line| line[0..1] }
  end

  def write(deck)
    File.open(file, "wb") do |write_file|
      deck.each { |card| write_file << "#{card.definition}\n#{card.term}\n\n" }
    end
  end
end
