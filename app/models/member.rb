class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_and_belongs_to_many :items
    has_many :orders
    validates :full_name, presence: true
    validates :username, presence: true, uniqueness: true
    validates :password, presence: true
    validates :address, presence: true
    validates :province, presence: true
    validates :store_credit_available, numericality: true, allow_nil: true
end
