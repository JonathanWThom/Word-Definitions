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
end
