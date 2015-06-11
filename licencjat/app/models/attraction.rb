class Attraction < ActiveRecord::Base


  belongs_to :region, :class_name => "Region", :foreign_key => :region_id
  belongs_to :category, :class_name => "Category", :foreign_key => :category_id
  belongs_to :variety, :class_name => "Variety", :foreign_key => :variety_id
  accepts_nested_attributes_for :category


  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  acts_as_taggable

  geocoded_by :address
  # geocoded_by :full_address # can also be an IP address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, :reverse_geocode # auto-fetch coordinates


  validates :name, presence: true, uniqueness: true, length: {within: 2..100}
  validates :description, presence: true, length: {minimum: 10}
  validates_presence_of :address, :opening_hour, :duration, :reservation, :picture
  validates_presence_of :region_id, :category_id
  validates_length_of :more_info, :minimum => 5, :allow_blank => true


  #geocoder
  #def full_address
  #   "#{address} Japan"
  # end
end
