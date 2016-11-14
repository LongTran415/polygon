class User < ApplicationRecord

  def self.authenticate(user = {})
    user_record = User.find_by(username: user[:username])
    user_record.nil? ? false : user_record.password == user[:password]
  end
end
