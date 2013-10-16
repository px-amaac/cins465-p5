class ZipCodeRelationship < ActiveRecord::Base

	belongs_to :address
	belongs_to :zip_code

	validates :address_id, :zip_code_id, presence: true
	validates :code, presence: true, length: { is: 5}, if: :zip_compare?

def zip_compare?
 not ZipCode.all.find_by_zip(:code).nil?
end
end