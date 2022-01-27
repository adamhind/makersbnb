require 'space'

describe Space do
  describe '.all' do
    context 'no dates are specified' do
      it 'returns all spaces as an array of Space classes' do
        spaces = Space.all()

        expect(spaces).to be_an Array
        expect(spaces.length).to eq 3
        expect(spaces.first.name).to eq 'Test Space #1'
        expect(spaces[1].description).to eq 'This is the second test space. Cosy.'
        expect(spaces[2].price).to eq '£20.00'
      end
    end

    context 'dates are specified' do
      it 'returns only available spaces' do
        checkin = '2022-02-21'
        checkout = '2022-02-27'

        spaces = Space.all(checkin: checkin, checkout: checkout)

        expect(spaces).to be_an Array
        expect(spaces.length).to eq 1
        expect(spaces[0].name).to eq 'Test Space #3'
        expect(spaces[0].description).to eq 'This is the third test space. Cheap.'
        expect(spaces[0].price).to eq '£20.00'
      end
    end
  end

  describe '#add' do
    it 'adds a new space' do
      space = Space.add(name: 'Beach house', description: 'A nice beach house', price: '99', available_from: '01,01,2022', available_to: '01,30,2022')
      expect(space.name).to eq 'Beach house'
      expect(space.description).to eq 'A nice beach house'
      expect(space.price).to eq '£99.00'
      expect(space.available_from).to eq '2022-01-01'
      expect(space.available_to).to eq '2022-01-30'
    end
  end

end
