module Authentication
  attr_accessor :password

  def self.included(base)
    base.before_save :encrypt_password
    base.validates :username, presence: true, uniqueness: true
    base.validates :password, confirmation: true, presence: { on: :create }
  end

  def self.authenticate(username, password)
    profile = find_profile(username)
    return profile if profile && password_correct?(profile, password)
  end

  private
  def self.find_profile(username)
    Profile.find_by(username: username)
  end

  def self.password_correct?(profile, password)
    profile.password_hash ==
      BCrypt::Engine.hash_secret(password, profile.password_salt)
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
