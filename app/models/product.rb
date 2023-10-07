class Product < ApplicationRecord
  belongs_to :brand

  has_many :cards

  scope :active, -> { where(active: true) }

  scope :with_brand_info, -> {
    joins(:brand).select("products.*, brands.name as brand_name, brands.description as brand_desc")
  }
end
