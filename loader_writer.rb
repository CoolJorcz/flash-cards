class LoaderWriter
  attr_accessor :file

  def initialize(storage_file)
    self.file = storage_file   
  end

  def read
    array_of_lines = []
    open_file = File.open(file)

    while(line = open_file.gets) do 
      array_of_lines << line.chomp
    end 

    open_file.close

    parse_array_of_lines(array_of_lines)
  end

  def parse_array_of_lines(array_of_lines)
    array_of_lines.each_slice(3).map.map { |line| line[0..1] }
  end

  def write(deck)
    File.open(file, "wb") do |write_file|
      deck.each do |card|
        write_file << "#{card.definition}\n"
        write_file << "#{card.term}\n"
        write_file << "\n"
        # write_file << "#{key}\n"
        # write_file << "#{value}\n"
        # write_file << "\n"
      end
    end
  end
end

reader = LoaderWriter.new("flashcard_samples.txt")
puts reader.read.inspect
