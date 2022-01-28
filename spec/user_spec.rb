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

  describe '#requests' do 
    it 'shows a list of requests ready to be confirmed' do 
      user = User.new(
        user_id: '1', 
        first_name: 'Test User 1', 
        surname: 'Number 1', 
        username: 'TEST01', 
        email: 'test1@test.com', 
        password: 'Password1'
        )

      expect(user.requests).to be_an Array
      expect(user.requests[0]['space_id']).to eq "1"
      expect(user.requests[0]['date_from']).to eq "2022-01-01"
      expect(user.requests[0]['date_to']).to eq "2022-01-02"
    end 
  end 

end 

