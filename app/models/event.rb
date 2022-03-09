class Event < ApplicationRecord
  has_many :event_tasks, dependent: :destroy
  #has_many :children # for calendar view
  #has_many :caregivers
  
  belongs_to :child
  validates_associated :child
  validates :child_id, presence: true

  belongs_to :address
  validates_associated :address
  validates :address_id, presence: true

  #belongs_to :event_task # for show tasks
  #validates_associated :event_task
  #validates :event_task_id, presence: true
  #has_many :caregivers, dependent: :destroy
  #has_many :caregivers, through: :event_tasks
  
  validates :name, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

end
