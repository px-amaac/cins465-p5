class CodeValidator < ActiveModel::EachValidator
	def validate_each(record, attribute, value)
		@zip = ZipCode.find_by_zip(value)
		if @zip.nil?
			record.errors[attribute] << (options[:message] || "is not a valid Zip Code")
		else
			record.build_zip_code_relationship(:zip_code_id => @zip.id)
		end
	end
end

class Address < ActiveRecord::Base

	before_save {|user| user.email = email.downcase}

	has_one :color, through: :color_relationship
	has_one :zip_code, through: :zip_code_relationship
	has_one :zip_code_relationship, :dependent => :destroy
	has_one :color_relationship, :dependent => :destroy
	attr_accessor :code
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :firstName, :lastName, presence: true
	validates :email, presence: true, format: {with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}
	validates :code, presence: true, code: true
#	after_save :assign_zip

	private

	def assign_zip
		@zip = ZipCode.find_by_zip(:code)
		if @zip
			puts @zip.zip
			zip_code_relationship.create!(:zip_code_id => @zip.id)
		end
	end
end


