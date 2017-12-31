require 'active_support/concern'

module SearchEstate
  extend ActiveSupport::Concern

  included do
  end

  def search_by_type(type)
    return [] if type.nil? || !type.is_a?(String)
    Estate.where('estate_type LIKE ?', "%#{type}%").map(&:to_json)
  end

  def search_by_price(range)
    return [] unless range
    low, high = get_low_and_high(range)
    Estate.where("price >= ? and price <= ?", "#{low}", "#{high}").map(&:to_json)
  end

  def search_by_sq_rt(range)
    return [] unless range
    low, high = get_low_and_high(range)
    Estate.where("sq_ft >= ? and sq_ft <= ?", "#{low}", "#{high}").map(&:to_json)
  end

  def get_low_and_high(range)
    low = range["low"]
    high = range["high"]
    low = 0 if low.nil? || (!low.is_a?(Float) && !low.is_a?(Integer))
    high = 1000 if high.nil? || (!high.is_a?(Float) && !high.is_a?(Integer))
    [low,high]
  end

  class_methods do
  end
end
