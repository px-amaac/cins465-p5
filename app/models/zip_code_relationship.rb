class ZipCodeRelationship < ActiveRecord::Base

	belongs_to :address
	belongs_to :zip_code

#	validates :address_id, :zip_code_id, presence: true
	
end