class User < ApplicationRecord

  def self.authenticate(user = {})
    user_record = User.find_by(username: user[:username])

    return false if user_record.nil?
    return false if user_record.password != user[:password]
    return user_record
  end
  
end
