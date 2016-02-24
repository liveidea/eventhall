class City < ActiveRecord::Base
   has_many :halls

def self.search search_term
  return scoped unless search_term.present?
  where(['name LIKE ?', "%#{search_term}%"])
end
end
