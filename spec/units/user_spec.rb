require 'spec_helper'
require 'user'

describe User do

  describe '.new' do
    it 'creates a new user and store it in database' do
      user = User.new('Sandy', 'Pounoussamy', 'sandy974', 'pounoussamy.sandy@gmail.com', '1234')

      connection = PG.connect :dbname => "chitter_#{ENV['RACK_ENV']}"
      result = connection.exec("SELECT * FROM users")

      expect(result.first['name']).to eq 'Sandy'
      expect(result.first['lastname']).to eq 'Pounoussamy'
      expect(result.first['username']).to eq 'sandy974'
      expect(result.first['email']).to eq 'pounoussamy.sandy@gmail.com'

      expect(user.name).to eq 'Sandy'
      expect(user.lastname).to eq 'Pounoussamy'
      expect(user.username).to eq 'sandy974'
      expect(user.email).to eq 'pounoussamy.sandy@gmail.com'
      
    end
  end

end
