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
  @word = params.fetch('word')
  Word.new(:word => @word).save()
  @words = Word.all()
  erb(:index)
end
