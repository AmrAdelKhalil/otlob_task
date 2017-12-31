class Estate < ApplicationRecord

  self.per_page = 15
  validates_presence_of Estate.attribute_names - ["id", "created_at", "updated_at"]
  include SearchEstate

  def search(type, price_range, sq_ft_range)
    results = []
    results = results + search_by_type(type) + search_by_price(price_range) + search_by_sq_rt(sq_ft_range)
    results
  end
end
