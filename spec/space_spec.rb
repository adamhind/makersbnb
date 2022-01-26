require 'space'

describe Space do
  describe '.all' do
    it 'returns all available spaces as an array of Space classes' do
      spaces = Space.all

      expect(spaces).to be_an Array
      expect(spaces.length).to eq 3
      expect(spaces.first.name).to eq 'Test Space #1'
      expect(spaces[1].description).to eq 'This is the second test space. Cosy.'
      expect(spaces[2].price).to eq '£20.00'
    end
  end

  describe '#add' do
    it 'adds a new space' do
      space = Space.add(name: 'Beach house', description: 'A nice beach house', price: '99')
      expect(space.name).to eq 'Beach house'
      expect(space.description).to eq 'A nice beach house'
      expect(space.price).to eq '£99.00'
    end
  end
end
