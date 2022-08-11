class Gig < ApplicationRecord
  include AASM

  belongs_to :creator
  has_many :gig_payments
  enum state: {
    applied: 0,
    accepted: 1,
    completed: 2,
    paid: 3
  }

  aasm column: :state, enum: true do
    state :applied, initial: true
    state :accepted
    state :completed, before_enter: :completed_event_listener
    state :paid
  end

  def completed_event_listener
    GigPayment.create("gig": self)
  end
end
