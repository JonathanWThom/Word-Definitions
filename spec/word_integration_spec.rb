require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('The add new word route', {:type => :feature}) do
  it('will add a new word to the homepage') do
    visit('/')
    fill_in('word', :with => 'hello')
    click_button('Add Word')
    expect(page).to have_content('hello')
  end
end

describe('The find word page route', {:type => :feature}) do
  it('will allow user to be page to page for specific word clicked on') do
    visit('/')
    click_link('hello')
    expect(page).to have_content('hello')
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
