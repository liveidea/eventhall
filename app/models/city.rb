class City < ActiveRecord::Base
   has_many :halls

      def self.search(query)
          where("name LIKE ?", "%#{query}%")
      end
end
