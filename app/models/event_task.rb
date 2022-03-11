class EventTask < ApplicationRecord
  
  belongs_to :event
  validates_associated :event
  validates :event_id, presence: true 
  
  belongs_to :address
  validates_associated :address
  validates :address_id, presence: true
  
  belongs_to :child
  validates_associated :child
  validates :child_id, presence: true

  belongs_to :caregiver

  validates :name, presence: true
  validates :start_time, presence: true
  validates :priority, presence: true
  validates :status, presence: true


end
