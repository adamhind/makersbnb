feature 'visits the home page' do 
  scenario 'load the home page' do 
    visit('/')
    expect(page).to have_content 'hello world'
  end 
end 