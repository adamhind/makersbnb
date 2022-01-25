feature 'allows bookers to view all spaces' do
  scenario 'user visits /spaces' do
    visit('/spaces')
    expect(page).to have_content('Test Space #1')
    expect(page).to have_content('Test Space #2')
    expect(page).to have_content('Test Space #3')
  end
end
