class Address < ApplicationRecord

  has_many :events, dependent: :restrict_with_error
  has_many :event_tasks, dependent: :restrict_with_error
  has_many :children, dependent: :restrict_with_error
  has_many :caregivers, dependent: :restrict_with_error

  validates :name, presence: true

  before_destroy :check_for_assignments, prepend: true

  private

  def check_for_assignments
    if (children.any? or caregivers.any? or events.any? or event_tasks.any?)
      errors[:base] << "Unfortunately can not be deleted as address is still assigned to the existing record.
                        Please check children, caregivers, events and event_tasks."
      return false
    end
  end



end
