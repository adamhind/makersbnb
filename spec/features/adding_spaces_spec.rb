feature 'adding spaces' do
  scenario 'an owner can add spaces to the spaces table' do
    visit('/spaces/new')
    fill_in('name', with: 'Beach house')
    fill_in('description', with: 'A nice beach house')
    fill_in('price', with: '99')
    fill_in('available_from', with: '2022-01-01')
    fill_in('available_to', with: '2022-01-30')
    click_button('Submit')
    expect(page).to have_content 'Beach house'
    expect(page).to have_content 'A nice beach house'
    expect(page).to have_content '99'

  end
end
