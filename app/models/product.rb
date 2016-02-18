class Product < ActiveRecord::Base
validates :count_in_stock, numericality: { only_integer: true }
validates :price, numericality: { only_float: true }
validates :description, :name,  presence: true
validates :name, length: {minimum: 3, maximum: 25}
end
