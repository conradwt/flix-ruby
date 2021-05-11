class Genre < ApplicationRecord
  before_save :set_slug

  has_many :characterizations, dependent: :destroy
  has_many :movies, through: :characterizations

  validates :name, presence: true, uniqueness: true

  def to_param
    slug
  end

  private

  def set_slug
    self.slug = name.parameterize
  end
end
