class Event < ApplicationRecord
  has_many :event_tasks, dependent: :destroy
  
  belongs_to :child
  validates_associated :child
  validates :child_id, presence: true

  belongs_to :address
  validates_associated :address
  validates :address_id, presence: true
  
  validates :name, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

end
