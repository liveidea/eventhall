class VenueType < ActiveRecord::Base
  has_and_belongs_to_many :halls

   def self.search(query)
       where("name LIKE ?", "%#{query}%")
   end
end
