class EventType < ActiveRecord::Base
   has_and_belongs_to_many :halls #, :join_table => "table_name", :foreign_key => "halls #_id"

   def self.search(query)
       where("name LIKE ?", "%#{query}%")
   end
end
