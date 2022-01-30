feature 'visits the home page' do
  scenario 'user visits / route' do
    visit('/')
    expect(current_path).to eq '/'
    expect(page).to have_content 'Welcome to DucksBnB'
  end

  scenario 'user visits /home route' do
    visit('/home')
    expect(page).to have_content 'Choose the range of dates you want book:'
  end

  scenario 'user clicks signup button on homepage' do
    visit('/')
    click_button('Sign up')
    expect(current_path).to eq '/signup'
  end
end
