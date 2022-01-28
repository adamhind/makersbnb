feature 'logging in ' do 
  scenario 'customers can log in from the home page' do 
    visit('/home')
    fill_in('username', with: 'TEST02')
    fill_in('password', with: 'Password2')
    click_button('Login')
  expect(page).to have_content('Welcome to DucksBnB')
  end 
end 