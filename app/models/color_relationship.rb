class ColorRelationship < ActiveRecord::Base
	belongs_to :address
	belongs_to :color

#	validates :address_id, :color_id presence: true
end
