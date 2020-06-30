class Post < ApplicationRecord
  has_many :comments
  has_one :like
  # accepts_nested_attributes_for :like
  accepts_nested_attributes_for :comments
end
