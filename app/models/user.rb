class User < ActiveRecord::Base
   attr_accessible :username, :password
   attr_reader :password

   before_validation :ensure_session_token!

   validates :username, :password_digest,
     presence: true,
     uniqueness: true

   validates :password, length: {minimum: 6, allow_nil: true}

   has_many(:moderated_subs,
     class_name: "Sub",
     foreign_key: :mod_id,
     primary_key: :id)

   def self.find_by_credentials(username, password)
     user = User.find_by_username(username)
     return nil if user.nil?

     user.is_password?(password) ? user : nil
   end

   def ensure_session_token!
     self.session_token = SecureRandom.urlsafe_base64(16)
   end

   def reset_session_token!(force = true)
     return unless self.session_token.nil? || force
     self.session_token = SecureRandom.urlsafe_base64(16)
     self.save!
   end

   def password=(password)
     @password=password
     self.password_digest = BCrypt::Password.create(password)
   end

   def is_password?(password)
     BCrypt::Password.new(self.password_digest).is_password?(password)
   end


end
