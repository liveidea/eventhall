class Hall < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  has_and_belongs_to_many :options #, :join_table => "table_name", :foreign_key => "options_id"

  has_and_belongs_to_many :event_types #, :join_table => "table_name", :foreign_key => "event_types #_id"

  validates :description, presence: true, length: {in: 25..255}
  validates :price, presence: true, numericality: true, length: {maximum: 4}
end
