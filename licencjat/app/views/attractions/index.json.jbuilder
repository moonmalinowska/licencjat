json.array!(@attractions) do |attraction|
  json.extract! attraction, :id, :name, :description, :address, :opening_hour, :duration, :reservation, :more_info, :picture, :url, :category_id, :region_id, :latitude, :longitude
  json.url attraction_url(attraction, format: :json)
end
