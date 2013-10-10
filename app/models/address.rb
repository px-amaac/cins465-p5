class Address < ActiveRecord::Base
  before_save { |user| user.email = email.downcase }
  has_one :color, through: :color_relationship, :dependent => :destroy
  has_one :zip_code, through: :zip_code_relationship, :dependent => :destroy
  accepts_nested_attributes_for :color reject_if: :all_blank
  accepts_nested_attributes_for :zip_code reject_if: :all_blank
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :firstName, :lastName , presence: true
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}

  

end
