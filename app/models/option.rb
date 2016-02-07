class Option < ActiveRecord::Base
   has_and_belongs_to_many :halls # , :join_table => "table_name", :foreign_key => "halls # _id"
end
