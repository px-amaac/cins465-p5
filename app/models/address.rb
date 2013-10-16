class Address < ActiveRecord::Base

	before_save {|user| user.email = email.downcase}

	has_one :color, through: :color_relationship
	has_one :zip_code, through: :zip_code_relationship
	has_one :zip_code_relationship, :dependent => :destroy
	has_one :color_relationship, :dependent => :destroy
	attr_accessor :zip_code
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :firstName, :lastName, presence: true
	validates :email, presence: true, format: {with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}
		
end
