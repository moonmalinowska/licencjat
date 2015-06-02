class Category < ActiveRecord::Base

  has_many :attractions
  accepts_nested_attributes_for :attractions

  validates :name, presence: true, length: {within: 2..100}

end
