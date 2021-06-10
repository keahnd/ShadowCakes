class Product < ApplicationRecord
	belongs_to :category
	has_one_attached :image
	has_many :order_items, dependent: :destroy
	has_many :reviews
	before_save :remove_blank_sizes

	def remove_blank_sizes
	  sizes.reject!(&:blank?)
	  priceDiff.reject!(&:blank?)
	end
end
