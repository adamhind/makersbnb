require 'user'

describe User do 
  describe '.add' do 
    it 'adds a user' do 
      user = User.add(
        first_name: 'Rosie',
        surname: 'Waite',
        username: 'RosiePosie',
        email: 'rosiewaite92@gail.com',
        password: 'quack')
      expect(user.first_name).to eq 'Rosie'
      expect(user.surname).to eq 'Waite'
      expect(user.username).to eq 'RosiePosie'
      expect(user.email).to eq 'rosiewaite92@gail.com'
      expect(user.password).to eq 'quack'
    end 
  end 

  describe '.login' do 
    it 'returns the user_id when given username and password' do 
      user = User.login(password: 'Password3', username: 'TEST03')
      expect(user).to eq 3
    end 
  end
  
end
