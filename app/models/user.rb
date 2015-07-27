class User < ActiveRecord::Base
  before_create { generate_token(:auth_token) }

  has_many :recipes

  def full_name
    "#{first_name} #{last_name}"
  end

  def direction
    "#{address}+#{city}+#{state}+#{zip_code}"
  end

  def directions
    direction.parameterize("+")
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, case_sensitive: false


has_secure_password

def send_password_reset
  generate_token(:password_reset_token)
  self.password_reset_sent_at = Time.zone.now
  save!
  UserMailer.password_reset(self).deliver
end

def generate_token(column)
  begin
    self[column] = SecureRandom.urlsafe_base64
  end while User.exists?(column => self[column])
end

end
