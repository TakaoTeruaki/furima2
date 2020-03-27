class Item < ApplicationRecord
  has_many :images
  has_many :items
end
