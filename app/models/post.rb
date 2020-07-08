class Post < ApplicationRecord
  has_many :comments
  has_one :like
  # before_save :default_value
  # accepts_nested_attributes_for :like
  accepts_nested_attributes_for :comments, allow_destroy: true
  accepts_nested_attributes_for :like, allow_destroy: true
  # def default_value
  #   self.like ||= 0
  # end
end
