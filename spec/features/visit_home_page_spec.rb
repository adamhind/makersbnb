feature 'visits the home page' do
  scenario 'user visits / route' do
    visit('/')
    expect(current_path).to eq '/home'
    expect(page).to have_content 'Welcome to DucksBnB'
  end

  scenario 'user visits /home route' do
    visit('/home')
    expect(page).to have_content 'Welcome to DucksBnB'
  end

  scenario 'user clicks signup button on homepage' do
    visit('/home')
    click_button('Sign up')
    expect(current_path).to eq '/signup'
  end

  scenario 'user clicks login button on homepage' do
    visit('/home')
    click_button('Log in')
    expect(current_path).to eq '/login'
  end
end
