class User < ActiveRecord::Base
   has_many :halls
   before_save { self.email = email.downcase }

   validates :name, presence: true, length: {in: 2..30}
   validates_format_of :name, :with => /^[-a-z]+$/

   validates :last_name, presence: true, length: {in: 2..40}
   validates_format_of :last_name, :with => /^[-a-z]+$/

   validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, uniqueness: { case_sensitive: false }

   validates :phone, numericality: true, length: {maximum: 20}

end
