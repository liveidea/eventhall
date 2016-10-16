class Hall < ActiveRecord::Base
   extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  belongs_to :city
  has_many :likes

  has_attachments :photos, maximum: 5
  validates :photos, presence: true

  has_and_belongs_to_many :event_types
  has_and_belongs_to_many :venue_types

  validates :description, presence: true, length: {in: 5..500}
  validates :price, presence: true, numericality: true, length: {maximum: 4}
  validates :name, presence: true, length: {maximum: 30}

  def total_likes
      self.likes.where(like:true).size
  end

  def total_dislikes
      self.likes.where(like:false).size
  end
end
