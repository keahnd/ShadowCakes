class Review < ApplicationRecord
	belongs_to :user
	belongs_to :product, required: false

end
