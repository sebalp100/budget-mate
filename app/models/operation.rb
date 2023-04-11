class Operation < ApplicationRecord
  belongs_to :category
  belongs_to :user
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations

  validates :name, :amount, presence: true
end
