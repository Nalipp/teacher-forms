class TimePost < ActiveRecord::Base
  belongs_to :time_thread
  belongs_to :user

  validates :month, presence: true
  #validates_numericality_of :month, greater_than: 0
  #validates_numericality_of :month, less_than: 13
  validates :day, presence: true
  validates :minute, presence: true
end
