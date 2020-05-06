class Book < ApplicationRecord
  belongs_to :user
  belongs_to :genre, optional: true
  has_many :comments
  has_many :users, through: :comments  

  scope :alpha, -> { order(:title) }

  def category_attributes(attr)
    self.category = Category.find_or_create_by(attr) if !attr[:name].blank?
  end 

end
