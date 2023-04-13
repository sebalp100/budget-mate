class Category < ApplicationRecord
  belongs_to :user
  has_many :categorizations, dependent: :destroy
  has_many :operations, through: :categorizations

  validates :user_id, presence: true

  def slug
    name.parameterize
  end

  def total_amount
    operations.sum(:amount)
  end

  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :icon, presence: true
end
