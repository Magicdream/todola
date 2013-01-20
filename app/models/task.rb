class Task < ActiveRecord::Base
  attr_accessible :name, :priority, :due_date

  belongs_to :user

  validates :name, :state, presence: true
  validates :name, length: { maximum: 255 }

  state_machine :state, initial: :pending  do
    state :pending
    state :completed

    event :complete do
      transition pending: :completed
    end
  end
end
