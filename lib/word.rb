class Word
  @@words = []

  attr_reader(:word, :part_of_speech, :id, :definitions)

  define_method(:initialize) do |attributes|
    @word = attributes.fetch(:word)
    @part_of_speech = attributes.fetch(:part_of_speech)
    @id = @@words.length + 1
    @definitions = []
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

  define_singleton_method(:find) do |word_id|
    found_word = nil
    @@words.each() do |word|
      if word.id() == word_id
        found_word = word
      end
    end
    found_word
  end

  define_method(:add_definition) do |definition|
    @definitions.push(definition)
  end

  define_singleton_method(:sort) do
    @@words.sort_by! {|word| word.word().downcase() }
  end
end
