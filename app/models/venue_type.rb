class VenueType < ActiveRecord::Base
  has_and_belongs_to_many :halls

   def self.search search_term
  return scoped unless search_term.present?
  where(['name LIKE ?', "%#{search_term}%"])
end
end
