feature 'request a space' do 
  scenario "A booker is able to click to request a space" do 
    visit ('/home')
    fill_in('Check-in', with: '2022-02-21')
    fill_in('Check-out', with: '2022-02-27')
    click_button('Search')
    click_button('Request Test Space #3')
    expect(page).to have_content "Thank you for your booking request for Test Space #3. We will be in touch soon."
  end 

end 
