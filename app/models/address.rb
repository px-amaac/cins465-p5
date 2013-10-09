class Address < ActiveRecord::Base

  validates :firstName, :lastName, :email, :zipCode, :favoriteColor, presence: true


end
