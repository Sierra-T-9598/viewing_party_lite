class Party < ApplicationRecord
  validates_presence_of :date
  validates_presence_of :time
  validates_presence_of :duration
  # validates_presence_of :movie_id
  # validates_presence_of :host_id
  # validates_presence_of :invitee_id
  # belongs_to :movie
  has_many :user_parties
  has_many :users, through: :user_parties
end
