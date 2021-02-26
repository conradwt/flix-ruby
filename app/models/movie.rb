class Movie < ApplicationRecord
  before_save :set_slug

  has_many :reviews, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :fans, through: :favorites, source: :user
  has_many :characterizations, dependent: :destroy
  has_many :genres, through: :characterizations

  has_one_attached :main_image

  validates :title, presence: true, uniqueness: true
  validates :director, presence: true
  validates :released_on, presence: true

  validates :description, length: { minimum: 25 }
  validates :total_gross, numericality: { greater_than_or_equal_to: 0 }

  validates :duration, presence: true

  RATINGS = %w[G PG PG-13 R NC-17]

  validates :rating, inclusion: { in: RATINGS,
                                  message: '%{value} is not a valid rating' }

  validate :acceptable_image

  scope :flops, -> { where('total_gross < ?', 225_000_000) }
  scope :grossed_greater_than, ->(amount) { released.where('total_gross > ?', amount) }
  scope :grossed_less_than, ->(amount) { released.where('total_gross < ?', amount) }
  scope :hits,     -> { where('total_gross >= ?', 300_000_000).order(total_gross: :desc) }
  scope :recent,   ->(max_number = 5) { released.limit(max_number) }
  scope :released, -> { Movie.where('released_on < ?', Time.now).order(released_on: :desc) }
  scope :upcoming, -> { Movie.where('released_on > ?', Time.now).order(released_on: :asc)  }

  def flop?
    total_gross < 225_000_000
  end

  def self.created
    order(created_at: :desc).limit(3)
  end

  def average_stars
    reviews.average(:stars) || 0.0
  end

  def average_stars_as_percent
    (average_stars / 5.0) * 100
  end

  def to_param
    slug
  end

  private

  def acceptable_image
    return unless main_image.attached?

    errors.add(:main_image, 'is to big') unless main_image.blob.byte_size <= 1.megabyte

    acceptable_types = ['image/jpeg', 'image/png']

    errors.add(:main_image, 'must be a JPEG or PNG') unless acceptable_types.include?(main_image.content_type)
  end

  def set_slug
    self.slug = title.parameterize
  end
end
