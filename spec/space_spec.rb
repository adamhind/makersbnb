require 'space'

describe Space do
  describe '.all' do
    it 'returns all spaces as an array of Space classes' do
      spaces = Space.all

      expect(spaces).to be_an Array
      expect(spaces.length).to eq 3
      expect(spaces.first.name).to eq 'Test Space #1'
      expect(spaces[1].description).to eq 'This is the second test space. Cosy.'
      expect(spaces[2].price).to eq '£20.00'
    end
  end
end
