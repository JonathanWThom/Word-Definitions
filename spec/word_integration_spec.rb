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
