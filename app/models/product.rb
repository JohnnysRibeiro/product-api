class Product < ApplicationRecord

	validates_presence_of :name, :description, :height, :weight, :width, :lenght, :price

end
