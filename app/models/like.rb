class Like < ApplicationRecord
  attribute :counter, :integer, default: 0
  belongs_to :post
end
