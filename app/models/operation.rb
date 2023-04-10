class Operation < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "author_id"

  validates :name, :amount, presence: true
end
