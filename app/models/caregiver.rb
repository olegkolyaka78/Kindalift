class Caregiver < ApplicationRecord
  has_many :events, through: :event_tasks
  has_many :event_tasks, dependent: :destroy
  has_many :children, through: :event_tasks

  belongs_to :address
  validates_associated :address
  validates :address_id, presence: true

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone,  presence: true
  validates :phone, numericality: { only_integer: true }
  validates :phone, length: { is: 10 }
  validates :email, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i



  def full_name
    "#{first_name} #{last_name}"
  end
end
