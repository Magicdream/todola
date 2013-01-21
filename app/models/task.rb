class Task < ActiveRecord::Base
  # 1 - high
  # 2 - medium
  # 3 - low
  PRIORITIES = (1..3).to_a

  attr_accessible :name, :priority, :due_date

  belongs_to :user

  validates :name, :state, presence: true
  validates :name, length: { maximum: 255 }
  validates :priority, inclusion: { in: PRIORITIES }

  state_machine :state, initial: :pending  do
    state :pending
    state :completed

    event :complete do
      transition pending: :completed
    end
  end

  def priority_sym
    case priority
    when 1 then :high
    when 2 then :medium
    when 3 then :low
    end
  end
end
