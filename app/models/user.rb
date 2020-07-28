class User < ActiveRecord::Base

  has_secure_password
  
  validates :password, length: { minimum: 6 }, presence: true
  validates :email, uniqueness: { case_sensitive: false} , presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by(email: email.strip.downcase)
  
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end
end
