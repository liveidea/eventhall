class Hall < ActiveRecord::Base
  belongs_to :user
  belongs_to :city
  has_many :reviews, dependent: :destroy

  mount_uploader :photos, PhotosUploader



  has_and_belongs_to_many :event_types #, :join_table => "table_name", :foreign_key => "event_types #_id"
  has_and_belongs_to_many :venue_types #, :join_table => "venue_types_halls", :foreign_key => "venue_type_id"

  validates :description, presence: true, length: {in: 5..255}
  validates :price, presence: true, numericality: true, length: {maximum: 4}
  validates :name, presence: true, length: {maximum: 30}
  validates_presence_of :photos

def self.search(query)
     where(:city, query)
   # where("city LIKE ?", "%#{query}%")
end

end
