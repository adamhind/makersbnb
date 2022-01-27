require 'user'

describe User do 
  describe '.add' do 
    it 'adds a user' do 
      user = User.add(
        first_name: 'Rosie',
        surname: 'Waite',
        username: 'RosiePosie',
        email: 'rosiewaite92@gmail.com',
        password: 'quack')
      expect(user.first_name).to eq 'Rosie'
      expect(user.surname).to eq 'Waite'
      expect(user.username).to eq 'RosiePosie'
      expect(user.email).to eq 'rosiewaite92@gmail.com'
      expect(user.password).to eq 'quack'
    end 
  end 
end 