class Definition
  @@definitions = []
  attr_reader(:definition)

  define_method(:initialize) do |attributes|
    @definition = attributes.fetch(:definition)
  end

  define_singleton_method(:all) do
    @@definitions
  end
end
