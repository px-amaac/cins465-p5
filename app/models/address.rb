class Address < ActiveRecord::Base
  before_save { |user| user.email = email.downcase }
  has_one :color
  has_one :zip_code
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :firstName, :lastName , presence: true
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}
  

end
