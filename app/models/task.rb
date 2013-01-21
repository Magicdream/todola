class Task < ActiveRecord::Base
  PRIORITIES = {
    1 => :high,
    2 => :medium,
    3 => :low
  }

  attr_accessible :name, :priority, :due_date, :due_date_fmt

  attr_accessor :due_date_fmt

  belongs_to :user

  validates :name, :state, presence: true
  validates :name, length: { maximum: 255 }
  validates :priority, inclusion: { in: PRIORITIES.keys }, allow_nil: true

  state_machine :state, initial: :pending  do
    state :pending
    state :completed

    event :complete do
      transition pending: :completed
    end
  end

  def priority_sym
    PRIORITIES[priority]
  end

  def due_date_fmt=(value)
    self.due_date = Date.strptime(value, '%m/%d/%Y') + 1.minute rescue nil
  end
end