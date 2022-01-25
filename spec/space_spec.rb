describe '#add' do
  it 'adds a new space' do
    space = Space.add(name: 'Beach house', description: 'A nice beach house', price: '99')
    expect(space.name).to eq 'Beach house'
    expect(space.description).to eq 'A nice beach house'
    expect(space.price).to eq '99.00'
  end
end