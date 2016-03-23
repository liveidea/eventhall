class Hall < ActiveRecord::Base
  belongs_to :user
  belongs_to :city

  has_attachments :photos, maximum: 5
  validates :photos, presence: true

  has_and_belongs_to_many :event_types
  has_and_belongs_to_many :venue_types

  validates :description, presence: true, length: {in: 5..500}
  validates :price, presence: true, numericality: true, length: {maximum: 4}
  validates :name, presence: true, length: {maximum: 30}
end
