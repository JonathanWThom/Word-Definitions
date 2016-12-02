require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all()
  erb(:index)
end

post('/') do
  word = params.fetch('word')
  part_of_speech = params.fetch('part_of_speech')
  Word.new(:word => word, :part_of_speech => part_of_speech).save()
  @words = Word.all()
  erb(:index)
end

get('/sorted') do
  @words = Word.sort()
  erb(:index)
end

post('/search') do
  @word_id = Word.search(params.fetch('searched_word'))

  if @word_id
    @word = Word.find(@word_id)
    erb(:word)
  else
    erb(:failure)
  end
end

get('/word/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word)
end

get('/all') do
  @words = Word.all()
  erb(:words_and_definitions)
end

post('/word') do
  definition = params.fetch('definition')
  @new_definition = Definition.new(:definition => definition)
  @new_definition.save()
  @word = Word.find(params.fetch('word_id').to_i())
  @word.add_definition(@new_definition)
  erb(:word)
end
