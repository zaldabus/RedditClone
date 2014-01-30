class User < ActiveRecord::Base
   attr_accessible :username, :password
   attr_reader :password

   validates :username, :password_digest,
     presence: true,
     uniqueness: true

   validates :password, length: {minimum: 6, allow_nil: true}

   def password=(password)
     @password=password
     self.password_digest = BCrypt::Password.create(password)
   end


end
