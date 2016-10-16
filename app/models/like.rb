class Like < ApplicationRecord
   belongs_to :user
   belongs_to :hall

   validates_uniqueness_of :user, scope: :hall
end
