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
end
