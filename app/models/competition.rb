class Competition < ActiveRecord::Base
  attr_accessible :title, :user_id
  belongs_to :user

	default_scope -> { order('created_at DESC') }

  validates :user_id, presence: true
  validates :title, length: {maximum: 50 }

  has_many :attendees, :dependent => :destroy
  has_many :users, :through => :attendees
end
