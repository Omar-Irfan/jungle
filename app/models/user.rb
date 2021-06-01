class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :password, length: { minimum: 3 }

  def authenticate_with_credentials(email, password)
    parsedEmail = email.strip.downcase
    user = User.find_by_email(parsedEmail)
    if (user && user.authenticate(password))
      user
    else
      nil
    end
  end
end
