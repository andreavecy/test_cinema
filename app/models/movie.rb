class Movie < ApplicationRecord
  attribute :block, :boolean, default: false

  #scopes
  scope :active, -> {
    where(block: false)
  }

  scope :filter_date, ->(date) {
    where("start_date >= :date AND :date <= finish_date", date: date)
  }


  #validates

  validates :name, presence: true
  validates :description, presence: true
  validates :url_image, presence: true
  validates :start_date, presence: true
  validates :finish_date, presence: true


end
