feature 'signing up ' do
  scenario 'a user can signup to our site' do
    visit('/signup')
    fill_in('first_name', with: 'Rosie')
    fill_in('surname', with: 'Waite')
    fill_in('username', with: 'rosieposie')
    fill_in('email', with: 'quack')
    click_button('Sign up')
    expect(current_path).to eq('/home')
  end

end
