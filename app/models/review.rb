class Review < ActiveRecord::Base
  belongs_to :hall

  validates :description, presence: true, length: {in: 25..255}
end
