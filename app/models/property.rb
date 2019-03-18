class Property < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy

  accepts_nested_attributes_for :images, allow_destroy: true

  def rad(value)
    return value * Math::PI / 180
  end

  def self.near_by(latitude, longitude, distance)
    haversine = 
      "(6371 * acos(cos(radians(#{latitude})) 
      * cos(radians(latitude))
      * cos(radians(longitude) 
      - radians(#{longitude}))
      + sin(radians(#{latitude})) 
      * sin(radians(latitude))))"

    Property.select("*, #{haversine} as distance")
            .where("#{haversine} < #{distance}")
  end
end
