class Item < ActiveRecord::Base
  validates :title, :description, presence: true
  validates :title, uniqueness: true
  validates :ranking, numericality: { only_integer: true}
end
