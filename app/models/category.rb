class Category < ApplicationRecord
  belongs_to :user
  has_many :categorizations, dependent: :destroy
  has_many :operations, through: :categorizations

  validates :name, presence: true, uniqueness: true
  validates :user_id, presence: true
end
