require('rspec')
require('word')
require('definition')

describe(Word) do
  before() do
    Word.clear()
    @new_word = Word.new({:word => 'Hello', :part_of_speech => 'Interjection'})
  end

  describe("#word") do
    it('will return the word') do
      expect(@new_word.word()).to(eq('Hello'))
    end
  end

  describe('#part_of_speech') do
    it('will return the part of speech of a word') do
      expect(@new_word.part_of_speech()).to(eq('Interjection'))
    end
  end

  describe('.all') do
    it('will be empty at first') do
      expect(Word.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('will save a word') do
      @new_word.save()
      expect(Word.all()).to(eq([@new_word]))
    end
  end

  describe('.clear') do
    it('will empty out the words') do
      @new_word.save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe('#id') do
    it('will return a unique id for each word') do
      @new_word.save()
      expect(@new_word.id()).to(eq(1))
    end
  end

  describe('.find') do
    it('will find a particular word based on id') do
      @new_word.save()
      second_word = Word.new({:word => 'World', :part_of_speech => 'Noun'})
      second_word.save()
      expect(Word.find(@new_word.id())).to(eq(@new_word))
    end
  end

  describe('#add_definition') do
    it('will add a definition to a word') do
      @new_word.save()
      new_definition = Definition.new({:definition => "The Earth"})
      @new_word.add_definition(new_definition)
      expect(@new_word.definitions()).to(eq([new_definition]))
    end
  end

  describe('.sort') do
    it('will return words in alphabetical order') do
      first_word = Word.new({:word => 'dog', :part_of_speech => 'noun'})
      first_word.save()
      second_word = Word.new({:word => 'cat', :part_of_speech => 'noun'})
      second_word.save()
      Word.sort()
      expect(Word.all()).to(eq([second_word, first_word]))
    end
  end

  describe('.search') do
    it('will return word searched for if there is a match') do
      first_word = Word.new({:word => 'dog', :part_of_speech => 'noun'})
      first_word.save()
      second_word = Word.new({:word => 'cat', :part_of_speech => 'noun'})
      second_word.save()
      expect(Word.search('dog')).to(eq(first_word.id()))
    end

    it('will return false if there is no match') do
      first_word = Word.new({:word => 'dog', :part_of_speech => 'noun'})
      first_word.save()
      expect(Word.search('goat')).to(eq(false))
    end
  end

end
