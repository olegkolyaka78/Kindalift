class EventTask < ApplicationRecord
  #has_many :addresses
  #has_many :children
  #has_many :caregivers
  #has_many :events
  
  belongs_to :event
  validates_associated :event
  validates :event_id, presence: true 
  
  #belongs_to :address
  #validates_associated :address
  #validates :address_id, presence: true
  
  belongs_to :child
  validates_associated :child
  validates :child_id, presence: true

  belongs_to :caregiver
  validates_associated :caregiver
  validates :caregiver_id, presence: true

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :priority, presence: true
  validates :status, presence: true
  validates :pickup_address, presence: true
  validates :dropoff_address, presence: true


end
