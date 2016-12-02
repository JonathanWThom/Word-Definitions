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
  Word.new(:word => word).save()
  @words = Word.all()
  erb(:index)
end

get('/word/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word)
end

post('/word') do
  definition = params.fetch('definition')
  @new_definition = Definition.new(:definition => definition)
  @new_definition.save()
  @word = Word.find(params.fetch('word_id').to_i())
  @word.add_definition(@new_definition)
  erb(:word)
end
