require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('The add new word route', {:type => :feature}) do
  it('will add a new word to the homepage') do
    visit('/')
    fill_in('word', :with => 'hello')
    fill_in('part_of_speech', :with => 'interjection')
    click_button('Add Word')
    expect(page).to have_content('hello')
  end
end

describe('The find word page route', {:type => :feature}) do
  it('will allow user navigate to the page for specific word clicked on') do
    visit('/')
    click_link('hello')
    expect(page).to have_content('hello (interjection)')
  end
end

describe('The add definition route', {:type => :feature}) do
  it('will allow user to add a definition to a word') do
    visit('/')
    click_link('hello')
    fill_in('definition', :with => 'a greeting')
    click_button('Add Definition')
    expect(page).to have_content('a greeting')
  end
end

describe('The sort words route', {:type => :feature}) do
  it('will allow user to sort words alphabetically') do
    visit('/')
    fill_in('word', :with => 'alpha')
    click_button('Add Word')
    click_link('Alphabetize Words')
    expect(page).to have_content('alpha hello')
  end
end

describe('The search word route', {:type => :feature}) do
  it('will allow user to search for a word, and then return that word\'s page if there is a match') do
    visit('/')
    fill_in('searched_word', :with => 'alpha')
    click_button('Search')
    expect(page).to have_content('alpha')
  end

  it('will allow user to search for a word, and then return a failure message if there\'s no match') do
    visit('/')
    fill_in('searched_word', :with => 'goat')
    click_button('Search')
    expect(page).to have_content('I\'m sorry, "goat" is not one of the words on the list')
  end
end

describe('The see all words and definitions route', {:type => :feature}) do
  it('will allow user to see a list all words with their definitions') do
    visit('/')
    click_link('View All Words and Definitions')
    expect(page).to have_content('alpha hello a greeting')
  end
end

describe('The return home route', {:type => :feature}) do
  it('will allow users to navigate back to homepage') do
    visit('/')
    click_link('View All Words and Definitions')
    click_link('Return Home')
    expect(page).to have_content('Welcome to Word Definitions')
  end
end

describe('The add failed search word route', {:type => :feature}) do
  it('will allow users to add a word they searched for that wasn\'t on the list') do
    visit('/')
    fill_in('searched_word', :with => 'goat')
    click_button('Search')
    fill_in('part_of_speech', :with => 'noun')
    click_button('Add it!')
    expect(page).to have_content('goat')
  end
end
