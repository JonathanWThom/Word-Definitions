class Word
  attr_reader(:word)

  define_method(:initialize) do |attributes|
    @word = attributes.fetch(:word)
  end
end
