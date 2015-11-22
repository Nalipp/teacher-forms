class TimeThread < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :user
  has_many :time_posts
  has_many :users, through: :time_posts

  accepts_nested_attributes_for :time_posts

  validates :student_name, presence: true
  validates_associated :time_posts
end
