require('rspec')
require('definition')

describe(Definition) do
  before() do
    @new_definition = Definition.new({:definition => 'A greeting'})
  end

  describe('#definition') do
    it('will return the definition') do
      expect(@new_definition.definition()).to(eq('A greeting'))
    end
  end

  describe('.all') do
    it('will be empty at first') do
      expect(Definition.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('will save a definition') do
      @new_definition.save()
      expect(Definition.all()).to(eq([@new_definition]))
    end
  end
end
