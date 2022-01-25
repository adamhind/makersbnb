feature 'request a space' do 
  scenario "A booker is able to click to request a space" do 
    visit ('/spaces') 
    click_button('Request Test Space #1')
    expect(page).to have_content "Thank you for your booking request for Test Space #1. We will be in touch soon."
  end 
end 
