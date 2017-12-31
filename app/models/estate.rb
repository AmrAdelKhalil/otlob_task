class Estate < ApplicationRecord

  self.per_page = 15
  validates_presence_of Estate.attribute_names - ["id", "created_at", "updated_at"]
  validates :longitude, numericality: true
  validates :latitude, numericality: true
  validates :price, numericality: true
  validates :sq_ft, numericality: true
  validates :beds, numericality: { only_integer: true }
  validates :baths, numericality: { only_integer: true }
  include SearchEstate

  def search(type, price_range, sq_ft_range)
    results = []
    results = results + search_by_type(type) + search_by_price(price_range) + search_by_sq_rt(sq_ft_range)
    results
  end
end
