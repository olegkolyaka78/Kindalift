class Child < ApplicationRecord
  has_many :events
  has_many :event_tasks
  has_many :caregivers, through: :event_tasks

  belongs_to :address
  validates_associated :address
  validates :address_id, presence: true

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone,  presence: true
  validates :phone, numericality: { only_integer: true }
  validates :phone, length: { is: 10 }

  def full_name
    "#{first_name} #{last_name}"
  end
end
