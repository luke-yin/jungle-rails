class User < ActiveRecord::Base

  has_secure_password
  validates :password, length: { minimum: 6 }
  validates :email, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.authenticate_with_credentials(email, password)
    lowercase_email = email.downcase
    nospaces_email = lowercase_email.delete(' ')
    user = User.find_by_email(nospaces_email)
    # If the user exists AND the password entered is correct.
    if !user
      return nil
    elsif user.authenticate(password)
      return user
    else
      return nil
    end
  end

end
