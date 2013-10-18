class CodeValidator < ActiveModel::EachValidator
	def validate_each(record, attribute, value)
		
		@zip = ZipCode.find_by_zip(value)
		if @zip.nil?
			record.errors[attribute] << (options[:message] || "is not a valid Zip Code")
		else
			record.build_zip_code_relationship(:zip_code_id => @zip.id).save
		end
	end
end

class FColorValidator < ActiveModel::EachValidator
	def validate_each(record, attribute, value)
		@color = Color.find_by_id(value)
		if @color.nil?
			record.errors[attribute] << (options[:message] || "needs to be selected")
		else
			record.build_color_relationship(:color_id => @color.id).save
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
	attr_accessor :f_color
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :firstName, :lastName, presence: true
	validates :email, presence: true, format: {with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}
	validates :code, presence: true, code: true

	validates :f_color, presence: true, f_color: true
 
	def f_color
			@f_color
	end

	def code
			@code
	end


end


