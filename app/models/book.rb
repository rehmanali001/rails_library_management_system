class Book < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :comments
  has_many :users, through: :comments  


end
