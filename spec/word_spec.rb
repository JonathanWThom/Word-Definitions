require('rspec')
require('word')
require('definitions')

describe(Word) do
  before do
    @new_word = Word.new({:word => 'Hello'})
  end

  describe("#word") do
    it('will return the word') do
      expect(@new_word.word()).to(eq('Hello'))
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
end
