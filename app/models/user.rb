class User < ActiveRecord::Base
	has_many :halls

	has_attachment :avatar
	validates :avatar, presence: true
	devise :database_authenticatable, :registerable,
	:recoverable, :rememberable, :trackable, :validatable
	validates :name, presence: true, length: {in: 2..30}
	validates :last_name, presence: true, length: {in: 2..40}
	validates :phone, numericality: true, length: {maximum: 20}
end
