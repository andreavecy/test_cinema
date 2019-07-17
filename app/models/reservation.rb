class Reservation < ApplicationRecord
  belongs_to :movie

  #scopes
  scope :active, -> {
    where(block: false)
  }


  #validates
  validates :name, presence: true
  validates :identification, presence: true
  validates :email, presence: true
  validates :date, presence: true

  def self.reservations(date, movie_id)
     Reservation.where('date = :date AND movie_id = :id', date: date, id: movie_id).count
  end


end
