class Word
  @@words = []

  attr_reader(:word, :id)

  define_method(:initialize) do |attributes|
    @word = attributes.fetch(:word)
    @id = @@words.length + 1
  end

  define_singleton_method(:all) do
    @@words
  end

  define_method(:save) do
    @@words.push(self)
  end

  define_singleton_method(:clear) do
    @@words = []
  end
end
