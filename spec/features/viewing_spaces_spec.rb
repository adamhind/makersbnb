feature 'allows bookers to view all spaces' do
  scenario 'user visits /spaces without inputting dates' do
    visit('/spaces')
    expect(page).to have_content('Test Space #1')
    expect(page).to have_content('Test Space #2')
    expect(page).to have_content('Test Space #3')
  end
end

feature 'allows bookers to filter spaces by availability' do
  scenario 'user enters their availability on the home page' do
    visit('/home')
    fill_in('Check-in', with: '2022-02-21')
    fill_in('Check-out', with: '2022-02-27')
    click_button('Search')
    expect(current_path).to include '/spaces'
    expect(page).to have_content("Test Space #3")
    expect(page).to_not have_content("Test Space #1")
    expect(page).to_not have_content("Test Space #2")
  end
end
