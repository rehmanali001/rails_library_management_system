class Book < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :comments ,dependent: :destroy
  has_many :users, through: :comments  
  validates :description, :title, presence: true


  scope :alpha, -> { order(:title) }
  scope :most_comments, -> {left_joins(:comments).group('books.id').order('count(comments.book_id) desc')}


  def genre_attributes=(attr)
    self.genre = Genre.find_or_create_by(attr) if !attr[:name].blank?
  end 

  scope :long_word, -> { order('length(title) desc') }

end
