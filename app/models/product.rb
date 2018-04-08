class Product < ApplicationRecord

	validates_presence_of :name, :description, :height, :weight, :width, :lenght, :price
	validates :height, numericality: { greater_than_or_equal_to: 2 }
	validates :width, numericality: { greater_than_or_equal_to: 11 }
	validates :lenght, numericality: { greater_than_or_equal_to: 16 }
end
