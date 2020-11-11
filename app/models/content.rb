class Content < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :text, presence: true

  def self.search(search)
    if search != ""
      Content.where('text LIKE(?)', "%#{search}%")
    else
      Content.all
    end
  end
end
