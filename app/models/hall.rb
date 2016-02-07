class Hall < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  validates :description, presence: true, length: {in: 25..255}
  validates :price, presence: true, numericality: true, length: {maximum: 4}
end
